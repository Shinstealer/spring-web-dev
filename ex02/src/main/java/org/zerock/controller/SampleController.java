package org.zerock.controller;

import java.util.Locale;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/sample")
public class SampleController {

	@RequestMapping("/hello")
	public String sayHello() {
		return "Hello World";
	}
	
	@RequestMapping(value = "/doA" , method = RequestMethod.GET)
	public String doA(Locale locale , Model model) {
		
		System.out.println("doA.................");
		
		return "sample";
	}
	
	@RequestMapping(value = "/doB" , method = RequestMethod.GET)
	public String doA1(Locale locale , Model model) {
		
		System.out.println("doB.................");
		
		model.addAttribute("result" , "DOB RESULT");
		
		return "sample";
	}
	
}
