package com.spring.semi.kakao.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class KakaoController {

	@Value("${kakao.reqUrl}")
	private String reqUrl;
	@Value("${kakao.serviceKey}")
	private String serviceKey;

	private long lat; // 위도
	private long lon; // 경도

	@RequestMapping("/map")
	public String viewKakaoMap(Model model) {
		model.addAttribute("serviceKey", serviceKey);
		model.addAttribute("reqUrl", reqUrl);
		model.addAttribute("lat", 37.5523419);
		model.addAttribute("lon", 126.9377159);
		return "home";  
	}

	@GetMapping("/home2")
	public String viewKakaoMap2(Model model) {
		model.addAttribute("serviceKey", serviceKey);
		model.addAttribute("reqUrl", reqUrl);
		
		model.asMap().get("property");
		model.asMap().get("body");
		
		return "home2";
	}
}
