package com.example.demo.service;

import org.springframework.data.repository.query.Param;

import com.example.demo.entities.Feedback;

public interface FeedbackService {
	
	public Iterable<Feedback> findAll();
	public Feedback findByID(int id);

	public Iterable<Feedback> findByAccountID(int id);
	
	public Feedback save(Feedback feedback);
	
	public Iterable<Feedback> findByToAccountID(int id);
	
	public Iterable<Feedback> findByToAndFromAccountID(int formID, int toID);
}
