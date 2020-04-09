package com.example.demo.controllers.student;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.entities.Subject;
import com.example.demo.service.SubjectService;


@Controller
@RequestMapping(value = {"student/selectExam" })
public class StudentSelectExamController {
	
	@Autowired
	private SubjectService subjectService;
	
	@RequestMapping(value = "index" ,method = RequestMethod.GET)
	public String selectExam(ModelMap modelMap, HttpSession session) {

		if(session.getAttribute("questions") == null) {
			List<Subject> subjects = (List<Subject>) subjectService.findAll();
			modelMap.put("subjects", subjects);
			session.removeAttribute("examQuestions");
			session.removeAttribute("subject");
			session.removeAttribute("questions");
			
			return "student.selectExam";
		}else {
			Calendar present = Calendar.getInstance();
			Long time = present.getTimeInMillis() - (Long) session.getAttribute("time");
			Long countdown = (Long) session.getAttribute("countdown");
			if (time <= 0) {
				countdown = 1l;
			}
			countdown = countdown - (time/1000);
			session.setAttribute("time", present.getTimeInMillis());
			session.setAttribute("countdown", countdown);
			return "student.exam";
		}
	}
	@RequestMapping(value = "index/{err}" ,method = RequestMethod.GET)
	public String selectExamErr(ModelMap modelMap, HttpSession session, @PathVariable("err") String err) {
		if(err.equalsIgnoreCase("neq")) {
			if(session.getAttribute("questions") == null) {
				List<Subject> subjects = (List<Subject>) subjectService.findAll();
				modelMap.put("subjects", subjects);
				session.removeAttribute("examQuestions");
				session.removeAttribute("subject");
				session.removeAttribute("questions");
				modelMap.put("err", "Not enough questions");
				return "student.selectExam";
			}else {
				Calendar present = Calendar.getInstance();
				Long time = present.getTimeInMillis() - (Long) session.getAttribute("time");
				Long countdown = (Long) session.getAttribute("countdown");
				if (time <= 0) {
					countdown = 1l;
				}
				countdown = countdown - (time/1000);
				session.setAttribute("time", present.getTimeInMillis());
				session.setAttribute("countdown", countdown);
				return "student.exam";
			}
		}
		return "redirect:/student/selectExam/index";
	}
}
