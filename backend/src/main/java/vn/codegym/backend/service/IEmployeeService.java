package vn.codegym.backend.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import vn.codegym.backend.model.Employee;

import java.util.Optional;

public interface IEmployeeService {
    Optional<Employee> findByEmail(String email);
    Page<Employee> findAll(Pageable pageable);
    void delete(Long id);
    Optional<Employee> findById(Long id);
}
