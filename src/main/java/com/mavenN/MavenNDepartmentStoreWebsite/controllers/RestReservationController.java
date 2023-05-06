package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.deser.Deserializers.Base;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant.Reservation;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.RestReservationService;

@Controller
public class RestReservationController {
	@Autowired
	private RestReservationService reService;
	
	@GetMapping("/restaurantfront/reservation")
	public String addreservations() {
		return "restaurantfront/addreservation";
	}
	
	
	@GetMapping("/restaurantfront/UserQueryCompany")
	public String showUserQueryCompany(@RequestParam("companyname") String companyname,
			@RequestParam(name="p",defaultValue = "1") Integer pageNumber,Model model) {
		Page<Company> userQueryCompany = reService.findByUserQueryCompany(companyname, pageNumber);
		for(Company company: userQueryCompany.getContent()) {
			byte[] companyLogo = company.getCompanyLogo();
			if(companyLogo != null) {
				String encodeToString = Base64.getEncoder().encodeToString(companyLogo);
				company.setBase64StringCompanyLogo(encodeToString); 
			}
		}
		
		model.addAttribute("page",userQueryCompany);
		return "restaurantfront/showrest";
	}
	
	
	@GetMapping("/restaurantfront")
	public String ShowAllReservationByPage(@RequestParam(name="p",defaultValue = "1") Integer pageNumber,Model model) {
		Page<Company> page = reService.findAllReservationByPage(pageNumber);
		for(Company company: page.getContent() ) {
			byte[] companyLogo = company.getCompanyLogo();
			if(companyLogo != null) {
				String encodeToString = Base64.getEncoder().encodeToString(companyLogo);
				company.setBase64StringCompanyLogo(encodeToString); 
			}
		}
		
		model.addAttribute("page",page);
		return "restaurantfront/showrest";
	}	
	
	@GetMapping("/restaurant/add")
	public String addReservation(Model model) {
		
		List<Company> findAllCompany = reService.findAllCompany();
		model.addAttribute("findAllCompany",findAllCompany);
		
		model.addAttribute("reservation", new Reservation());
		return "restaurant/addreservation";
	}
	
	
	@PostMapping("/reservation/post")
	public String postReservation(@ModelAttribute("reservation") Reservation res, Model model) {
		
		List<Company> findAllCompany = reService.findAllCompany();
		model.addAttribute("findAllCompany",findAllCompany);
		
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
		List<Company> findAllCompany = reService.findAllCompany();
		model.addAttribute("findAllCompany",findAllCompany);
		
		Reservation findbyid = reService.findreservationbyid(r_id);
		model.addAttribute("reservation",findbyid);
		return "restaurant/editReservation";
	}
	
	@PutMapping("/restaurant/edit")
	public String putEditReservation(@ModelAttribute("reservation") Reservation res) {
		reService.upDateReservationbyid(res.getR_id(), res.getName(), res.getTelephone(),
				                        res.getCompany(), res.getEmail(), res.getRemark(), 
				                        res.getDate(), res.getTime_interval(), res.getTime(), 
										res.getAdult(), res.getChildren());
		return "redirect:/restaurant";			
	}
	
	
	@DeleteMapping("restaurant/delete")
	public String deleteReservationbyRid(Integer r_id,Model model) {
		reService.deletebyid(r_id);
		return "redirect:/restaurant";
	}
	
	
}