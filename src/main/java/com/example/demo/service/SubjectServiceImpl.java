package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Subject;
import com.example.demo.repositories.SubjectRepository;

@Service("subjectService")
public class SubjectServiceImpl implements SubjectService {

	@Autowired
	private SubjectRepository subjectRepository;

	@Override
	public Iterable<Subject> findAll() {
		return subjectRepository.findAll();
	}

	@Override
	public Subject findById(int subjectID) {
		return subjectRepository.findById(subjectID);
	}

	@Override
	public Subject save(Subject subject) {
		return subjectRepository.save(subject);
	}

	
	
}
