package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Answer;
import com.example.demo.repositories.AnswerRepository;

@Service("answerService")
public class AnswerServiceImpl implements AnswerService {

	@Autowired
	private AnswerRepository answerRepository;

	@Override
	public Iterable<Answer> findAll() {
		return answerRepository.findAll();
	}

	@Override
	public Answer save(Answer answer) {
		return answerRepository.save(answer);
	}

	@Override
	public Iterable<Answer> findAllByExamQuestionID(int examQuestionID) {
		return answerRepository.findAllByExamQuestionID(examQuestionID);
	}

}
