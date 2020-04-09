package com.example.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.AccountRole;
import com.example.demo.entities.Exam;

@Repository("accountRoleRepository")
public interface AccountRoleRepository extends CrudRepository<AccountRole, Integer> {
	@Query(value = "from AccountRole where role.id = :id")
	public List<AccountRole> findByRole(@Param("id") int id);
	
	@Query(value = "from AccountRole where id = :id")
	public AccountRole findByID(@Param("id") int id);

}
