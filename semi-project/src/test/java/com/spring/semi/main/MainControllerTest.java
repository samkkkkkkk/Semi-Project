package com.spring.semi.main;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.servlet.ModelAndView;

import com.spring.semi.main.controller.MainController;


import lombok.extern.slf4j.Slf4j;

@Slf4j

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					"file:src/main/webapp/WEB-INF/spring/appServlet/email-config.xml",
					"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@TestPropertySource("classpath:/properties/email.properties")
public class MainControllerTest {

	@Autowired
	private MainController controller;
	
	@BeforeEach
	public void setup() {
		this.mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
	}
	
	
	private MockMvc mockMvc;
	
	@Test
	@DisplayName("가격과 행정동을 주면 리스트가 올것이다.")
	public void property() throws Exception {
		ModelAndView mv = mockMvc.perform(MockMvcRequestBuilders.get("/result")
				.param("adstrdNm", "방화동")
				.param("excheGtn", "65000000")
				.param("area", "40"))
				.andReturn()
				.getModelAndView();
		
		log.info("mv: {}", mv);
//		String name = "방화동";
//		int price = 40000000;
		
		
		
		
		
	}
	
}
