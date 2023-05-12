package com.mavenN.MavenNDepartmentStoreWebsite.annotation;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.memberNullException;

@Aspect
@Component
public class MemberLoginFilter {
	@Autowired
	HttpSession httpSession;
	@Before("@annotation(com.mavenN.MavenNDepartmentStoreWebsite.annotation.MemberLogin)")
	public void MemberLoginMeth() {
		Object attribute = httpSession.getAttribute("member");
		if(attribute == null) {
			throw new memberNullException();
		}
		
	}
	

}
