package com.spring.semi.commercial.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.semi.commercial.service.CommercialService;
import com.spring.semi.main.service.AdministrativeCodeService;
import com.spring.semi.main.service.JobCategoryService;
import com.spring.semi.main.service.PropertyService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/api")
@Slf4j
@RequiredArgsConstructor
public class CommercialController {
	
	private final CommercialService service;
	private final AdministrativeCodeService service1;
	private final JobCategoryService service2;
	private final PropertyService service3;
	
	@Value("${kakao.reqUrl}")
	private String reqUrl;
	@Value("${kakao.serviceKey}")
	private String serviceKey;
	
	private String eupMyeongDongCode;
	private String jobCode;
	private String propertyList;
	private long lat; // 위도
	private long lon; // 경도

	@GetMapping("/req")
	public String apiRequest(String h0, String h1, String h2, String h3, Model model) {
		log.info("/api/req: GET ");
		model.addAttribute("serviceKey", serviceKey);
		model.addAttribute("reqUrl", reqUrl);
		
		model.addAttribute("siGunGu", h0);
		model.addAttribute("eupMyeongDong", h1);
		model.addAttribute("smallCategoryName", h2);
		model.addAttribute("excheGtn", h3);
		
		eupMyeongDongCode = service1.getCodeFromEupMyeongDong(h0, h1);
		jobCode = service2.getCodeFromJob(h2);
		propertyList = service3.getProperties(h1);
		
		String body = service.getShortTermForecast(eupMyeongDongCode,jobCode);
		log.info("서비스에서달받은데이터: {}", body);
		if ("NODATA_ERROR".equals(body)) {
			log.info("데이터가 없는데여");
			
			model.addAttribute("body", "NODATA_ERROR");
			return "home";
		}
		model.addAttribute("property", propertyList);
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