package com.example.demo.service;

import com.example.demo.entities.Answer;

public interface AnswerService {
	Iterable<Answer> findAll();

	public Answer save(Answer answer);

	public Iterable<Answer> findAllByExamQuestionID(int examQuestionID);

}
