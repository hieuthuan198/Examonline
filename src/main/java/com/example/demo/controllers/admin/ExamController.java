package com.example.demo.controllers.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entities.Account;
import com.example.demo.entities.AccountRole;
import com.example.demo.entities.Cv;
import com.example.demo.entities.Exam;
import com.example.demo.entities.ExamQuestion;
import com.example.demo.entities.Question;
import com.example.demo.entities.Subject;
import com.example.demo.service.AccountRoleService;
import com.example.demo.service.ExamQuestionService;
import com.example.demo.service.ExamService;
import com.example.demo.service.QuestionService;
import com.example.demo.service.SubjectService;

@Controller
@RequestMapping(value = { "admin/exam" })
public class ExamController {

	@Autowired
	private ExamService examService;
	
	@Autowired
	private ExamQuestionService examQuestionService;
	
	@Autowired
	private QuestionService questionService;

	@Autowired
	private AccountRoleService accountRoleService;

	@Autowired
	private SubjectService subjectService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String examGet(ModelMap modelMap) {

		List<Exam> exams = (List<Exam>) examService.findAll();

		List<AccountRole> accountRoles = (List<AccountRole>) accountRoleService.findByRole(3);
		List<Account> accounts = new ArrayList<Account>();
		for (AccountRole accountRole : accountRoles) {
			accounts.add(accountRole.getAccount());
		}

		List<Subject> subjects = (List<Subject>) subjectService.findAll();

		modelMap.put("accounts", accounts);
		modelMap.put("subjects", subjects);
		modelMap.put("exams", exams);

		modelMap.put("selectedAccount", 0);
		modelMap.put("selectedSubject", 0);
		return "admin.listexam";
	}

	@RequestMapping(value = "list", method = RequestMethod.POST)
	public String listPost(ModelMap modelMap, @RequestParam("account") Integer selectedAccount,
			@RequestParam("subject") Integer selectedSubject) {

		List<Exam> exams = new ArrayList<Exam>();

		if (selectedAccount == 0 && selectedSubject == 0) {
			exams = (List<Exam>) examService.findAll();
		} else if (selectedAccount == 0) {
			exams = (List<Exam>) examService.findBySubjectID(selectedSubject);
		} else if (selectedSubject == 0) {
			exams = (List<Exam>) examService.findByAccountID(selectedAccount);
		} else {
			exams = (List<Exam>) examService.findByAccountIDAndSubjectID(selectedAccount, selectedSubject);
		}

		List<AccountRole> accountRoles = (List<AccountRole>) accountRoleService.findByRole(3);
		List<Account> accounts = new ArrayList<Account>();
		for (AccountRole accountRole : accountRoles) {
			accounts.add(accountRole.getAccount());
		}
		List<Subject> subjects = (List<Subject>) subjectService.findAll();

		modelMap.put("accounts", accounts);
		modelMap.put("subjects", subjects);
		modelMap.put("exams", exams);

		modelMap.put("selectedAccount", selectedAccount);
		modelMap.put("selectedSubject", selectedSubject);
		return "admin.listexam";
	}

	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detailNullParamGet() {
		return "redirect:/admin/exam";

	}

	@RequestMapping(value = "detail/{examID}", method = RequestMethod.GET)
	public String detailGet(@PathVariable("examID") int examID, ModelMap modelMap, Authentication authentication) {
		Exam exam = examService.findByExamID(examID);
		if (exam != null) {
			modelMap.put("examQuestions", exam.getExamQuestions());
			return "admin.resultDetail";
		}
		return "redirect:/admin/exam";
	}
	
	@RequestMapping(value = "questionDetail", method = RequestMethod.GET)
	public String questionDetailNullParamGet() {
		return "redirect:/admin/exam";
	}

	@RequestMapping(value = "questionDetail/{examQuestionID}", method = RequestMethod.GET)
	public String questionDetailGet(@PathVariable("examQuestionID") int examQuestionID, ModelMap modelMap, Authentication authentication) {	
		ExamQuestion examQuestion = examQuestionService.findByExamQuestionID(examQuestionID);
		if (examQuestion != null) {
			modelMap.put("examQuestion", examQuestion);
			return "admin.examQuestionDetail";
		}
		return "redirect:/admin/exam";
	}
}
