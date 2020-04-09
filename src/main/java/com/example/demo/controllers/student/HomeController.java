package com.example.demo.controllers.student;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.entities.Account;

@Controller
@RequestMapping(value = "student/home")
public class HomeController {

	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index() {
		return "student.indexHome";

	}

	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String register() {
		return "home.register";

	}

	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String register(ModelMap modelMap, @ModelAttribute("Account") Account account) {

		return "home.register";

	}
}
