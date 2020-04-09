package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.ExamQuestion;
import com.example.demo.repositories.ExamQuestionRepository;


@Service("examQuestionService")
public class ExamQuestionServiceImpl implements ExamQuestionService {

	@Autowired
	private ExamQuestionRepository examQuestionRepository;

	@Override
	public Iterable<ExamQuestion> findAll() {
		return examQuestionRepository.findAll();
	}

	@Override
	public ExamQuestion save(ExamQuestion examQuestion) {
		return examQuestionRepository.save(examQuestion);
	}

	@Override
	public Iterable<ExamQuestion> findAllByExamID(int examID) {
		return examQuestionRepository.findAllByExamID(examID);
	}

	@Override
	public ExamQuestion findByExamQuestionID(int examQuestionId) {
		return examQuestionRepository.findByExamQuestionID(examQuestionId);
	}	
}
