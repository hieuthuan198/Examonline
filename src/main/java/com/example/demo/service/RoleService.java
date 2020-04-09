package com.example.demo.service;

import com.example.demo.entities.Role;

public interface RoleService {
	public Role findById(int roleID);
	public Iterable<Role> findAll();
}
