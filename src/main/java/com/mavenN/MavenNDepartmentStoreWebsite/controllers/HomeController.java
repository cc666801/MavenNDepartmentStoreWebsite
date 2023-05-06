package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	@GetMapping(value = { "/" })
	public String getHomePage() {
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

	
//	5/5  嘗試新增錯誤頁面
//	@GetMapping(value = {"/error"})
//	@ControllerAdvice
//	public class ExceptionHandlerController {
//		@ExceptionHandler(Exception.class)
//		public ModelAndView handleException(HttpServletRequest request, Exception ex) {
//			ModelAndView modelAndView = new ModelAndView();
//			modelAndView.addObject("exception", ex);
//			modelAndView.addObject("url", request.getRequestURL());
//			modelAndView.setViewName("error");
//			return modelAndView;
//		}
	}


