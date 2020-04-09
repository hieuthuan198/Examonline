package com.example.demo.controllers.teacher;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.apache.catalina.authenticator.SpnegoAuthenticator.AuthenticateAction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.entities.Account;
import com.example.demo.entities.AccountRole;
import com.example.demo.entities.Feedback;
import com.example.demo.entities.ResponseFeedback;
import com.example.demo.entities.Subject;
import com.example.demo.service.AccountRoleService;
import com.example.demo.service.AccountService;
import com.example.demo.service.FeedbackService;
import com.example.demo.service.ResponseFeedbackService;

@Controller
@RequestMapping(value = { "teacher/feedback" })
public class TeacherFeedbackController {
	@Autowired
	private AccountRoleService accountRoleService;

	@Autowired
	private AccountService accountService;

	@Autowired
	private FeedbackService feedbackService;
	@Autowired
	private ResponseFeedbackService responseFeedbackService;

	@RequestMapping(method = RequestMethod.GET)
	public String feedbackGet(ModelMap modelMap) {
		List<AccountRole> accountRoles = (List<AccountRole>) accountRoleService.findByRole(1);
		modelMap.put("accountRoles", accountRoles);
		return "teacher.feedback";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String feedbackPost(ModelMap modelMap, Authentication authentication,
			@RequestParam("accountID") @Valid int accountID, @RequestParam("subject") String subject,
			@RequestParam("content") String content) {
		Account accountForm = accountService.findByUsername(authentication.getName());
		if (!subject.trim().equalsIgnoreCase("") && !content.trim().equalsIgnoreCase("")) {
			if(subject.trim().length() < 250 && content.trim().length() < 250) {
				Account accountTo = accountService.find(accountID);
				Feedback feedback = new Feedback();
				feedback.setAccountByFromId(accountForm);
				feedback.setAccountByToId(accountTo);
				feedback.setSubject(subject.trim());
				feedback.setContent(content.trim());
				feedback.setCreateTime(new Date());
				feedback = feedbackService.save(feedback);
				return "redirect:/teacher/feedback/list";
			}
		}
		
		return "redirect:/teacher/feedback";
	}

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String listfeedbackGet(ModelMap modelMap, Authentication authentication) {

		Account account = accountService.findByUsername(authentication.getName());
		List<Feedback> feedbacks = (List<Feedback>) feedbackService.findByAccountID(account.getId());
		for (Feedback feedback : (List<Feedback>) feedbackService.findByToAccountID(account.getId())) {
			feedbacks.add(feedback);
		}
		modelMap.put("feedbacks", feedbacks);
		return "teacher.listfeedback";
	}
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public String listfeedbackPost(ModelMap modelMap, @RequestParam("username") String username, Authentication authentication) {
		
		List<Account> accounts = new ArrayList<Account>();

		if (!username.equalsIgnoreCase("")) {
			accounts = (List<Account>) accountService.findLikeUsername(username);
		} else {
			accounts = (List<Account>) accountService.findAll();
		}
		List<Feedback> feedbacks = new ArrayList<Feedback>();
		for (Account account : accounts) {
			for(Feedback feedback : (List<Feedback>) feedbackService.findByToAndFromAccountID(account.getId(), accountService.findByUsername(authentication.getName()).getId())) {
				feedbacks.add(feedback);
			}
			for(Feedback feedback : (List<Feedback>) feedbackService.findByToAndFromAccountID(accountService.findByUsername(authentication.getName()).getId(),account.getId() )) {
				feedbacks.add(feedback);
			}
		}
		modelMap.put("username", username);
		modelMap.put("feedbacks", feedbacks);
		return "teacher.listfeedback";
	}

	@RequestMapping(value = "repply", method = RequestMethod.GET)
	public String repplyGetNull(ModelMap modelMap, Authentication authentication) {
		Account account = accountService.findByUsername(authentication.getName());
		List<Feedback> feedbacks = (List<Feedback>) feedbackService.findByAccountID(account.getId());
		for (Feedback feedback : (List<Feedback>) feedbackService.findByToAccountID(account.getId())) {
			feedbacks.add(feedback);
		}
		modelMap.put("feedbacks", feedbacks);
		return "teacher.listfeedback";
	}

	@RequestMapping(value = "repply/{feedbackID}", method = RequestMethod.GET)
	public String editGet(@PathVariable("feedbackID") int feedbackID, ModelMap modelMap, Authentication authentication) {
		
		Account account = accountService.findByUsername(authentication.getName());
		List<Feedback> feedbacks = (List<Feedback>) feedbackService.findByAccountID(account.getId());
		for (Feedback feedback : (List<Feedback>) feedbackService.findByToAccountID(account.getId())) {
			feedbacks.add(feedback);
		}
		for (Feedback feedback : feedbacks) {
			if(feedback.getId()==feedbackID) {
				Feedback feedback2 = feedbackService.findByID(feedbackID);
				List<ResponseFeedback> responseFeedbacks = (List<ResponseFeedback>) responseFeedbackService
						.findByFeedbackID(feedback2.getId());
				modelMap.put("feedback", feedback2);
				modelMap.put("responseFeedbacks", responseFeedbacks);
				return "teacher.repfeedback";
			}
		}
		return "redirect:/teacher/feedback/list";
	}

	@RequestMapping(value = "repply", method = RequestMethod.POST)
	public String editPost(Authentication authentication, ModelMap modelMap, @RequestParam("id") int id,
			@RequestParam("content") String content) {
		if (!content.trim().equalsIgnoreCase("") && content.trim().length() <250) {
			Account account = accountService.findByUsername(authentication.getName());
			ResponseFeedback responseFeedback = new ResponseFeedback();
			Feedback feedback = feedbackService.findByID(id);

			responseFeedback.setContent(content.trim());
			responseFeedback.setFeedback(feedback);
			responseFeedback.setAccount(account);
			responseFeedback.setCreateTime(new Date());
			responseFeedbackService.save(responseFeedback);
			List<ResponseFeedback> responseFeedbacks = (List<ResponseFeedback>) responseFeedbackService
					.findByFeedbackID(feedback.getId());

			modelMap.put("feedback", feedback);
			modelMap.put("responseFeedbacks", responseFeedbacks);
		} else {
			Feedback feedback = feedbackService.findByID(id);
			List<ResponseFeedback> responseFeedbacks = (List<ResponseFeedback>) responseFeedbackService
					.findByFeedbackID(feedback.getId());
			modelMap.put("feedback", feedback);
			modelMap.put("responseFeedbacks", responseFeedbacks);
		}
		return "teacher.repfeedback";
	}
}
