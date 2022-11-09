package com.amita.createType.ex.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.amita.createType.ex.common.FileManagerService;
import com.amita.createType.ex.common.PermissionInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	
	@Autowired
	private PermissionInterceptor interceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry resgisty) {
		
		resgisty.addInterceptor(interceptor)
		.addPathPatterns("/**") //인터셉터를 거쳐서 처리할 페이지 규칙
		 // 예외적으로 처리하지 않는 url 설정하기
		.excludePathPatterns("/static/**"
				, "/images/**"
				, "/user/signout" // 로그아웃 기능
				, "/individual/channel/view" //individual 관련 기능
				, "/individual/profile/view"
				, "/post/main/view" // post 관련 기능
				, "/post/create/postObject/view"
				, "/post/createList/view"
				, "/post/postAll/view"
				, "/post/search/view"
				, "/commision/postObject/view" // commision 관련 기능
				, "/commision/List/view"
				, "/commision/postAll/view"
				);
		
	}
	
	
	
	// 서버 특정 경로의 파일을 설정한 경로로 외부에서 접근 가능하도록 설정
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**")
		.addResourceLocations("file://" + FileManagerService.FILE_UPLOAD_PATH + "/");
	}
	

}
