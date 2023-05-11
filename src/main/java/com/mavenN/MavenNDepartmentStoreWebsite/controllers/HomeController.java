package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.MemberService;

@Controller
public class HomeController {
	
	@Autowired
	private MemberService mService;
	
	@GetMapping(value = { "/" })
	public String getHomePage(HttpSession session) {
	    Member member = (Member) session.getAttribute("member");
	    if(member != null) {
	        Member updatedMember = mService.findMemberById(member.getId());
	        session.setAttribute("member", updatedMember);
	    }
	    return "frontend/index";
	}

	@GetMapping(value = { "/exampleFrontendPage" })
	public String getExamplePage() {
		return "example/exampleFrontendPage";
	}

	@GetMapping(value = { "/backend" })
	public String getBackendPage() {
		return "backend/index";
	}

	
	













}


