package com.spring.semi.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.semi.user.dto.UserRequestLoginDTO;
import com.spring.semi.user.dto.UserRequestRegisterDTO;
import com.spring.semi.user.dto.UserRequstModifyDTO;
import com.spring.semi.user.dto.UserResponseMyPageResultDTO;
import com.spring.semi.user.dto.page.Page;
import com.spring.semi.user.dto.page.PageCreator;
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
	public String login(RedirectAttributes ra, HttpSession session, UserRequestLoginDTO dto) {
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
	public String join(RedirectAttributes ra, UserRequestRegisterDTO dto) {
		service.register(dto);
		
		ra.addFlashAttribute("msg", "joinSuccess");
		return "redirect:/user/login";
	}
	
	// 아이디 체크
	@GetMapping("/id/{id}")
	@ResponseBody
	public String idCheck(@PathVariable String id) {
		System.out.println("클라이언트로부터 전달된 아이디: " + id);
		
		int result = service.idCheck(id);
		if (result == 1) {
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
	
	// mypage 회원 수정 페이지
	@GetMapping("/mypage")
	public String UserMyPage(Model model, HttpSession session) {
		String userId = session.getAttribute("userId").toString();
		model.addAttribute("userInfo", service.getMemberInfo(userId));
		return "user/MyPage";
	}
	
	// mypage 저장된 조회 결과 페이지
	@GetMapping("/mypage/results")
	public String UserMyPageResult(Model model, HttpSession session, Page page) {
		String userId = session.getAttribute("userId").toString();
		page.setUserId(userId);
		log.info("page: {}", page);
		int totalCount = service.getTotal(userId);
		
		List<UserResponseMyPageResultDTO> dto = service.getResultList(userId, page);
		log.info("resultList: {}", dto);
		PageCreator pc = new PageCreator(page, totalCount);
		log.info("pc: {}", pc);
		
		model.addAttribute("resultList", dto);
		model.addAttribute("pc", pc);
		
		return "user/MyPageResult";
	}
	
	// mypage 회원수정
	@PostMapping("/mypage")
	public String userModify(HttpSession session, UserRequstModifyDTO dto) {
		String userId = session.getAttribute("userId").toString();
		service.modifyMemberInfo(userId, dto);
		return "redirect:/user/mypage";
	}
	
	// mypage 조회기록 삭제
	@GetMapping("/mypage/results/delete")
	public String userMypageDelete(RedirectAttributes ra, HttpSession session, int bno) {
		service.deleteResult(bno);
		
		ra.addFlashAttribute("msg", "deleteSuccess");
		return "redirect:/user/mypage/results";
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String userLogout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@GetMapping("/result")
	public void result() {
		
	}
}
