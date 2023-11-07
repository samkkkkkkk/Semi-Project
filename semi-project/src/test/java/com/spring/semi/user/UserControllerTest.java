package com.spring.semi.user;

import static org.junit.jupiter.api.Assertions.assertEquals;

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

import com.spring.semi.user.controller.UserController;

import lombok.extern.slf4j.Slf4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
					"file:src/main/webapp/WEB-INF/spring/appServlet/email-config.xml"})

@TestPropertySource("classpath:/properties/email.properties")
@WebAppConfiguration
@Slf4j
public class UserControllerTest {

	@Autowired
	private UserController controller;
	
	private MockMvc mockMvc;
	
	@BeforeEach
	public void setup() {
		this.mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
	}
	
	@Test
	@DisplayName("로그인 체크")
	public void loginTest() throws Exception {
		ModelAndView mv = mockMvc.perform(MockMvcRequestBuilders.post("/user/login")
				.param("userId", "test1")
				.param("userPw", "test1234"))
				.andReturn()
				.getModelAndView();
		
		log.info("mv: {}", mv);
//		assertEquals("redirect:/", mv.getViewName());
	}
	
	@Test
	@DisplayName("회원가입 체크")
	public void joinTest() throws Exception {
		ModelAndView mv = mockMvc.perform(MockMvcRequestBuilders.post("/user/join")
				.param("userId", "test3")
				.param("userPw", "test123")
				.param("userName", "김춘식")
				.param("userEmail1", "test2")
				.param("userEmail2", "@naver.com"))
				.andReturn()
				.getModelAndView();
		
		log.info("mv: {}", mv);
		assertEquals("redirect:/user/login", mv.getViewName());
	}
	
	@Test
	@DisplayName("이메일 체크")
	public void emailTest() throws Exception {
		
		String content = mockMvc.perform(MockMvcRequestBuilders.post("/user/email")
				.content("test@naver.com"))
				.andReturn()
				.getResponse()
				.getContentAsString();
		
		log.info("content: {}", content);
	}
}
