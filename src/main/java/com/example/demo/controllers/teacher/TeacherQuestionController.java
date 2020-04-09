package com.example.demo.controllers.teacher;

import java.io.File;
import java.io.FileInputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Set;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.hibernate.type.TrueFalseType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.entities.Account;
import com.example.demo.entities.Cv;
import com.example.demo.entities.Question;
import com.example.demo.entities.QuestionSub;
import com.example.demo.entities.QuestionSubListContainer;
import com.example.demo.entities.Subject;
import com.example.demo.service.AccountService;
import com.example.demo.service.CVService;
import com.example.demo.service.QuestionService;
import com.example.demo.service.QuestionSubService;
import com.example.demo.service.SubjectService;

@Controller
@RequestMapping(value = { "teacher/question" })
public class TeacherQuestionController implements ServletContextAware {

	@Autowired
	private ServletContext servletContext;
	@Autowired
	private QuestionService questionService;
	@Autowired
	private QuestionSubService questionSubService;
	@Autowired
	private SubjectService subjectService;

	@Autowired
	private AccountService accountService;

	@Autowired
	private CVService cvService;

	@RequestMapping(method = RequestMethod.GET)
	public String index() {
		return "teacher.indexTeacher";
	}

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String listGet(Authentication authentication, ModelMap modelMap) {
		Account account = accountService.findByUsername(authentication.getName());
		List<Subject> allSubjects = (List<Subject>) subjectService.findAll();
		modelMap.put("allSubjects", allSubjects);

		List<Question> questions = (List<Question>) questionService.findAllByAccountId(account.getId());
		modelMap.put("allQuestion", questions);

		return "teacher.questionList";
	}

	@RequestMapping(value = "list", method = RequestMethod.POST)
	public String listPost(Authentication authentication, ModelMap modelMap,
			@RequestParam("subject") @Valid int subjectID, @RequestParam("status") @Valid int status) {
		Account account = accountService.findByUsername(authentication.getName());
		List<Subject> allSubjects = (List<Subject>) subjectService.findAll();
		modelMap.put("allSubjects", allSubjects);

		Subject subject = subjectService.findById(subjectID);

		List<Question> questions = new ArrayList<Question>();

		if (status == 3 && subjectID == 0) {
			questions = (List<Question>) questionService.findAllByAccountId(account.getId());
		} else if (status == 3) {
			questions = (List<Question>) questionService.findAllByAccountIdAndSubjectID(account.getId(), subjectID);
		} else if (subjectID == 0) {
			questions = (List<Question>) questionService.findAllByAccountIdAndStatus(account.getId(), status);
		} else {
			questions = (List<Question>) questionService.findAllByAccountIdAndSubjectIDAndStatus(account.getId(),
					subjectID, status);
		}

		modelMap.put("allQuestion", questions);

		modelMap.put("selectedStatus", status);
		modelMap.put("selectedSubject", subjectID);

		return "teacher.questionList";
	}

	@RequestMapping(value = "upload", method = RequestMethod.GET)
	public String uploadGet(Authentication authentication, ModelMap modelMap) {
		modelMap.addAttribute("questionSubs", new QuestionSub());
		Account account = accountService.findByUsername(authentication.getName());
		List<Cv> cvs = (List<Cv>) cvService.findAllByAccountIdAndStatus(account.getId(), 1);
		List<Integer> subjectIDs = new ArrayList<Integer>();

		for (Cv cv : cvs) {
			subjectIDs.add(cv.getSubject().getId());
		}

		List<Integer> subjectIDs2 = new ArrayList<Integer>();

		List<Subject> subjects = new ArrayList<Subject>();
		for (Integer subjectID : subjectIDs) {
			if (!subjectIDs2.contains(subjectID)) {
				subjectIDs2.add(subjectID);
				subjects.add(subjectService.findById(subjectID));
			}
		}
		if (subjectIDs2.isEmpty()) {
			return "teacher.indexTeacher";
		}
		modelMap.put("questionParam", "");
		modelMap.put("questionSubs", "");
		modelMap.put("subjectIDParam", "");
		modelMap.put("corrects", "");

		modelMap.put("subjects", subjects);
		modelMap.put("msgerr", "");
		return "teacher.uploadQuestions";
	}

	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String uploadPost(Authentication authentication, ModelMap modelMap,
			@RequestParam("question") String questionParam, @RequestParam("subject") Integer subjectIDParam,
			@RequestParam("questionSubs") String[] questionSubs,
			@RequestParam(value = "correct", defaultValue = "") String[] corrects) {
		if (corrects.length == 0 || questionParam.trim().equalsIgnoreCase("")
				|| !checkEmptyQuestionSubs(questionSubs)) {
			Account account = accountService.findByUsername(authentication.getName());
			List<Cv> cvs = (List<Cv>) cvService.findAllByAccountIdAndStatus(account.getId(), 1);
			List<Integer> subjectIDs = new ArrayList<Integer>();

			for (Cv cv : cvs) {
				subjectIDs.add(cv.getSubject().getId());
			}

			List<Integer> subjectIDs2 = new ArrayList<Integer>();

			List<Subject> subjects = new ArrayList<Subject>();
			for (Integer subjectID : subjectIDs) {
				if (!subjectIDs2.contains(subjectID)) {
					subjectIDs2.add(subjectID);
					subjects.add(subjectService.findById(subjectID));
				}
			}
			if (subjectIDs2.isEmpty()) {
				return "teacher.indexTeacher";
			}

			modelMap.put("questionParam", questionParam);
			modelMap.put("questionSubs", questionSubs);
			modelMap.put("subjectIDParam", subjectIDParam);
			modelMap.put("corrects", corrects);
			modelMap.put("subjectIDParam", subjectIDParam);

			modelMap.put("msgerr", "Not be empty!");
			modelMap.put("subjects", subjects);

			return "teacher.uploadQuestions";
		}

		Account account = accountService.findByUsername(authentication.getName());

		Subject subject = subjectService.findById(subjectIDParam);

		Question question = new Question();
		question.setAccount(account);
		question.setStatus(0);
		question.setSubject(subject);
		question.setText(questionParam);
		question = questionService.save(question);

		int a = 0;
		for (String questionSub1 : questionSubs) {
			a++;
			if (questionSub1.equalsIgnoreCase("") == false) {
				QuestionSub questionSub = new QuestionSub();
				questionSub.setCoprrect(0);
				for (String string : corrects) {
					if (string.equals(String.valueOf(a))) {
						questionSub.setCoprrect(1);
					}
				}
				questionSub.setText(questionSub1);
				questionSub.setQuestion(question);
				questionSubService.save(questionSub);
			}
		}

		List<Cv> cvs = (List<Cv>) cvService.findAllByAccountIdAndStatus(account.getId(), 1);
		List<Integer> subjectIDs = new ArrayList<Integer>();

		for (Cv cv : cvs) {
			subjectIDs.add(cv.getSubject().getId());
		}

		List<Integer> subjectIDs2 = new ArrayList<Integer>();

		List<Subject> subjects = new ArrayList<Subject>();
		for (Integer subjectID : subjectIDs) {
			if (!subjectIDs2.contains(subjectID)) {
				subjectIDs2.add(subjectID);
				subjects.add(subjectService.findById(subjectID));
			}
		}
		if (subjectIDs2.isEmpty()) {
			return "teacher.indexTeacher";
		}

		modelMap.put("subjects", subjects);
		return "redirect:/teacher/question/list";

	}

	private boolean checkEmptyQuestionSubs(String[] questionSubs) {
		for (String questionSub : questionSubs) {
			if (questionSub.equalsIgnoreCase("")) {
				return false;
			}
		}
		return true;
	}

	@RequestMapping(value = "import", method = RequestMethod.GET)
	public String importGet(Authentication authentication, ModelMap modelMap) {

		Account account = accountService.findByUsername(authentication.getName());
		List<Cv> cvs = (List<Cv>) cvService.findAllByAccountIdAndStatus(account.getId(), 1);
		List<Integer> subjectIDs = new ArrayList<Integer>();

		for (Cv cv : cvs) {
			subjectIDs.add(cv.getSubject().getId());
		}

		List<Integer> subjectIDs2 = new ArrayList<Integer>();

		List<Subject> subjects = new ArrayList<Subject>();
		for (Integer subjectID : subjectIDs) {
			if (!subjectIDs2.contains(subjectID)) {
				subjectIDs2.add(subjectID);
				subjects.add(subjectService.findById(subjectID));
			}
		}
		modelMap.put("msgerr", "");
		modelMap.put("subjects", subjects);
		return "teacher.importQuestions";
	}

	@RequestMapping(value = "import", method = RequestMethod.POST)
	public String importPost(Authentication authentication, ModelMap modelMap, @RequestParam("subject") Integer subjectIDParam, @RequestParam("excel") @Valid MultipartFile excelParam, HttpSession session) {
		Account account = accountService.findByUsername(authentication.getName());
		Subject subject = subjectService.findById(subjectIDParam);
		
		List<Question> questions = new ArrayList<Question>();
		Set<QuestionSub> questionSubs = new HashSet<QuestionSub>(0);
		
		Question question = new Question();
		QuestionSub questionSub =new QuestionSub();
		
		List<Cv> cvs = (List<Cv>) cvService.findAllByAccountIdAndStatus(account.getId(), 1);
		List<Integer> subjectIDs = new ArrayList<Integer>();

		for (Cv cv : cvs) {
			subjectIDs.add(cv.getSubject().getId());
		}

		List<Integer> subjectIDs2 = new ArrayList<Integer>();

		List<Subject> subjects = new ArrayList<Subject>();
		for (Integer subjectID : subjectIDs) {
			if (!subjectIDs2.contains(subjectID)) {
				subjectIDs2.add(subjectID);
				subjects.add(subjectService.findById(subjectID));
			}
		}
		String duoi = getFileExtension(excelParam.getOriginalFilename());
		if (duoi.equalsIgnoreCase("xlsx")){
			String fileName = saveFile(excelParam);
			try {
				String path = servletContext.getRealPath("/uploads/question/"+fileName);
				FileInputStream excelFile = new FileInputStream(path);
				Workbook workbook = new XSSFWorkbook(excelFile);
				Sheet datatypeSheet = workbook.getSheetAt(0);
				Iterator<Row> rows = datatypeSheet.iterator();
				
				
				int index = 0;
				
				
				while (rows.hasNext()) {
					Row currentRow = rows.next();
					Iterator<Cell> cells = currentRow.iterator();
					while (cells.hasNext()) {
						
						Cell cell = cells.next();
						
						if(cell.getColumnIndex() == 0 && cell.getStringCellValue().equalsIgnoreCase("#####")) {
							index = 0;
							question.setQuestionSubs(questionSubs);
							questions.add(question);
							question = new Question();
							questionSubs = new HashSet<QuestionSub>(0);
							continue;
						}else if(index ==1){
							if(cell.getColumnIndex() == 0) {
								questionSub.setQuestion(question);
								questionSub.setText(cell.getStringCellValue());
							}else if(cell.getColumnIndex() == 1){
								questionSub.setCoprrect(cell.getNumericCellValue() == 1 ? 1 : 0);
								questionSubs.add(questionSub);
								questionSub = new QuestionSub();
							}
						}else if(index == 0) {
							if(cell.getColumnIndex() == 0) {
								question.setAccount(account);
								question.setSubject(subject);
								question.setText(cell.getStringCellValue());
								index = 1;
							}
						}
					}
				}
			} catch (Exception e) {
				System.err.println("--------------------" + e.getMessage());
			}
		}else {
			modelMap.put("msgerr", "File is not empty or not excel");
		}
		modelMap.put("subjects", subjects);
		session.setAttribute("questionsImport", questions);
		modelMap.put("subjectIDParam", subjectIDParam);
		modelMap.put("allQuestion", questions);
		return "teacher.importQuestions";
	}
	
	@RequestMapping(value = "import/save", method = RequestMethod.POST)
	public String importSavePost(Authentication authentication, ModelMap modelMap, HttpSession session) {
		if(session.getAttribute("questionsImport") != null) {
			List<Question> questions = (List<Question>) session.getAttribute("questionsImport");
			if(questions.size()!=0) {
				for (Question question : questions) {
					Set<QuestionSub> questionSubs =  question.getQuestionSubs();
					question = questionService.save(question);
					for (QuestionSub questionSub : questionSubs) {
						questionSub.setQuestion(question);
						questionSubService.save(questionSub);
					}
				}
				session.removeAttribute("questionsImport");
				return "redirect:/teacher/question/list";
			}			
		}
		return "redirect:/teacher/question/import";
	}

	private String saveFile(MultipartFile file) {
		try {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("ddMMyyyyHHmmss");
			String fileName = simpleDateFormat.format(new Date()) + file.getOriginalFilename();
			byte[] bytes = file.getBytes();
			Path path = Paths.get(servletContext.getRealPath("/uploads/question/" + fileName));
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

	@Override
	public void setServletContext(ServletContext arg0) {
		// TODO Auto-generated method stub

	}

}
