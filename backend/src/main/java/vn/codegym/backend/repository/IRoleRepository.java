package vn.codegym.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import vn.codegym.backend.model.Role;

import java.util.List;

@Repository
public interface IRoleRepository extends JpaRepository<Role, Integer> {
    @Query(value = "select * from role where name = ?1", nativeQuery = true)
    List<Role> findByName(String name);
}