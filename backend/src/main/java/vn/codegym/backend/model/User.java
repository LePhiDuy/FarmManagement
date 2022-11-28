package vn.codegym.backend.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import java.util.List;

@Entity
@Table(name = "user")
@Data
public class User {
    @Id
    @Column(name = "username")
    @Pattern(regexp = "^[a-zA-Z0-9_-]*$")
    private String username;
    @Column(name = "password")
    private String password;
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "user_role", joinColumns = {@JoinColumn(name = "username")},
            inverseJoinColumns = {@JoinColumn(name = "role_id")})
    private List<Role> roles;
    @OneToOne(mappedBy = "user")
    @JsonBackReference
    private Employee employee;
}