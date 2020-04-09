package com.example.demo.service;

import com.example.demo.entities.ExamQuestion;;

public interface ExamQuestionService {
	Iterable<ExamQuestion> findAll();

	public ExamQuestion save(ExamQuestion examQuestion);

	public Iterable<ExamQuestion> findAllByExamID(int examID);
	
	public ExamQuestion findByExamQuestionID(int examQuestionId);

}
