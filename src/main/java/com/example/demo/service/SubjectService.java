package com.example.demo.service;

import com.example.demo.entities.Subject;

public interface SubjectService{
	Iterable<Subject> findAll();
	
	Subject findById(int subjectID);
	
	Subject save(Subject subject);

}
