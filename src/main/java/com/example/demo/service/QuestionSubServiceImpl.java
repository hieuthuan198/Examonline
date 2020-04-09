package com.example.demo.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.QuestionSub;
import com.example.demo.repositories.QuestionSubRepository;
@Service("questionSubService")
public class QuestionSubServiceImpl implements QuestionSubService {

	@Autowired
	private QuestionSubRepository questionSubRepository;

	@Override
	public Iterable<QuestionSub> findAll() {
		return questionSubRepository.findAll();
	}

	@Override
	public QuestionSub find(int id) {
	
		return questionSubRepository.findById(id).get();
	}

	@Override
	public Iterable<QuestionSub> findAllCorrect(int questionID) {
		return questionSubRepository.findAllCorrect(questionID);
	}

	@Override
	public QuestionSub save(QuestionSub questionSub) {
		return questionSubRepository.save(questionSub);
	}

	@Override
	public Iterable<QuestionSub> findByQuestionID(int questionID) {
		return questionSubRepository.findByQuestionID(questionID);
	}

	
}
