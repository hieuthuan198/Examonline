package com.example.demo.controller.home;

import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entities.Account;
import com.example.demo.entities.AccountRole;
import com.example.demo.entities.Role;
import com.example.demo.service.AccountRoleService;
import com.example.demo.service.AccountService;
import com.example.demo.service.RoleService;
import com.example.demo.validator.AccountValidator;


@Controller
@RequestMapping({ "student-register" })
public class StudentRegisterController {
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
		return "home.register";
	}

	@RequestMapping(value="save",method = RequestMethod.POST)
	public String register(@ModelAttribute("account") @Valid Account account,@ModelAttribute("roleaccount") AccountRole accountRole,
			@ModelAttribute("roles") Role role, BindingResult bindingResult,
			@RequestParam("password") String password,
			ModelMap modelMap) {
		accountValidator.validate(account, bindingResult);
		if (bindingResult.hasErrors()) {
			// modelMap.put("account", account);
			return "home.register";
		} else if (account.getUsername() != null && account.getPassword() != null) {
			try {
				//account.setPassword(new BCryptPasswordEncoder().encode(account.getPassword()));
			//	account.setPassword(new BCryptPasswordEncoder().encode(account.getPassword()));
				account.setPassword(BCrypt.hashpw(password,BCrypt.gensalt()));
				accountService.save(account);
				//Role role = new Role();
				//role = roleService.findById(3);
	
			//	AccountRole accountRole = new AccountRole();
				//accountRole.setAccount(account);
			//	accountRole.setRole(role);
				
				role.setId(3);
			
				accountRole.setAccount(account);
				accountRole.setRole(role);
				accountRoleService.save(accountRole);
			} catch (Exception e) {
				//System.out.print("---------------------------------->sssss");
				return "home.register";
				//e.printStackTrace();
				
			}
			return "login.login";
		}
		return "home.register";
	}

}
