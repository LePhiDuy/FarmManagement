package vn.codegym.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import vn.codegym.backend.model.Employee;
import vn.codegym.backend.service.IEmployeeService;

import java.util.Optional;

@RestController
@CrossOrigin
@RequestMapping("api/employee")
public class EmployeeController {
    @Autowired
    private IEmployeeService employeeService;

    @GetMapping
    public ResponseEntity<Page<Employee>> findAllEmployee(@PageableDefault(value = 8) Pageable pageable) {
        Page<Employee> employees = employeeService.findAll(pageable);
        return new ResponseEntity<>(employees, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Employee>  deleteEmployee(@PathVariable Long id) {
        Optional<Employee> employeeOptional = employeeService.findById(id);
        if (!employeeOptional.isPresent()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        employeeService.delete(id);
        return new ResponseEntity<>(employeeOptional.get(), HttpStatus.OK);
    }

}
