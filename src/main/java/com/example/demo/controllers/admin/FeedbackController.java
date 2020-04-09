package com.example.demo.controllers.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entities.Account;
import com.example.demo.entities.Feedback;
import com.example.demo.entities.ResponseFeedback;
import com.example.demo.service.AccountRoleService;
import com.example.demo.service.AccountService;
import com.example.demo.service.FeedbackService;
import com.example.demo.service.ResponseFeedbackService;

@Controller
@RequestMapping(value = { "admin/feedback" })
public class FeedbackController {

	@Autowired
	private AccountService accountService;

	@Autowired
	private FeedbackService feedbackService;
	@Autowired
	private ResponseFeedbackService responseFeedbackService;

	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String listfeedbackGet(ModelMap modelMap, Authentication authentication) {
		Account account = accountService.findByUsername(authentication.getName());
		List<Feedback> feedbacks = (List<Feedback>) feedbackService.findByToAccountID(account.getId());
		modelMap.put("username", "");
		modelMap.put("feedbacks", feedbacks);
		return "admin.listfeedback";
	}

	@RequestMapping(value = "index", method = RequestMethod.POST)
	public String listfeedbackPost(ModelMap modelMap, @RequestParam("username") String username,
			Authentication authentication) {

		List<Account> accounts = new ArrayList<Account>();

		if (!username.equalsIgnoreCase("")) {
			accounts = (List<Account>) accountService.findLikeUsername(username);
		} else {
			accounts = (List<Account>) accountService.findAll();
		}
		List<Feedback> feedbacks = new ArrayList<Feedback>();
		for (Account account : accounts) {
			for (Feedback feedback : (List<Feedback>) feedbackService.findByToAndFromAccountID(account.getId(),
					accountService.findByUsername(authentication.getName()).getId())) {
				feedbacks.add(feedback);
			}
		}
		modelMap.put("username", username);
		modelMap.put("feedbacks", feedbacks);
		return "admin.listfeedback";
	}

	@RequestMapping(value = "repply", method = RequestMethod.GET)
	public String repplyGetNull(ModelMap modelMap, Authentication authentication) {
		Account account = accountService.findByUsername(authentication.getName());
		List<Feedback> feedbacks = (List<Feedback>) feedbackService.findByToAccountID(account.getId());
		modelMap.put("username", "");
		modelMap.put("feedbacks", feedbacks);
		return "admin.listfeedback";
	}

	@RequestMapping(value = "repply/{feedbackID}", method = RequestMethod.GET)
	public String editGet(@PathVariable("feedbackID") int feedbackID, ModelMap modelMap,
			Authentication authentication) {
		Account account = accountService.findByUsername(authentication.getName());
		List<Feedback> feedbacks = (List<Feedback>) feedbackService.findByToAccountID(account.getId());
		for (Feedback feedback : feedbacks) {
			if (feedback.getId() == feedbackID) {
				Feedback feedback2 = feedbackService.findByID(feedbackID);
				List<ResponseFeedback> responseFeedbacks = (List<ResponseFeedback>) responseFeedbackService
						.findByFeedbackID(feedback2.getId());
				modelMap.put("feedback", feedback2);
				modelMap.put("responseFeedbacks", responseFeedbacks);
				return "admin.repfeedback";
			}
		}
		return "redirect:/admin/feedback/index";
	}

	@RequestMapping(value = "repply", method = RequestMethod.POST)
	public String editPost(Authentication authentication, ModelMap modelMap, @RequestParam("id") int id,
			@RequestParam("content") String content) {
		if (!content.trim().equalsIgnoreCase("")) {
			if (content.trim().length() < 250) {
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
			}else {
				Feedback feedback = feedbackService.findByID(id);
				List<ResponseFeedback> responseFeedbacks = (List<ResponseFeedback>) responseFeedbackService
						.findByFeedbackID(feedback.getId());
				modelMap.put("feedback", feedback);
				modelMap.put("responseFeedbacks", responseFeedbacks);
			}
		} else {
			Feedback feedback = feedbackService.findByID(id);
			List<ResponseFeedback> responseFeedbacks = (List<ResponseFeedback>) responseFeedbackService
					.findByFeedbackID(feedback.getId());
			modelMap.put("feedback", feedback);
			modelMap.put("responseFeedbacks", responseFeedbacks);
		}

		return "admin.repfeedback";
	}
}
