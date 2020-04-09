package com.example.demo.service;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.example.demo.entities.Account;


public interface AccountService extends UserDetailsService{
	public Account findByUsername(String username);
	public Account find(int id);
	public Account save(Account account);
	public Iterable<Account> findAll();
	public Iterable<Account> findAllTeacher();
	
	public Iterable<Account> findLikeUsername(String username);
}
