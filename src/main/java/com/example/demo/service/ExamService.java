package com.example.demo.service;

import org.springframework.data.repository.query.Param;

import com.example.demo.entities.Exam;

public interface ExamService {
	Iterable<Exam> findAll();

	public Exam save(Exam exam);

	public Exam findByExamID(int examID);

	public Iterable<Exam> findByAccountID(int accountID);

	public Iterable<Exam> findBySubjectID(int subjectID);

	public Iterable<Exam> findByAccountIDAndSubjectID(int accountID, int subjectID);
}
