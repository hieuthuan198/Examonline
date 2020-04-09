package com.example.demo.controllers.admin;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.entities.Subject;
import com.example.demo.service.SubjectService;
import com.example.demo.validator.AccountValidator;
import com.example.demo.validator.SubjectValidator;

@Controller
@RequestMapping(value = { "admin/subject" })
public class SubjectController implements ServletContextAware {

	@Autowired
	private ServletContext servletContext;

	@Autowired
	private SubjectService subjectService;

	@Autowired
	private SubjectValidator subjectValidator;

	@RequestMapping(method = RequestMethod.GET)
	public String list(ModelMap modelMap) {
		List<Subject> subjects = (List<Subject>) subjectService.findAll();
		modelMap.put("subjects", subjects);
		return "admin.listSubject";
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String addGet(ModelMap modelMap, @ModelAttribute("subject") Subject subject) {

		modelMap.put("subject", subject);
		return "admin.addSubject";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String addPost(@ModelAttribute("subject") @Valid Subject subject, BindingResult bindingResult, @ModelAttribute("image") MultipartFile image,
			ModelMap modelMap) {
		if (bindingResult.hasErrors()) {
			return "admin.updateSubject";
		} else if (!image.getName().equalsIgnoreCase("")) {
			String duoi = getFileExtension(image.getOriginalFilename());
			if (duoi.equalsIgnoreCase("png") || duoi.equalsIgnoreCase("jpg")) {
				subject = subjectService.save(subject);
				String fileName = saveFile(image, subject.getId().toString());
				return "redirect:/admin/subject";
			}
			modelMap.put("err", "Image is not empty or not Image");
			modelMap.put("subject", subject);
			return "admin.updateSubject";
			
		}
		modelMap.put("err", "Image is not empty or not Image");
		modelMap.put("subject", subject);
		return "admin.updateSubject";
		
	}

	@RequestMapping(value = "edit/{subjectID}", method = RequestMethod.GET)
	public String editGet(@PathVariable("subjectID") int subjectID, ModelMap modelMap) {
		Subject subject = subjectService.findById(subjectID);
		modelMap.put("subject", subject);
		return "admin.updateSubject";
	}

	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public String editGetNull(ModelMap modelMap) {
		List<Subject> subjects = (List<Subject>) subjectService.findAll();
		modelMap.put("subjects", subjects);
		return "admin.listSubject";
	}

	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String editPost(@ModelAttribute("subject") @Valid Subject subject, BindingResult bindingResult,
			@ModelAttribute("image") MultipartFile image, ModelMap modelMap) {
		subjectValidator.validate(subject, bindingResult);
		if (bindingResult.hasErrors()) {
			return "admin.updateSubject";
		} else if (!image.getName().equalsIgnoreCase("")) {
			String duoi = getFileExtension(image.getOriginalFilename());
			if (duoi.equalsIgnoreCase("png") || duoi.equalsIgnoreCase("jpg")) {
				subject = subjectService.save(subject);
				List<Subject> subjects = (List<Subject>) subjectService.findAll();
				modelMap.put("subjects", subjects);
				String fileName = saveFile(image, subject.getId().toString());
				fileName = saveFile(image, subject.getId().toString());
				return "redirect:/admin/subject";
			}
			modelMap.put("err", "Image is not empty or not Image");
			modelMap.put("subject", subject);
			return "admin.updateSubject";

		}
		modelMap.put("err", "Image is not empty or not Image");
		modelMap.put("subject", subject);
		return "admin.updateSubject";

	}

	private String saveFile(MultipartFile file, String fileName) {
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get(servletContext.getRealPath("/uploads/images/subject/" + fileName + ".png"));
			Files.write(path, bytes);
			return fileName;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public void setServletContext(ServletContext arg0) {
		// TODO Auto-generated method stub

	}

	private String getFileExtension(String fullName) {
		String fileName = new File(fullName).getName();
		int dotIndex = fileName.lastIndexOf('.');
		return (dotIndex == -1) ? "" : fileName.substring(dotIndex + 1);
	}
}
