package com.example.demo.validator;



import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.example.demo.entities.Subject;
@Component("subjectValidator")
public class SubjectValidator implements Validator {


	@Override
	public boolean supports(Class<?> clazz) {
		return Subject.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

	}

}
