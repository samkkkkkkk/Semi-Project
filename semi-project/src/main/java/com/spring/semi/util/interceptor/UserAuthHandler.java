package com.spring.semi.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class UserAuthHandler implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		if (session.getAttribute("userId") == null) {

			response.sendRedirect(request.getContextPath() + "/user/login");
			// false를 리턴시키면 컨트롤러로 요청이 전달되지 않습니다.
			return false;
		}

		// 로그인을 했다면 통과
		return true;
	}
}
