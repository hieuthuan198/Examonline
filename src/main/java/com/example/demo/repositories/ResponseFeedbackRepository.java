package com.example.demo.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.ResponseFeedback;

@Repository("responseFeedbackRepository")
public interface ResponseFeedbackRepository extends CrudRepository<ResponseFeedback, Integer> {
	@Query("from ResponseFeedback where id = :id")
	public ResponseFeedback findByID(@Param("id") int id);
	
	@Query("from ResponseFeedback where feedback.id = :id")
	public Iterable<ResponseFeedback> findByFeedbackID(@Param("id") int feedbackID);
}
