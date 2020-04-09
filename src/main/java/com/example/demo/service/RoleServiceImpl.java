package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Role;
import com.example.demo.repositories.RoleRepository;

@Service("roleService")
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleRepository roleRepository;

	@Override
	public Role findById(int roleID) {

		return roleRepository.findById(roleID);
	}

	@Override
	public Iterable<Role> findAll() {
		return roleRepository.findAll();
	}

}
