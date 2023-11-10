package com.spring.semi.main.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;

@RestController
//@RequiredArgsConstructor

public class MainController {
	

//		//메인 페이지 열어주기 
//	@GetMapping("/")
//	public ModelAndView main() {
//		ModelAndView mv  = new ModelAndView();
//		mv.setViewName("home");
//		return mv;
//	}	
	
	@GetMapping("/result")
	public ModelAndView result() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/result/home2");
		return mv;
	}
}
