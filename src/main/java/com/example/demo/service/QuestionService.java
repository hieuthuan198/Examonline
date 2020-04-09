package com.example.demo.service;

import org.springframework.data.repository.query.Param;

import com.example.demo.entities.Question;;

public interface QuestionService{
	public Iterable<Question> findAll();
	public Question findByID(int id);
	
	public Iterable<Question> findAllBySubjectId(int subjectID);
	public Iterable<Question> findRandomBySubjectId(int subjectID,int numberOfColum);
	
	public Iterable<Question> findAllBySubjectIdAndStatus(int subjectID, int status);
	
	public Question save(Question question);
	
	public Iterable<Question> findAllByAccountIdAndSubjectID(int accountID, int subjectID);
	
	public Iterable<Question> findAllByAccountIdAndSubjectIDAndStatus(int accountID, int subjectID,int status);
	
	public Iterable<Question> findAllByAccountIdAndStatus(int accountID, int status);
	
	
	public Iterable<Question> findAllByAccountId(int accountID);
	
	
	public Iterable<Question> findAllBySubjectID(int subjectID);
	
	public Iterable<Question> findAllBySubjectIDAndStatus(int subjectID, int status);
	
	public Iterable<Question> findAllByStatus(int status);
}
