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
		
		// �α��εǾ� ���� ���� ���
		if(obj == null){
			// ��û�ߴ� �������� ���ư��� ���� referer ���ϱ�
			String referer = request.getHeader("referer");
			session.setAttribute("referer", referer);
			response.sendRedirect("/login");
			return false;
		}
		
		return true;
	}
}
