package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Exam;
import com.example.demo.repositories.ExamRepository;

@Service("examService")
public class ExamServiceImpl implements ExamService {

	@Autowired
	private ExamRepository examRepository;

	@Override
	public Iterable<Exam> findAll() {
		return examRepository.findAll();
	}

	@Override
	public Exam save(Exam exam) {
		return examRepository.save(exam);
	}

	@Override
	public Exam findByExamID(int examID) {
		return examRepository.findByExamID(examID);
	}

	@Override
	public Iterable<Exam> findByAccountID(int accountID) {

		return examRepository.findByAccountID(accountID);
	}

	@Override
	public Iterable<Exam> findBySubjectID(int subjectID) {
		return examRepository.findBySubjectID(subjectID);
	}

	@Override
	public Iterable<Exam> findByAccountIDAndSubjectID(int accountID, int subjectID) {
		return examRepository.findByAccountIDAndSubjectID(accountID, subjectID);
	}

}
