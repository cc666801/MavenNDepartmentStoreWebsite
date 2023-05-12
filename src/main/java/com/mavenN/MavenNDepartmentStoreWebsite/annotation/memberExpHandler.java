package com.mavenN.MavenNDepartmentStoreWebsite.annotation;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.memberNullException;

@ControllerAdvice
public class memberExpHandler {
	
	@ExceptionHandler(memberNullException.class)//列外處理 不用路徑
	public String jumpToLogin() {
		return "redirect:/member/login";
	}
	
	
}
