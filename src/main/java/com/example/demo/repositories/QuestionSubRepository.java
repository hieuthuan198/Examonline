package com.example.demo.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.QuestionSub;
import com.example.demo.entities.ResponseFeedback;

@Repository("questionSubRepository")
public interface QuestionSubRepository extends CrudRepository<QuestionSub, Integer> {

	@Query(value = "from QuestionSub where question.id = :questionID and coprrect = 1")
	public Iterable<QuestionSub> findAllCorrect(@Param("questionID") int questionID);
	
	@Query("from QuestionSub where question.id = :id")
	public Iterable<QuestionSub> findByQuestionID(@Param("id") int questionID);
}
