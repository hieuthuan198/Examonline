package com.example.demo.controller.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.entities.Account;
import com.example.demo.service.AccountService;


	@Controller
	@RequestMapping(value = "home" )
	public class Home1Controller {
		@Autowired
		private AccountService accountService;

		@RequestMapping(value = "index",method = RequestMethod.GET)
		public String index() {
			return "home.index";

		}
		
		@RequestMapping(value = "register", method = RequestMethod.GET)
		public String register() {
			return "home.register";
			
		}
		
		@RequestMapping(value = "login",method = RequestMethod.GET)
		public String login() {
			return "login.login";

		}
		@RequestMapping(value = "create",method = RequestMethod.POST)
		public String register(ModelMap modelMap, @ModelAttribute("Account") Account account) {
			
			return"home.register";
			
		}
}
