package com.example.demo.controllers.admin;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
@RequestMapping(value = {"admin-panel"})
public class LoginAdminController {
	@RequestMapping(value = { "", "login" }, method = RequestMethod.GET)
	// required de error co hoac k
	public String index(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, ModelMap modelMap) {
		if (error != null) {
			modelMap.put("mess", "Login failed");
		}
		if (logout != null) {
			modelMap.put("mes", "Logout success");
		}
		String password = new BCryptPasswordEncoder().encode("123");
		System.out.println(password);
		return "login_admin.admin_login";
	}

	@RequestMapping(value = "accessdenied", method = RequestMethod.GET)
	public String accessdenied() {
		return "login.accessdenied";
	}
		
}
