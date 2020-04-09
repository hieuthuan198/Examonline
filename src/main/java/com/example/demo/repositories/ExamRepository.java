package com.example.demo.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Exam;

@Repository("examRepository")
public interface ExamRepository extends CrudRepository<Exam, Integer> {
	
	@Query(value = "from Exam where id = :id")
	public Exam findByExamID(@Param("id") int examId);
	
	@Query(value = "from Exam where account.id = :id")
	public Iterable<Exam> findByAccountID(@Param("id") int accountID);
	
	@Query(value = "from Exam where subject.id = :id")
	public Iterable<Exam> findBySubjectID(@Param("id") int subjectID);
	
	@Query(value = "from Exam where account.id = :acid and subject.id = :sjid")
	public Iterable<Exam> findByAccountIDAndSubjectID(@Param("acid") int accountID, @Param("sjid") int subjectID);
}
