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

import com.example.demo.entities.Question;
import com.example.demo.entities.QuestionSub;

import com.example.demo.entities.Subject;
import com.example.demo.service.QuestionService;
import com.example.demo.service.QuestionSubService;
import com.example.demo.service.SubjectService;

@Controller
@RequestMapping(value = { "admin/questions" })
public class QusetionsController {

	@Autowired
	private QuestionService questionService;
	@Autowired
	private QuestionSubService questionSubService;
	@Autowired
	private SubjectService subjectService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String listGet(ModelMap modelMap) {

		List<Subject> allSubjects = (List<Subject>) subjectService.findAll();
		modelMap.put("allSubjects", allSubjects);

		List<Question> questions = (List<Question>) questionService.findAll();
		modelMap.put("allQuestion", questions);
		return "admin.listquestions";
	}

	@RequestMapping(value = "index", method = RequestMethod.POST)
	public String listPost(ModelMap modelMap, @RequestParam("subject") @Valid int subjectID,
			@RequestParam("status") @Valid int status) {
		List<Subject> allSubjects = (List<Subject>) subjectService.findAll();
		modelMap.put("allSubjects", allSubjects);

		Subject subject = subjectService.findById(subjectID);

		List<Question> questions = new ArrayList<Question>();

		if (status == 3 && subjectID == 0) {
			questions = (List<Question>) questionService.findAll();
		} else if (status == 3) {
			questions = (List<Question>) questionService.findAllBySubjectID(subjectID);
		} else if (subjectID == 0) {
			questions = (List<Question>) questionService.findAllByStatus(status);
		} else {
			questions = (List<Question>) questionService.findAllBySubjectIDAndStatus(subjectID, status);
		}

		modelMap.put("allQuestion", questions);

		modelMap.put("selectedStatus", status);
		modelMap.put("selectedSubject", subjectID);

		return "admin.listquestions";
	}

	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detailNullParam(ModelMap modelMap) {
		List<Subject> allSubjects = (List<Subject>) subjectService.findAll();
		modelMap.put("allSubjects", allSubjects);

		List<Question> questions = (List<Question>) questionService.findAll();
		modelMap.put("allQuestion", questions);
		return "admin.listquestions";
	}

	@RequestMapping(value = "detail/{questionID}", method = RequestMethod.GET)
	public String detailGet(@PathVariable("questionID") int id, ModelMap modelMap) {
		Question question = questionService.findByID(id);
		List<QuestionSub> questionSubs = (List<QuestionSub>) questionSubService.findByQuestionID(id);

		modelMap.put("question", question);
		modelMap.put("questionSubs", questionSubs);
		return "admin.detailquestion";
	}

	@RequestMapping(value = "accept", method = RequestMethod.POST)
	public String confirm(ModelMap modelMap, @RequestParam("id") int id) {
		Question question = questionService.findByID(id);
		List<QuestionSub> questionSubs = (List<QuestionSub>) questionSubService.findByQuestionID(id);
		question.setStatus(1);
		question = questionService.save(question);
		modelMap.put("question", question);
		modelMap.put("questionSubs", questionSubs);
		return "admin.detailquestion";
	}

	@RequestMapping(value = "refuse", method = RequestMethod.POST)
	public String refuse(ModelMap modelMap, @RequestParam("id") int id) {
		Question question = questionService.findByID(id);
		List<QuestionSub> questionSubs = (List<QuestionSub>) questionSubService.findByQuestionID(id);
		question.setStatus(2);
		question = questionService.save(question);
		modelMap.put("question", question);
		modelMap.put("questionSubs", questionSubs);
		return "admin.detailquestion";
	}

}
