package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String postReservation(@ModelAttribute("reservation") Reservation res, Model model) {
		reService.addreservation(res);
		model.addAttribute("reservation",new Reservation());
		return "restaurant/addreservation";
	}
	
	@GetMapping("/restaurant")
	public String ShowAllReservation(Model model) {
		List<Reservation> findAllReservation = reService.findAllReservation();
		model.addAttribute("findAllReservation",findAllReservation);
		return "restaurant/showReservations";
	}
	
	@GetMapping("/restaurant/edit")
	public String editPage(@RequestParam("r_id") Integer r_id, Model model) {
		Reservation findbyid = reService.findreservationbyid(r_id);
		model.addAttribute("reservation",findbyid);
		return "restaurant/editReservation";
	}
	
	@PutMapping("/restaurant/edit")
	public String putEditReservation(@ModelAttribute("reservation") Reservation res) {
		reService.upDateReservationbyid(res.getR_id(), res.getName(), res.getTelephone(), 
										res.getEmail(), res.getRemark(), res.getDate(), 
										res.getTime_interval(), res.getTime(), 
										res.getAdult(), res.getChildren());
		return "redirect:/restaurant";
			
		
	}
	
		
	
	
}
