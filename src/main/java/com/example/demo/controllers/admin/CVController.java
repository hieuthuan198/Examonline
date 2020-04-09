package com.example.demo.controllers.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entities.Account;
import com.example.demo.entities.Cv;
import com.example.demo.entities.Question;
import com.example.demo.entities.QuestionSub;
import com.example.demo.entities.Subject;
import com.example.demo.service.AccountService;
import com.example.demo.service.CVService;
import com.example.demo.service.SubjectService;

@Controller
@RequestMapping(value = { "admin/cv" })
public class CVController {
	@Autowired
	private SubjectService subjectService;

	@Autowired
	private AccountService accountService;

	@Autowired
	private CVService cvService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String cv(ModelMap modelMap) {
		List<Subject> subjects = (List<Subject>) subjectService.findAll();
		List<Account> accounts = (List<Account>) accountService.findAll();

		List<Cv> cvs = (List<Cv>) cvService.findAll();

		modelMap.put("selectedAccount", 0);
		modelMap.put("selectedSubject", 0);
		modelMap.put("selectedStatus", 3);

		modelMap.put("subjects", subjects);
		modelMap.put("accounts", accounts);
		modelMap.put("cvs", cvs);
		return "admin.listcv";
	}

	@RequestMapping(value = { "", "index" }, method = RequestMethod.POST)
	public String cvPost(ModelMap modelMap, @RequestParam("account") Integer selectedAccount,
			@RequestParam("subject") Integer selectedSubject, @RequestParam("status") Integer selectedStatus) {

		List<Subject> subjects = (List<Subject>) subjectService.findAll();
		List<Account> accounts = (List<Account>) accountService.findAll();

		List<Cv> cvs = new ArrayList<Cv>();

		if (selectedAccount == 0 && selectedSubject == 0 && selectedStatus == 3) {
			cvs = (List<Cv>) cvService.findAll();
		} else if (selectedAccount == 0 && selectedSubject == 0) {
			cvs = (List<Cv>) cvService.findAllByStatus(selectedStatus);
		} else if (selectedSubject == 0 && selectedStatus == 3) {
			cvs = (List<Cv>) cvService.findAllByAccountId(selectedAccount);
		} else if (selectedAccount == 0 && selectedStatus == 3) {
			cvs = (List<Cv>) cvService.findAllBySubjectID(selectedSubject);
		} else if (selectedAccount == 0) {
			cvs = (List<Cv>) cvService.findAllBySubjectIDAndStatus(selectedSubject, selectedStatus);
		} else if (selectedSubject == 0) {
			cvs = (List<Cv>) cvService.findAllByAccountIdAndStatus(selectedAccount, selectedStatus);
		} else if (selectedStatus == 3) {
			cvs = (List<Cv>) cvService.findAllByAccountIdAndSubjectID(selectedAccount, selectedSubject);
		} else {
			cvs = (List<Cv>) cvService.findAllByAccountIdAndSubjectIDAndStatus(selectedAccount, selectedSubject,
					selectedStatus);
		}

		modelMap.put("subjects", subjects);
		modelMap.put("accounts", accounts);
		modelMap.put("cvs", cvs);
		modelMap.put("selectedAccount", selectedAccount);
		modelMap.put("selectedSubject", selectedSubject);
		modelMap.put("selectedStatus", selectedStatus);
		return "admin.listcv";
	}

	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detailNull(ModelMap modelMap) {
		List<Subject> subjects = (List<Subject>) subjectService.findAll();
		List<Account> accounts = (List<Account>) accountService.findAll();

		List<Cv> cvs = (List<Cv>) cvService.findAll();

		modelMap.put("selectedAccount", 0);
		modelMap.put("selectedSubject", 0);
		modelMap.put("selectedStatus", 3);

		modelMap.put("subjects", subjects);
		modelMap.put("accounts", accounts);
		modelMap.put("cvs", cvs);
		return "admin.listcv";
	}

	@RequestMapping(value = "detail/{cvid}", method = RequestMethod.GET)
	public String detail(ModelMap modelMap,@PathVariable("cvid") int id) {
		Cv cv = cvService.findById(id);
		
		modelMap.put("cv", cv);
		return "admin.detailcv";
	}
	
	@RequestMapping(value = "accept", method = RequestMethod.POST)
	public String confirm(ModelMap modelMap, @RequestParam("id") int id) {
		Cv cv = cvService.findById(id);
		cv.setStatus(1);
		cv = cvService.save(cv);
		modelMap.put("cv", cv);
		return "redirect:/admin/cv/detail/" + cv.getId();
	}

	@RequestMapping(value = "refuse", method = RequestMethod.POST)
	public String refuse(ModelMap modelMap, @RequestParam("id") int id) {
		Cv cv = cvService.findById(id);
		cv.setStatus(2);
		cv = cvService.save(cv);
		modelMap.put("cv", cv);
		return "redirect:/admin/cv/detail/" + cv.getId();
	}
}
