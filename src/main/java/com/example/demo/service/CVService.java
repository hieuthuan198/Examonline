package com.example.demo.service;

import org.springframework.data.repository.query.Param;

import com.example.demo.entities.Cv;

public interface CVService {
	public Iterable<Cv> findAll();

	public Iterable<Cv> findAllByAccountId(int accountID);

	public Cv save(Cv cv);

	public Iterable<Cv> findAllByAccountIdAndSubjectID(int accountID, int subjectID);

	public Iterable<Cv> findAllByAccountIdAndSubjectIDAndStatus(int accountID, int subjectID, int status);

	public Iterable<Cv> findAllByAccountIdAndStatus(int accountID, int status);

	public Iterable<Cv> findAllBySubjectID(int subjectID);

	public Iterable<Cv> findAllBySubjectIDAndStatus(int subjectID, int status);

	public Iterable<Cv> findAllByStatus(int status);
	
	public Cv findById(int cvID);

}
