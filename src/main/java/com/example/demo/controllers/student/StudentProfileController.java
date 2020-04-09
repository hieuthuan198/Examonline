package com.example.demo.controllers.student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.entities.Account;
import com.example.demo.service.AccountService;

@Controller
@RequestMapping(value = "student/profile")
public class StudentProfileController {

	@Autowired
	private AccountService accountService;

	@RequestMapping(method = RequestMethod.GET)
	public String profile(ModelMap modelMap, Authentication authentication) {

		Account account = accountService.findByUsername(authentication.getName());
		String gender = "";
		if (account.getGender()) {
			gender = "Male";
		} else {
			gender = "Female";
		}
		modelMap.put("account", account);
		modelMap.put("gender", gender);
		return "student.profile";
	}

}
