package com.mavenN.MavenNDepartmentStoreWebsite.annotation;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.memberNullException;

@ControllerAdvice
public class memberExpHandler {
	
	@ExceptionHandler(memberNullException.class)//列外處理 不用路徑
	public String jumpToLogin(RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("msg","請先登入再進行操作");
		return "redirect:/member/login";
	}
	
	
}
