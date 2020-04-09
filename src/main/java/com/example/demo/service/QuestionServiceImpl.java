package com.example.demo.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Question;
import com.example.demo.repositories.QuestionRepository;

@Service("questionService")
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private QuestionRepository questionRepository;

	@Override
	public Iterable<Question> findAll() {
		return questionRepository.findAll();
	}

	@Override
	public Iterable<Question> findAllBySubjectId(int subjectID) {
	
		return questionRepository.findAllBySubjectId(subjectID);
	}

	@Override
	public Iterable<Question> findRandomBySubjectId(int subjectID, int numberOfColum) {
		return null;
	}

	@Override
	public Iterable<Question> findAllBySubjectIdAndStatus(int subjectID, int status) {
		return questionRepository.findAllBySubjectIdAndStatus(subjectID, status);
	}

	@Override
	public Question save(Question question) {
		return questionRepository.save(question);
	}

	@Override
	public Iterable<Question> findAllByAccountIdAndSubjectID(int accountID, int subjectID) {
		return questionRepository.findAllByAccountIdAndSubjectID(accountID, subjectID);
	}

	@Override
	public Iterable<Question> findAllByAccountIdAndSubjectIDAndStatus(int accountID, int subjectID, int status) {
		return questionRepository.findAllByAccountIdAndSubjectIDAndStatus(accountID, subjectID, status);
	}

	@Override
	public Iterable<Question> findAllByAccountIdAndStatus(int accountID, int status) {
		return questionRepository.findAllByAccountIdAndStatus(accountID, status);
	}

	@Override
	public Iterable<Question> findAllByAccountId(int accountID) {
		return questionRepository.findAllByAccountId(accountID);
	}

	@Override
	public Iterable<Question> findAllBySubjectID(int subjectID) {
		return questionRepository.findAllBySubjectID(subjectID);
	}

	@Override
	public Iterable<Question> findAllBySubjectIDAndStatus(int subjectID,int status) {
		return questionRepository.findAllBySubjectIDAndStatus(subjectID, status);
	}

	@Override
	public Iterable<Question> findAllByStatus(int status) {
		return questionRepository.findAllByStatus(status);
	}

	@Override
	public Question findByID(int id) {
		return questionRepository.findByID(id);
	}
}
