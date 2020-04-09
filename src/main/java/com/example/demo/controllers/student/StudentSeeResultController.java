package com.example.demo.controllers.student;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entities.Account;
import com.example.demo.entities.Answer;
import com.example.demo.entities.Exam;
import com.example.demo.entities.ExamQuestion;
import com.example.demo.entities.Question;
import com.example.demo.entities.QuestionSub;
import com.example.demo.service.AccountService;
import com.example.demo.service.AnswerService;
import com.example.demo.service.ExamService;
import com.example.demo.service.QuestionSubService;

@Controller
@RequestMapping(value = { "student/seeResult" })
public class StudentSeeResultController {

	@Autowired
	private AnswerService answerService;

	@Autowired
	private AccountService accountService;

	@Autowired
	private ExamService examService;

	@Autowired
	private QuestionSubService questionSubService;

	@RequestMapping(method = RequestMethod.GET)
	public String seeResults(ModelMap modelMap) {
		return "student.resultList";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String seeResults(ModelMap modelMap,
			@RequestParam(value = "selectedQuestionSubsID", defaultValue = "") String[] selectedQuestionSubsID,
			HttpSession session) {
		List<Integer> selectedQuestionSubsID2 = new ArrayList<Integer>();
		if (selectedQuestionSubsID.length == 0) {
			selectedQuestionSubsID2 = new ArrayList<Integer>();
		} else {
			for (String a : selectedQuestionSubsID) {
				selectedQuestionSubsID2.add(Integer.parseInt(a));
			}
		}
		List<Answer> answers = new ArrayList<Answer>();
		Answer answer = new Answer();

		List<QuestionSub> selectedQuestionSubs = new ArrayList<QuestionSub>();

		for (int selectedQuestionSubID : selectedQuestionSubsID2) {
			selectedQuestionSubs.add(questionSubService.find(selectedQuestionSubID));
		}

		List<ExamQuestion> examQuestions = (List<ExamQuestion>) session.getAttribute("examQuestions");
		for (ExamQuestion examQuestion : examQuestions) {
			for (QuestionSub selectedQuestionSub : selectedQuestionSubs) {
				if (selectedQuestionSub.getQuestion().getId().equals(examQuestion.getQuestion().getId())) {
					answer.setQuestionSub(selectedQuestionSub);
					answer.setExamQuestion(examQuestion);
					answers.add(answer);
					answer = new Answer();
				}
			}
		}

		for (Answer answer2 : answers) {
			answer2 = answerService.save(answer2);
			Answer answer3 = new Answer();
			answer3.setExamQuestion(answer2.getExamQuestion());
			answer3.setQuestionSub(answer2.getQuestionSub());
			answer2 = new Answer();
			answer2 = answer3;
		}

		int score = 0;

		for (ExamQuestion examQuestion : examQuestions) {
			if (countCorrect(examQuestion)) {
				score = score + 1;
			}
		}

		Exam exam = examService.findByExamID(examQuestions.get(0).getExam().getId());
		exam.setScore(score + "/" + examQuestions.size());
		examService.save(exam);

		modelMap.put("score", score);
		modelMap.put("numberQuestion", examQuestions.size());
		session.removeAttribute("subject");
		session.removeAttribute("questions");
		session.removeAttribute("examQuestions");
		session.removeAttribute("time");
		session.removeAttribute("countdown");
		return "student.seeResult";
	}

	public boolean countCorrect(ExamQuestion examQuestion) {
		List<QuestionSub> questionSubs = new ArrayList<QuestionSub>();
		List<Answer> answersInExam = new ArrayList<Answer>();
		questionSubs = (List<QuestionSub>) questionSubService.findAllCorrect(examQuestion.getQuestion().getId());
		answersInExam = (List<Answer>) answerService.findAllByExamQuestionID(examQuestion.getId());
		if (questionSubs.size() == 0 || answersInExam.size() == 0) {
			return false;
		}
		for (QuestionSub questionSub : questionSubs) {
			for (Answer answer : answersInExam) {
				if (questionSub.getId() != answer.getQuestionSub().getId()) {
					return false;
				}
			}
		}
		return true;
	}

	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detailNullParamGet() {
		return "redirect:/student/resultList";

	}

	@RequestMapping(value = "detail/{examID}", method = RequestMethod.GET)
	public String detailGet(@PathVariable("examID") int examID, ModelMap modelMap, Authentication authentication) {
		Exam exam = examService.findByExamID(examID);
		if (exam != null) {
			Account account = accountService.findByUsername(authentication.getName());
			if (exam.getAccount().getId() == account.getId()) {
				modelMap.put("examQuestions", exam.getExamQuestions());

				return "student.resultDetail";

			}
		}
		return "redirect:/student/resultList";
	}
}
