package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.AccountRole;
import com.example.demo.repositories.AccountRoleRepository;

@Service("accoutRoleService")
public class AccountRoleServiceImpl implements AccountRoleService {

	@Autowired
	private AccountRoleRepository accountRoleRepository;

	@Override
	public Iterable<AccountRole> findByRole(int roleID) {
		return accountRoleRepository.findByRole(roleID);
	}

	@Override
	public AccountRole save(AccountRole accountRole) {

		return accountRoleRepository.save(accountRole);
	}

	@Override
	public Iterable<AccountRole> findByAll() {
		return accountRoleRepository.findAll();
	}

	@Override
	public AccountRole findByID(int id) {
		return accountRoleRepository.findByID(id);
	}

	
}
