package com.example.demo.service;

import com.example.demo.entities.ResponseFeedback;

public interface ResponseFeedbackService {
	public ResponseFeedback save(ResponseFeedback responseFeedback);
	public Iterable<ResponseFeedback> findAll();
	public ResponseFeedback findByID(int id);

	public Iterable<ResponseFeedback> findByFeedbackID(int feedbackID);
}
