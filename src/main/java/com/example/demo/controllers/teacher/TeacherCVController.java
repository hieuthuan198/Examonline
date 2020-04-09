package com.example.demo.controllers.teacher;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
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
import com.example.demo.entities.Cv;
import com.example.demo.entities.Subject;
import com.example.demo.service.AccountService;
import com.example.demo.service.CVService;
import com.example.demo.service.SubjectService;
import com.example.demo.validator.AccountValidator;

@Controller
@RequestMapping(value = { "teacher/cv" })
public class TeacherCVController implements ServletContextAware {
	@Autowired
	private CVService cvService;
	@Autowired
	private AccountService accountService;
	@Autowired
	private SubjectService subjectService;
	@Autowired
	private ServletContext servletContext;

	@RequestMapping(method = RequestMethod.GET)
	public String index() {
		return "teacher.indexTeacher";
	}

	@RequestMapping(value = "upload", method = RequestMethod.GET)
	public String uploadGet(ModelMap modelMap, HttpSession session) {
		modelMap.addAttribute("cv", new Cv());
		modelMap.put("err", "");

		List<Subject> subjects = (List<Subject>) subjectService.findAll();

		modelMap.put("subjects", subjects);
		return "teacher.uploadCV";
	}

	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String uploadPost(@ModelAttribute("cv") Cv cv, BindingResult bindingResult, ModelMap modelMap,
			Authentication authentication, @RequestParam("image") @Valid MultipartFile image) {
		if (!image.getName().equalsIgnoreCase("")) {
			String duoi = getFileExtension(image.getOriginalFilename());
			if(cv.getYearOfExperience() == null) {
				modelMap.put("err", "Year Of Experience is not empty.");
				List<Subject> subjects = (List<Subject>) subjectService.findAll();
				modelMap.put("subjects", subjects);
				modelMap.addAttribute("cv", cv);
				return "teacher.uploadCV";
			}
			if (duoi.equalsIgnoreCase("png") || duoi.equalsIgnoreCase("jpg")) {
				Account account = accountService.findByUsername(authentication.getName());
				cv.setAccount(account);
				cv.setStatus(0);
				String fileName = saveFile(image,
						account.getId().toString() + "_" + cvService.save(cv).getId().toString());
				return "redirect:/teacher/cv/list";
			}
			modelMap.put("err", "Not the image format or no image");
			List<Subject> subjects = (List<Subject>) subjectService.findAll();
			modelMap.put("subjects", subjects);
			modelMap.addAttribute("cv", cv);
			return "teacher.uploadCV";
		}
		modelMap.put("err", "Not the image format");
		List<Subject> subjects = (List<Subject>) subjectService.findAll();
		modelMap.put("subjects", subjects);
		modelMap.addAttribute("cv", cv);
		return "teacher.uploadCV";
	}

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String listGet(Authentication authentication, ModelMap modelMap) {
		Account account = accountService.findByUsername(authentication.getName());
		List<Subject> subjects = (List<Subject>) subjectService.findAll();

		List<Cv> cvs = (List<Cv>) cvService.findAll();

		cvs = (List<Cv>) cvService.findAllByAccountId(account.getId());

		modelMap.put("cvs", cvs);
		modelMap.put("subjects", subjects);

		return "teacher.cvList";
	}

	@RequestMapping(value = "list", method = RequestMethod.POST)
	public String listPost(Authentication authentication, ModelMap modelMap,
			@RequestParam("status") Integer selectedStatus, @RequestParam("subject") Integer selectedSubject) {
		Account account = accountService.findByUsername(authentication.getName());
		List<Subject> subjects = (List<Subject>) subjectService.findAll();

		List<Cv> cvs = new ArrayList<Cv>();

		if (selectedStatus == 3 && selectedSubject == 0) {
			cvs = (List<Cv>) cvService.findAllByAccountId(account.getId());
		} else if (selectedStatus == 3) {
			cvs = (List<Cv>) cvService.findAllByAccountIdAndSubjectID(account.getId(), selectedSubject);
		} else if (selectedSubject == 0) {
			cvs = (List<Cv>) cvService.findAllByAccountIdAndStatus(account.getId(), selectedStatus);
		} else {
			cvs = (List<Cv>) cvService.findAllByAccountIdAndSubjectIDAndStatus(account.getId(), selectedSubject,
					selectedStatus);
		}

		modelMap.put("cvs", cvs);
		modelMap.put("subjects", subjects);

		modelMap.put("selectedStatus", selectedStatus);
		modelMap.put("selectedSubject", selectedSubject);
		return "teacher.cvList";
	}

	private String saveFile(MultipartFile file, String fileName) {
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get(servletContext.getRealPath("/uploads/images/cv/" + fileName + ".png"));
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

	public static String getFileExtension(String fullName) {
		String fileName = new File(fullName).getName();
		int dotIndex = fileName.lastIndexOf('.');
		return (dotIndex == -1) ? "" : fileName.substring(dotIndex + 1);
	}

	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detail() {
		return "teacher.cvdetail";
	}

}
