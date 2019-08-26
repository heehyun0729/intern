package com.emoney.hhkim.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class RefererInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		// ��û�ߴ� �������� ���ư��� ���� referer ���ϱ�
		String referer = request.getHeader("referer");
		session.setAttribute("referer", referer);
		return true;
	}
}
