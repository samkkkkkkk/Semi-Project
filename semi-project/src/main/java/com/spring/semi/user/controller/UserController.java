package com.spring.semi.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.semi.user.dto.UserLoginRequestDTO;
import com.spring.semi.user.dto.UserRegisterRequestDTO;
import com.spring.semi.user.service.UserService;
import com.spring.semi.util.MailSenderService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
@Slf4j
public class UserController {

	private final UserService service;
	private final MailSenderService mailService;
	
	// 로그인
	
	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("/login")
	public String login(RedirectAttributes ra, HttpSession session, UserLoginRequestDTO dto) {
		log.info("dto: {}", dto);
		boolean isLoginSuccess = service.loginCheck(session, dto);
		
		if (isLoginSuccess) {
			return "redirect:/";
		}
		else {
			ra.addFlashAttribute("msg", "loginFail");
			return "redirect:/user/login";
		}
	}
	
	// 회원 가입
	
	@GetMapping("/join")
	public void join() {}
	
	@PostMapping("/join")
	public String join(RedirectAttributes ra, UserRegisterRequestDTO dto) {
		service.register(dto);
		
		ra.addFlashAttribute("msg", "joinSuccess");
		return "redirect:/user/login";
	}
	
	// 아이디 체크
	@GetMapping("/id/{id}")
	@ResponseBody
	public String idCheck(@PathVariable String id) {
		System.out.println("클라이언트로부터 전달된 아이디: " + id);
		
		if (service.idCheck(id) == 1) {
			return "duplicated";
		}
		else {
			return "ok";
		}		
	}
	
	// 이메일 인증
	@PostMapping("/email")
	@ResponseBody
	public String mailCheck(@RequestBody String email) {
		System.out.println("이메일 인증 요청 들어옴: " + email);

		// 화면단으로 인증번호를 전달
		return mailService.joinEmail(email);
	}
	
	// mypage
	
	// mypage 회원수정
	@PostMapping("/user/modify")
	public String userModify() {
		return "redirect:/user/mypage";
	}
	
	// mypage 조회기록 삭제
}
