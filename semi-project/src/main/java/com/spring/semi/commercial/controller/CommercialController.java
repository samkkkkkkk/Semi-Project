package com.spring.semi.commercial.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.semi.commercial.service.CommercialService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/api")
@Slf4j
@RequiredArgsConstructor
public class CommercialController {

	private final CommercialService service;

	@GetMapping("/req/{h1}/{h2}")
	public String apiRequest(@PathVariable String h1, @PathVariable String h2, RedirectAttributes attr) {
		log.info("/api/req: GET, h1: {h1}, h2: {h2}", h1, h2);

		Map<String, Object> responseData = service.getShortTermForecast(h1,h2);
		log.info("전달받은 데이터: {}", responseData);

		attr.addFlashAttribute("body", responseData.get("body"));
		attr.addFlashAttribute("items", ((Map<String, Object>) responseData.get("body")).get("items"));
		
		return "redirect:/home2";
	}
}