package com.example.demo.controllers.teacher;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.catalina.authenticator.SpnegoAuthenticator.AuthenticateAction;
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
import com.example.demo.entities.AccountRole;
import com.example.demo.entities.Role;
import com.example.demo.service.AccountService;
import com.example.demo.service.RoleService;
import com.example.demo.validator.AccountValidator;

@Controller
@RequestMapping(value = {"teacher/updateProfile" })
public class TeacherUpdateProfileController implements ServletContextAware{
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private AccountValidator accountValidator;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap, Authentication authentication) {
		Account account = accountService.findByUsername(authentication.getName());
		modelMap.put("account", account);
		return "teacher.updateProfile";
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
				return "redirect:/teacher/profile";
			}
			modelMap.put("err", "Image is not empty or not Image");
			modelMap.put("account", account);
			return "teacher.updateProfile";
		}
		return "redirect:/teacher/profile";
	}

	@Override
	public void setServletContext(ServletContext arg0) {
		// TODO Auto-generated method stub
		
	}
	
	private String saveFile(MultipartFile file,String fileName) {
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get(servletContext.getRealPath("/uploads/images/account/" + fileName + ".png"));
			Files.write(path, bytes);
			return fileName;
		} catch (Exception e) {
			return null;
		}
	}
	private String getFileExtension(String fullName) {
		String fileName = new File(fullName).getName();
		int dotIndex = fileName.lastIndexOf('.');
		return (dotIndex == -1) ? "" : fileName.substring(dotIndex + 1);
	}

}
