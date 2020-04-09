package com.example.demo.controllers.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = {"admin/homecontent"})
public class HomeContentController {
	@RequestMapping(value = "index",method = RequestMethod.GET)
public String homecontent() {
	return "admin.homecontent";
}
	@RequestMapping(value = "add", method = RequestMethod.GET)
public String addcontent() {
	return "admin.addcontent";
}
}
