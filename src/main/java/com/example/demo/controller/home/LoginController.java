package com.example.demo.controller.home;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entities.Account;



@Controller
@RequestMapping(value = {"student-panel"})
public class LoginController {


	@RequestMapping(value = { "", "login" }, method = RequestMethod.GET)
	public String index(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, ModelMap modelMap) {
		if (error != null) {
	
			modelMap.put("mess", "Login failed");
		}
		if (logout != null) {
			modelMap.put("mes", "Logout success");
		}

		return "login.login";
	}

	@RequestMapping(value = "accessdenied", method = RequestMethod.GET)
	public String accessdenied() {
		return "login.login";
	}
		
}
