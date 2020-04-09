package com.example.demo.controllers.student;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entities.Account;
import com.example.demo.entities.Exam;
import com.example.demo.entities.ExamQuestion;
import com.example.demo.entities.Question;
import com.example.demo.entities.Subject;
import com.example.demo.service.AccountService;
import com.example.demo.service.ExamQuestionService;
import com.example.demo.service.QuestionService;
import com.example.demo.service.SubjectService;
import com.example.demo.service.ExamService;

@Controller
@RequestMapping(value = { "student/exam" })
public class StudentExamController {

	@Autowired
	private AccountService accountService;

	@Autowired
	private ExamService examService;

	@Autowired
	private ExamQuestionService examQuestionService;

	@Autowired
	private SubjectService subjectService;

	@Autowired
	private QuestionService questionService;

	@RequestMapping(method = RequestMethod.GET)
	public String examGet(HttpSession session) {
		if (session.getAttribute("questions") == null) {
			return "student.selectExam";
		}
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

	@RequestMapping(method = RequestMethod.POST)
	public String examPost(ModelMap modelMap, @RequestParam("subjectid") int subjectid, HttpSession session,
			Authentication authentication) {

		if (session.getAttribute("questions") == null) {
			List<Question> allQuestions = (List<Question>) questionService.findAllBySubjectIdAndStatus(subjectid, 1);
			
			Calendar present = Calendar.getInstance();

			Subject subject = subjectService.findById(subjectid);
			
			Collections.shuffle(allQuestions);

			List<Question> questions = new ArrayList<Question>();
			try {
				for (int i = 0; i < 10; i++) {
					questions.add(allQuestions.get(i));
				}
			} catch (IndexOutOfBoundsException e) {
				return "redirect:/student/selectExam/index/neq";
			}

			Account account = accountService.findByUsername(authentication.getName());

			Exam exam = new Exam();
			exam.setCreated(new Date());
			exam.setAccount(account);
			exam.setSubject(subject);
			exam.setScore("0/" + questions.size());
			exam = examService.save(exam);

			List<ExamQuestion> examQuestions = new ArrayList<ExamQuestion>();

			ExamQuestion examQuestion = new ExamQuestion();

			for (Question question : questions) {
				examQuestion.setExam(exam);
				examQuestion.setQuestion(question);
				examQuestion = examQuestionService.save(examQuestion);
				examQuestions.add(examQuestion);
				examQuestion = new ExamQuestion();
			}
			session.setAttribute("time", present.getTimeInMillis());
			session.setAttribute("countdown", 600l);
			session.setAttribute("examQuestions", examQuestions);
			session.setAttribute("subject", subject);
			session.setAttribute("questions", questions);
			return "student.exam";
		}
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
