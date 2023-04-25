package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant.Reservation;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.RestReservationService;

@Controller
public class RestReservationController {
	@Autowired
	private RestReservationService reService;
	
	@GetMapping("/restaurant/add")
	public String addReservation(Model model) {
		model.addAttribute("reservation", new Reservation());
		return "restaurant/addreservation";
	}
	
	
	@PostMapping("/reservation/post")
	public String postReservation(@ModelAttribute("reservation") Reservation res,@DateTimeFormat(pattern="yyyy-MM-dd") Date date, Model model) {
		res.setDate(date);
		reService.addreservation(res);
		model.addAttribute("reservation",new Reservation());
		return "restaurant/addreservation";
	}
}
