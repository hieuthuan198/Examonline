package com.example.demo.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Account;

@Repository("accountRepository")
public interface AccountRepository extends CrudRepository<Account, Integer>{
	@Query("from Account where username = :username")
	public Account findByUsername(@Param("username") String username);
	
	@Query("from Account where username like %:username%")
	public Iterable<Account> findLikeUsername(@Param("username") String username);
}
