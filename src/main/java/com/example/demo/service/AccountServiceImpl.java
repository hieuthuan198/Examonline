package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Account;
import com.example.demo.entities.AccountRole;
import com.example.demo.repositories.AccountRepository;

@Service("accountService")
public class AccountServiceImpl implements AccountService {

	@Autowired
	private AccountRepository accountRepository;

	@Override
	public Account findByUsername(String username) {
		return accountRepository.findByUsername(username);
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Account account = accountRepository.findByUsername(username);
		if (account == null) {
			throw new UsernameNotFoundException("User name not found");
		}
		List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
		for (AccountRole accountRole : account.getAccountRoles()) {
			grantedAuthorities.add(new SimpleGrantedAuthority(accountRole.getRole().getName()));
		}
		return new org.springframework.security.core.userdetails.User(username, account.getPassword(),
				grantedAuthorities);
	}

	@Override
	public Account find(int id) {
		return accountRepository.findById(id).get();
	}

	@Override
	public Account save(Account account) {
		return accountRepository.save(account);
	}

	@Override
	public Iterable<Account> findAll() {
		return accountRepository.findAll();
	}

	@Override
	public Iterable<Account> findAllTeacher() {

		return null;
	}
	
	@Override
	public Iterable<Account> findLikeUsername(String username) {
		return accountRepository.findLikeUsername(username);
	}

}
