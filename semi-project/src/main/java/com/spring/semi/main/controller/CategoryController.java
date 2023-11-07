package com.spring.semi.main.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.semi.main.dto.AdministrativeCodeDTO;
import com.spring.semi.main.dto.JobCategoryDTO;
import com.spring.semi.main.service.AdministrativeCodeService;
import com.spring.semi.main.service.JobCategoryService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/select")
@Slf4j
public class CategoryController {
	private final JobCategoryService service1;
	private final AdministrativeCodeService service2;
	
	@GetMapping("/job/{value1}")
	@ResponseBody
	public List<JobCategoryDTO> getJobList(@PathVariable String value1) {
		return service1.getJobList(value1);
	}
	
	@GetMapping("/administrativeCode/{value1}")
	@ResponseBody
	public List<AdministrativeCodeDTO> getAdrList(@PathVariable String value1) {
		return service2.getAdrList(value1);
	}
}
