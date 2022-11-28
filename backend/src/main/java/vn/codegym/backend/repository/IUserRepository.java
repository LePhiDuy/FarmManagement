package vn.codegym.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import vn.codegym.backend.model.User;

import java.util.Optional;

@Repository
public interface IUserRepository extends JpaRepository<User, String> {
    @Query(value = "select * from user where username = ?1", nativeQuery = true)
    Optional<User> findByUsername(String username);
}