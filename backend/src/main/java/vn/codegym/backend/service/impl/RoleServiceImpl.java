package vn.codegym.backend.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.codegym.backend.model.Role;
import vn.codegym.backend.repository.IRoleRepository;
import vn.codegym.backend.service.IRoleService;

import java.util.List;

@Service
public class RoleServiceImpl implements IRoleService {
    @Autowired
    private IRoleRepository roleRepository;

    public List<Role> findByName(String name) {
        return this.roleRepository.findByName(name);
    }
}
