package com.spring.semi.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/include")
public class testController {
	
	@GetMapping("/test")
	public void test() {
//		System.out.println("${pageContext.request.contextPath} : ",pageContext.request.contextPath);
	};
}
