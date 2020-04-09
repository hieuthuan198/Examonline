package com.example.demo.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Cv;
import com.example.demo.entities.Subject;

@Repository("cvRepository")
public interface CVRepository extends CrudRepository<Cv, Integer>{
	public Iterable<Cv> findAll();
	@Query(value = "from Cv where id = :id")
	public Cv findById(@Param("id") int cvID);
	
	@Query(value = "from Cv where account.id = :id")
	public Iterable<Cv> findAllByAccountId(@Param("id") int accountID);

	@Query(value = "from Cv where account.id = :acid and subject.id = :sjid")
	public Iterable<Cv> findAllByAccountIdAndSubjectID(@Param("acid") int accountID,@Param("sjid") int subjectID);
	
	@Query(value = "from Cv where account.id = :acid and subject.id = :sjid and status= :status")
	public Iterable<Cv> findAllByAccountIdAndSubjectIDAndStatus(@Param("acid") int accountID,@Param("sjid") int subjectID, @Param("status") int status);
	
	@Query(value = "from Cv where account.id = :id and status= :status")
	public Iterable<Cv> findAllByAccountIdAndStatus(@Param("id") int accountID,@Param("status") int status);
	
	@Query(value = "from Cv where subject.id = :sjid")
	public Iterable<Cv> findAllBySubjectID(@Param("sjid") int subjectID);
	
	@Query(value = "from Cv where subject.id = :sjid and status= :status")
	public Iterable<Cv> findAllBySubjectIDAndStatus(@Param("sjid") int subjectID, @Param("status") int status);
	
	@Query(value = "from Cv where status= :status")
	public Iterable<Cv> findAllByStatus(@Param("status") int status);
	
}
