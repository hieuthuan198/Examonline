package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Feedback;
import com.example.demo.repositories.FeedbackRepository;

@Service("feedbackService")
public class FeedbackServiceImp implements FeedbackService{

	@Autowired
	private FeedbackRepository feedbackRepository;
	
	@Override
	public Iterable<Feedback> findAll() {
		return feedbackRepository.findAll();
	}

	@Override
	public Feedback findByID(int id) {
		return feedbackRepository.findByID(id);
	}

	@Override
	public Iterable<Feedback> findByAccountID(int id) {
		return feedbackRepository.findByAccountID(id);
	}

	@Override
	public Feedback save(Feedback feedback) {
		return feedbackRepository.save(feedback);
	}

	@Override
	public Iterable<Feedback> findByToAccountID(int id) {
		return feedbackRepository.findByToAccountID(id);
	}

	@Override
	public Iterable<Feedback> findByToAndFromAccountID(int formID, int toID) {
		return feedbackRepository.findByToAndFromAccountID(formID, toID);
	}

}
