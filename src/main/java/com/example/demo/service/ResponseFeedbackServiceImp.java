package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.ResponseFeedback;
import com.example.demo.repositories.ResponseFeedbackRepository;

@Service("responseFeedbackService")
public class ResponseFeedbackServiceImp implements ResponseFeedbackService {

	@Autowired
	private ResponseFeedbackRepository responseFeedbackRepository;

	@Override
	public Iterable<ResponseFeedback> findAll() {
		return responseFeedbackRepository.findAll();
	}

	@Override
	public ResponseFeedback findByID(int id) {
		return responseFeedbackRepository.findByID(id);
	}

	@Override
	public Iterable<ResponseFeedback> findByFeedbackID(int feedbackID) {
		return responseFeedbackRepository.findByFeedbackID(feedbackID);
	}

	@Override
	public ResponseFeedback save(ResponseFeedback responseFeedback) {
		return responseFeedbackRepository.save(responseFeedback);
	}

}
