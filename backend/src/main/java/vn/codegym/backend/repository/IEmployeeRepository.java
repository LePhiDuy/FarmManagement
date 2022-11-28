package vn.codegym.backend.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import vn.codegym.backend.model.Employee;

import java.util.Optional;

public interface IEmployeeRepository extends JpaRepository<Employee, Long> {
    @Query(value = "select * from employee where email = ?1", nativeQuery = true)
    Optional<Employee> findByEmail(String email);
    @Query(value = "select employee.id, employee.name, employee.username, employee.gender, employee.email, employee.img_url, employee.birthday, \n" +
            "employee.identity_number, `user`.username, `user`.password from ((employee\n" +
            "inner join `user`\n" +
            "on employee.username = `user`.username)\n" +
            "inner join `user_role` on `user`.username = `user_role`.username)\n" +
            "where `user_role`.role_id != 1", nativeQuery = true)
    Page<Employee> findAll(Pageable pageable);
}
