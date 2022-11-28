package vn.codegym.backend.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import vn.codegym.backend.model.User;
import vn.codegym.backend.service.IUserService;

import java.util.Optional;

@Service
public class MyUserDetailsServiceImpl implements UserDetailsService {
    @Autowired
    private IUserService userService;

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<User> user = this.userService.findByUsername(username);
        if (!user.isPresent()) {
            throw new UsernameNotFoundException("Username not found: " + username);
        } else {
            return new MyUserDetails(user.get());
        }
    }
}