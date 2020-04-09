package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Cv;
import com.example.demo.repositories.CVRepository;

@Service("cvService")
public class CVServiceImpl implements CVService {

	@Autowired
	private CVRepository cvRepository;

	@Override
	public Iterable<Cv> findAllByAccountId(int accountID) {
		return cvRepository.findAllByAccountId(accountID);
	}

	@Override
	public Iterable<Cv> findAll() {
		return cvRepository.findAll();
	}

	@Override
	public Cv save(Cv cv) {
		return cvRepository.save(cv);
	}

	@Override
	public Iterable<Cv> findAllByAccountIdAndSubjectID(int accountID, int subjectID) {
		return cvRepository.findAllByAccountIdAndSubjectID(accountID, subjectID);
	}

	@Override
	public Iterable<Cv> findAllByAccountIdAndSubjectIDAndStatus(int accountID, int subjectID, int status) {
		return cvRepository.findAllByAccountIdAndSubjectIDAndStatus(accountID, subjectID, status);
	}

	@Override
	public Iterable<Cv> findAllByAccountIdAndStatus(int accountID, int status) {
		return cvRepository.findAllByAccountIdAndStatus(accountID, status);
	}

	@Override
	public Iterable<Cv> findAllBySubjectID(int subjectID) {
		return cvRepository.findAllBySubjectID(subjectID);
	}

	@Override
	public Iterable<Cv> findAllBySubjectIDAndStatus(int subjectID, int status) {
		return cvRepository.findAllBySubjectIDAndStatus(subjectID, status);
	}

	@Override
	public Iterable<Cv> findAllByStatus(int status) {
		return cvRepository.findAllByStatus(status);
	}

	@Override
	public Cv findById(int cvID) {
		return cvRepository.findById(cvID);
	}

}
