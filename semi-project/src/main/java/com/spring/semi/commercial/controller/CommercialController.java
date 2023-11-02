package com.spring.semi.commercial.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.semi.commercial.service.CommercialService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/api")
@Slf4j
@RequiredArgsConstructor
public class CommercialController {
	
	private final CommercialService service;
	
	@GetMapping("/req/{h1}/{h2}")
	public void apiRequest(@PathVariable String h1, @PathVariable String h2) {
		log.info("/api/req: GET, h1: {h1}, h2: {h2}", h1, h2);
		
		service.getShortTermForecast(h1,h2);
	}
	
}
