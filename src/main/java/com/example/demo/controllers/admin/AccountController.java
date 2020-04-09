package com.example.demo.controllers.admin;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entities.Account;
import com.example.demo.entities.AccountRole;
import com.example.demo.entities.Role;
import com.example.demo.service.AccountRoleService;
import com.example.demo.service.AccountService;
import com.example.demo.service.RoleService;

@Controller
@RequestMapping(value = { "admin/account" })
public class AccountController {
	@Autowired
	private AccountService accountService;
	@Autowired
	private AccountRoleService accountRoleService;

	@Autowired
	private RoleService roleService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String cvGet(ModelMap modelMap) {
		List<AccountRole> accountRoles = (List<AccountRole>) accountRoleService.findByAll();

		List<Role> roles = (List<Role>) roleService.findAll();
		modelMap.put("roles", roles);
		modelMap.put("accountRoles", accountRoles);
		modelMap.put("selectedRole", 0);
		return "admin.listaccount";
	}

	@RequestMapping(value = { "", "index" }, method = RequestMethod.POST)
	public String cvPost(ModelMap modelMap, @RequestParam("role") @Valid int selectedRole) {
		List<AccountRole> accountRoles = new ArrayList<AccountRole>();
		if (selectedRole != 0) {
			accountRoles = (List<AccountRole>) accountRoleService.findByRole(selectedRole);
		} else {
			accountRoles = (List<AccountRole>) accountRoleService.findByAll();
		}

		List<Role> roles = (List<Role>) roleService.findAll();
		modelMap.put("roles", roles);
		modelMap.put("accountRoles", accountRoles);
		modelMap.put("selectedRole", selectedRole);
		return "admin.listaccount";
	}

	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detailNull(ModelMap modelMap) {
		List<AccountRole> accountRoles = (List<AccountRole>) accountRoleService.findByAll();

		List<Role> roles = (List<Role>) roleService.findAll();
		modelMap.put("roles", roles);
		modelMap.put("accountRoles", accountRoles);
		modelMap.put("selectedRole", 0);
		return "admin.listaccount";
	}
	
	@RequestMapping(value = "detail/{roleID}", method = RequestMethod.GET)
	public String detail(ModelMap modelMap, @PathVariable("roleID") int id) {
		AccountRole accountRole = accountRoleService.findByID(id);
		modelMap.put("accountRole", accountRole);
		return "admin.detailaccount";
	}
}
