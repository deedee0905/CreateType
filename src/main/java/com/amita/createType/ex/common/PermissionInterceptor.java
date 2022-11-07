package com.amita.createType.ex.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class PermissionInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler) throws IOException {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
	
		String uri = request.getRequestURI();
		
		// 로그인이 되어있는 경우
		// main content view로 이동하고
		// 로그아웃 전까지 signup/view, signin/view 페이지 접근 불가
		if(userId != null) {
			
			if(uri.startsWith("/user")) {
				response.sendRedirect("/post/main/view");
				return false;
			}
			
		} 
	
		return true;
	}
	
	@Override
	public void postHandle(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler
			, ModelAndView modelAndView
			) {
		
		
		
		
		
	}
	
	@Override
	public void afterCompletion(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler
			, Exception ex
			) {
		
	}

}
