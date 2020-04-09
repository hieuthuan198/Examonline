package com.example.demo.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.ExamQuestion;

@Repository("examQuestionRepository")
public interface ExamQuestionRepository extends CrudRepository<ExamQuestion, Integer> {

	@Query(value = "from ExamQuestion where exam.id = :id")
	public Iterable<ExamQuestion> findAllByExamID(@Param("id") int examID);

	@Query(value = "from ExamQuestion where exam.id = :id")
	public Iterable<ExamQuestion> findAllCorrect(@Param("id") int examID);
	
	@Query(value = "from ExamQuestion where id = :id")
	public ExamQuestion findByExamQuestionID(@Param("id") int examQuestionId);

}
