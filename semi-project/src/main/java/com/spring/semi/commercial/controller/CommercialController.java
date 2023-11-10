package com.spring.semi.commercial.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.semi.commercial.service.CommercialService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/api")
@Slf4j
@RequiredArgsConstructor
public class CommercialController {

	private final CommercialService service;
	
	@Value("${kakao.reqUrl}")
	private String reqUrl;
	@Value("${kakao.serviceKey}")
	private String serviceKey;

	private long lat; // 위도
	private long lon; // 경도
	
	private String asd = "이화동";

	@GetMapping("/req")
	public String apiRequest(String h1, String h2, String h3, Model model) {
		log.info("/api/req: GET");
		
		String body = service.getShortTermForecast(h1,h2);
		String property = service.getProperties(asd);
//		log.info("서비스에서달받은데이터: {}", body);
		
		
		model.addAttribute("serviceKey", serviceKey);
		model.addAttribute("reqUrl", reqUrl);
		
		model.addAttribute("property", property);
		model.addAttribute("body", body);
		
		return "home2";
	}

	@RequestMapping("/map")
	public String viewKakaoMap(Model model) {
		model.addAttribute("serviceKey", serviceKey);
		model.addAttribute("reqUrl", reqUrl);
		model.addAttribute("lat", 37.5523419);
		model.addAttribute("lon", 126.9377159);
		return "home";  
	}
}