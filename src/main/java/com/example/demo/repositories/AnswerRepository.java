package com.example.demo.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Answer;

@Repository("answerRepository")
public interface AnswerRepository extends CrudRepository<Answer, Integer> {

	@Query(value = "from Answer where examQuestion.id = :id")
	public Iterable<Answer> findAllByExamQuestionID(@Param("id") int examQuestionID);
}
