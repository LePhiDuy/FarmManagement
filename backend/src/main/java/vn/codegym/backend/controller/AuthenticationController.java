package vn.codegym.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import vn.codegym.backend.model.Employee;
import vn.codegym.backend.dto.ResetPassRequest;
import vn.codegym.backend.model.User;
import vn.codegym.backend.payload.request.LoginRequest;
import vn.codegym.backend.payload.response.JwtResponse;
import vn.codegym.backend.payload.response.ResponseMessage;
import vn.codegym.backend.security.JwtUtil;
import vn.codegym.backend.security.MyUserDetails;
import vn.codegym.backend.service.IEmployeeService;
import vn.codegym.backend.service.IUserService;
import vn.codegym.backend.util.EmailService;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@CrossOrigin
@RequestMapping("/api/auth")
public class AuthenticationController {
    @Autowired
    private AuthenticationManager authenManager;
    @Autowired
    private JwtUtil jwtUtil;
    @Autowired
    private IEmployeeService employeeService;
    @Autowired
    private EmailService emailService;
    @Autowired
    private IUserService userService;

    @PostMapping("/login")
    public ResponseEntity<JwtResponse> authenticate(@Valid @RequestBody LoginRequest loginRequest) {
        Authentication authentication = this.authenManager.
                authenticate(new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword()));
        SecurityContextHolder.getContext().setAuthentication(authentication);

        MyUserDetails myUserDetails = (MyUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        List<String> roles = myUserDetails.getAuthorities().stream().
                map(GrantedAuthority::getAuthority).collect(Collectors.toList());

        String accessToken = this.jwtUtil.generateAccessToken(loginRequest.getUsername());
        JwtResponse jwtResponse = new JwtResponse(myUserDetails.getUsername(), accessToken, roles);
        return new ResponseEntity<>(jwtResponse, HttpStatus.OK);
    }

    @GetMapping("/forgot-password")
    public ResponseEntity<ResponseMessage> forgotPassword(@RequestParam String email){
        Optional<Employee> employeeOptional = employeeService.findByEmail(email);
        if (!employeeOptional.isPresent()) {
            return new ResponseEntity<>(new ResponseMessage("Email không tồn tại trong hệ thống"), HttpStatus.NOT_FOUND);
        }
        Employee employee = employeeOptional.get();
        String token = this.jwtUtil.generateAccessToken(employee.getUser().getUsername());
        String resetPasswordLink = "http://localhost:4200/authen/resetpassword/" + token;
        if (emailService.sendEmail(email, resetPasswordLink)) {
            return new ResponseEntity<>(new ResponseMessage("Gửi email thành công"), HttpStatus.OK);
        }
        return new ResponseEntity<>(new ResponseMessage("Gửi email thất bại"), HttpStatus.BAD_REQUEST);
    }

    @PostMapping("/reset-password")
    public ResponseEntity<ResponseMessage> resetPassword(@RequestBody ResetPassRequest request) {
        if (!jwtUtil.validateAccessToken(request.getToken())) {
            return new ResponseEntity<>(new ResponseMessage(jwtUtil.message), HttpStatus.BAD_REQUEST);
        }
        String username = jwtUtil.getUsernameFromToken(request.getToken());
        Optional<User> userOptional = userService.findByUsername(username);
        if (!userOptional.isPresent()) {
            return new ResponseEntity<>(new ResponseMessage("Không tìm thấy tài khoản của bạn."), HttpStatus.BAD_REQUEST);
        }
        if (!request.getPassword().equals(request.getConfirmPassword())) {
            return new ResponseEntity<>(new ResponseMessage("Mật khẩu không trùng khớp."), HttpStatus.BAD_REQUEST);
        }
        userService.updatePassword(userOptional.get(), request.getPassword());
        return new ResponseEntity<>(new ResponseMessage("Đổi mật khẩu thành công."), HttpStatus.OK);
    }
}
