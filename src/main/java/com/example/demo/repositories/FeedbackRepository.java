package com.example.demo.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Feedback;

@Repository("feedbackRepository")
public interface FeedbackRepository extends CrudRepository<Feedback, Integer> {
	@Query("from Feedback where id = :id")
	public Feedback findByID(@Param("id") int id);
	
	@Query("from Feedback where accountByFromId.id = :id")
	public Iterable<Feedback> findByAccountID(@Param("id") int id);
	
	@Query("from Feedback where accountByToId.id = :id")
	public Iterable<Feedback> findByToAccountID(@Param("id") int id);
	
	@Query("from Feedback where accountByToId.id = :toid and accountByFromId.id = :fromid")
	public Iterable<Feedback> findByToAndFromAccountID(@Param("fromid") int formID,@Param("toid") int toID);
}
