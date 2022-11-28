package vn.codegym.backend.dto;

import lombok.Data;

@Data
public class ResetPassRequest {
    private String password;
    private String confirmPassword;
    private String token;
}
