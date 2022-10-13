package com.amita.createType.ex.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.amita.createType.ex.common.FileManagerService;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	
	// 서버 특정 경로의 파일을 설정한 경로로 외부에서 접근 가능하도록 설정
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**")
		.addResourceLocations("file:///" + FileManagerService.FILE_UPLOAD_PATH + "/");
	}

}
