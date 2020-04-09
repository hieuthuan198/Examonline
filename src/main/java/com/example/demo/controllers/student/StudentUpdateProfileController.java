package com.example.demo.controllers.student;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.entities.Account;
import com.example.demo.service.AccountService;
import com.example.demo.validator.AccountValidator;

@Controller
@RequestMapping(value = { "/student/updateProfile" })
public class StudentUpdateProfileController implements ServletContextAware {

	@Autowired
	private AccountValidator accountValidator;

	@Autowired
	private ServletContext servletContext;

	@Autowired
	private AccountService accountService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap, Authentication authentication) {
		Account account = accountService.findByUsername(authentication.getName());
		modelMap.put("account", account);
		return "student.updateProfile";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String register(@ModelAttribute("account") @Valid Account account, BindingResult bindingResult,
			@RequestParam("image") @Valid MultipartFile image, Authentication authentication, ModelMap modelMap) {
		accountValidator.validate(account, bindingResult);
		if (bindingResult.hasErrors()) {
			return "student.updateProfile";
		} else if (!image.getName().equalsIgnoreCase("")) {
			String duoi = getFileExtension(image.getOriginalFilename());
			if (duoi.equalsIgnoreCase("png") || duoi.equalsIgnoreCase("jpg")) {
				Account account2 = accountService.findByUsername(authentication.getName());
				account2.setFullname(account.getFullname().trim());
				account2.setEmail(account.getEmail().trim());
				account2.setNumberPhone(account.getNumberPhone().trim());
				account2.setAddress(account.getAddress().trim());
				account2.setAge(account.getAge());
				account2.setGender(account.getGender());

				accountService.save(account2);

				String fileName = saveFile(image, account2.getId().toString());
				return "redirect:/student/profile";
			}
			modelMap.put("err", "Image is not empty or not Image");
			modelMap.put("account", account);
			return "student.updateProfile";
		}
		modelMap.put("err", "Image is not empty or not Image");
		modelMap.put("account", account);
		return "student.updateProfile";
	}

	@Override
	public void setServletContext(ServletContext arg0) {
		// TODO Auto-generated method stub

	}

	private String saveFile(MultipartFile file, String fileName) {
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get(servletContext.getRealPath("/uploads/images/account/" + fileName + ".png"));
			Files.write(path, bytes);
			return fileName;
		} catch (Exception e) {
			System.err.println(e.getMessage());
			return null;
		}
	}

	private String getFileExtension(String fullName) {
		String fileName = new File(fullName).getName();
		int dotIndex = fileName.lastIndexOf('.');
		return (dotIndex == -1) ? "" : fileName.substring(dotIndex + 1);
	}

}
