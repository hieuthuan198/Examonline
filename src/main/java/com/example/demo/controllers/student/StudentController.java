package com.example.demo.controllers.student;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = { "student" })
public class StudentController {

	@RequestMapping(method = RequestMethod.GET)
	public String index() {
		return "student.indexHome";

	}

	
}
