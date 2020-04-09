package com.example.demo.validator;



import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;


import com.example.demo.entities.Account;
@Component("accountValidator")
public class AccountValidator implements Validator {


	@Override
	public boolean supports(Class<?> clazz) {
		return Account.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Account account = (Account) target;
		
		if(account.getUsername().equalsIgnoreCase("username")) {
			errors.rejectValue("username", "account.username.exists");
		}
	}

}
