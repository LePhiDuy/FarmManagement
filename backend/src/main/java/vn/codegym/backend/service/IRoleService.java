package vn.codegym.backend.service;

import vn.codegym.backend.model.Role;

import java.util.List;

public interface IRoleService {
    List<Role> findByName(String name);
}

