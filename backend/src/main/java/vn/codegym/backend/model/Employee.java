package vn.codegym.backend.model;


import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "employee")
@Data
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private Date birthday;
    private String identityNumber;
    private boolean gender;
    private String email;
    private String img_url;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "username")
    private User user;
}
