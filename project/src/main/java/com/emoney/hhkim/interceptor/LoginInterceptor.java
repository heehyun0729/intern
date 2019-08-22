package com.emoney.hhkim.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("login");
		
		// 로그인되어 있지 않은 경우
		if(obj == null){
			// 요청했던 페이지로 돌아가기 위한 referer 구하기
			String referer = request.getHeader("referer");
			session.setAttribute("referer", referer);
			response.sendRedirect("/login");
			return false;
		}
		
		return true;
	}
}
