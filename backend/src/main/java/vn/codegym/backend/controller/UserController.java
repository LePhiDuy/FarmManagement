package vn.codegym.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import vn.codegym.backend.model.User;
import vn.codegym.backend.security.JwtUtil;
import vn.codegym.backend.service.IUserService;

import java.util.Optional;

@RestController
@CrossOrigin
@RequestMapping("/api/user")
public class UserController {
    @Autowired
    private IUserService userService;
    @Autowired
    private JwtUtil jwtUtil;
    @GetMapping("/getUserFromToken")
    public ResponseEntity<User> getUserFormToken(@RequestParam String token)  {
        String username = jwtUtil.getUsernameFromToken(token);
        Optional<User> userOptional = userService.findByUsername(username);

        if(!userOptional.isPresent())
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        return new ResponseEntity<>(userOptional.get(), HttpStatus.OK);
    }
}
