package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;

@Controller
public class OrderController {

	@GetMapping(value = {"/orderSystem/order"})
	public String getOrderStatus(){
		return "orderSystem/orderStatus";
	}
	
	
	@PostMapping(value = {"/orderSystem/order/post"})
	public String getOrderStatusByPost(HttpSession session){
		return "orderSystem/orderStatus";
	}

}
