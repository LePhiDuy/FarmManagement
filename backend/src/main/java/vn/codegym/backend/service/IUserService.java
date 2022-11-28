package vn.codegym.backend.service;

import vn.codegym.backend.model.User;

import java.util.Optional;

public interface IUserService {
    Optional<User> findByUsername(String username);
    void updatePassword(User user, String newPassword);
}