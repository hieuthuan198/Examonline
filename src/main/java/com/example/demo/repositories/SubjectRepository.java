package com.example.demo.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Subject;

@Repository("subjectRepository")
public interface SubjectRepository extends CrudRepository<Subject, Integer> {

	@Query(value = "from Subject where id = :subject_id")
	public Subject findById(@Param("subject_id") int subjectID);

//	@Query(value = "from Subject where account.id = :id")
//	public Iterable<Subject> findAllByAccountID(@Param("id") int accountID);
}
