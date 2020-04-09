package com.example.demo.controllers.teacher;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.entities.Account;
import com.example.demo.entities.AccountRole;
import com.example.demo.entities.Role;
import com.example.demo.service.AccountRoleService;
import com.example.demo.service.AccountService;
import com.example.demo.service.RoleService;
import com.example.demo.validator.AccountValidator;

@Controller
@RequestMapping({ "teacher-register" })
public class TeacherRegisterController {
	@Autowired
	private AccountService accountService;

	@Autowired
	private AccountRoleService accountRoleService;

	@Autowired
	private RoleService roleService;

	@Autowired
	private AccountValidator accountValidator;

	@RequestMapping(method = RequestMethod.GET)
	public String register(ModelMap modelMap) {
		Account account = new Account();
		account.setGender(true);
		modelMap.addAttribute("account", account);
		return "teacher.register";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String register(@ModelAttribute("account") @Valid Account account, BindingResult bindingResult,
			ModelMap modelMap) {
		accountValidator.validate(account, bindingResult);
		if (bindingResult.hasErrors()) {
			// modelMap.put("account", account);
			return "teacher.register";
		} else if (account.getUsername() != null && account.getPassword() != null) {
			try {
				account.setPassword(new BCryptPasswordEncoder().encode(account.getPassword()));
				account.setGems(2);
				accountService.save(account);
				Role role = new Role();
				role = roleService.findById(2);
				AccountRole accountRole = new AccountRole();
				accountRole.setAccount(account);
				accountRole.setRole(role);

				accountRoleService.save(accountRole);
			} catch (Exception e) {
				return "teacher.register";
			}
			return "redirect:/teacher-panel";
		}
		return "teacher.register";
	}

}
