package com.example.demo.controllers.student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.entities.Account;
import com.example.demo.entities.Exam;
import com.example.demo.service.AccountService;
import com.example.demo.service.ExamService;

@Controller
@RequestMapping(value = { "student/resultList" })
public class StudentResultListController {

	@Autowired
	private ExamService examService;

	@Autowired
	private AccountService accountService;

	@RequestMapping(method = RequestMethod.GET)
	public String seeResults(ModelMap modelMap, Authentication authentication) {
		Account account = accountService.findByUsername(authentication.getName());
		List<Exam> exams = (List<Exam>) examService.findByAccountID(account.getId());
		modelMap.put("exams", exams);
		return "student.resultList";
	}

}
