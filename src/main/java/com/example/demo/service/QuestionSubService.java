package com.example.demo.service;

import org.springframework.data.repository.query.Param;

import com.example.demo.entities.QuestionSub;;

public interface QuestionSubService {
	public Iterable<QuestionSub> findAll();

	public QuestionSub find(int id);

	public Iterable<QuestionSub> findAllCorrect(int questionID);

	public QuestionSub save(QuestionSub questionSub);
	
	public Iterable<QuestionSub> findByQuestionID(int questionID);
}
