package com.spring.semi.commercial.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.semi.commercial.service.CommercialService;
import com.spring.semi.main.entity.Property;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/api")
@Slf4j
@RequiredArgsConstructor
public class CommercialController {

	private final CommercialService service;
	private String asd = "이화동";

	@GetMapping("/req/{h1}/{h2}/{h3}")
	public String apiRequest(@PathVariable String h1, @PathVariable String h2, @PathVariable String h3, RedirectAttributes attr) {
		log.info("/api/req: GET");
		
		String body = service.getShortTermForecast(h1,h2);
		String property = service.getProperties(asd);
//		log.info("서비스에서달받은데이터: {}", body);
		
		attr.addFlashAttribute("property", property);
		attr.addFlashAttribute("body", body);
		
		return "redirect:/home2";
	}
}