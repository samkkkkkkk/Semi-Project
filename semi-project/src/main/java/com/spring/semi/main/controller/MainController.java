package com.spring.semi.main.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.semi.main.dto.PropertyRequestDTO;
import com.spring.semi.main.dto.PropertyResponseDTO;
import com.spring.semi.main.service.MainService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class MainController {
	
	private final MainService service;
	
	//메인 페이지 열어주기 
	@GetMapping("/")
	public ModelAndView main() {
		ModelAndView mv  = new ModelAndView();
		mv.setViewName("");
		return mv;
	}	
	//매물 결과 
	@GetMapping("/result")
	public List<PropertyResponseDTO> property(PropertyRequestDTO dto) {
		return service.getProperty(dto); //list를 반환
	}
	
}
