package com.example.demo.service;

import org.springframework.data.repository.query.Param;

import com.example.demo.entities.AccountRole;

public interface AccountRoleService{
	public Iterable<AccountRole> findByRole(int roleID);
	
	public AccountRole save(AccountRole accountRole);
	
	public Iterable<AccountRole> findByAll();
	
	public AccountRole findByID(int id);

}
