package vn.codegym.backend.payload.request;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Data
public class LoginRequest {
    @Pattern(regexp = "^[a-zA-Z0-9_-]*$")
    @NotBlank
    private String username;
    @NotBlank
    private String password;
}