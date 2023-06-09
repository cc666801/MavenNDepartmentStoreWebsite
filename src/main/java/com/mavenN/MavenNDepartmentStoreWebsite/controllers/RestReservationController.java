package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.util.Base64;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CompanyCounter;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant.Reservation;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant.RestaurantInformation;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.RestReservationService;

@Controller
public class RestReservationController {
	@Autowired
	private RestReservationService reService;
	
	@ResponseBody
	@GetMapping("/peopleoverten")
	public List<String> postMessageApi(@RequestParam("date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date date1, @RequestParam("restaurantId") Integer restaurantId){
		
		List<String> findTimeByPeopleCountOverTen = reService.findTimeByPeopleCountOverTen(date1, restaurantId);
		return findTimeByPeopleCountOverTen;
		
	}
	
	@GetMapping("restaurantfront/memberReservation/edit")
	public String memberEditPage(@RequestParam("r_id") Integer r_id,@RequestParam("restid") Integer restid, Model model) {
		RestaurantInformation findRestById = reService.findRestaurantById(restid);
		
		byte[] restLogo = findRestById.getCompany().getCompanyLogo();
		if(restLogo != null) {
			String encodeToString = Base64.getEncoder().encodeToString(restLogo);
			findRestById.getCompany().setBase64StringCompanyLogo(encodeToString);
		}
		
		model.addAttribute("findRestaurant", findRestById);
		
		List<CompanyCounter> restaurantCounter = reService.findCompanyCounter();
		model.addAttribute("restaurantCounter",restaurantCounter);
		
		Reservation findbyid = reService.findreservationbyid(r_id);
		model.addAttribute("memberReservation",findbyid);
		
		return "restaurantfront/editReservation";
	}
	
	@PutMapping("restaurantfront/memberReservation/edit")
	public String memberEditReservation(@ModelAttribute("memberReservation") Reservation res) {
		reService.upDateReservationbyid(res.getR_id(), res.getName(), res.getTelephone(),
				                        res.getRestaurantInformation(), res.getEmail(), res.getRemark(), 
				                        res.getDate(), res.getTimeInterval(), res.getTime(), 
										res.getAdult(), res.getChildren(), res.getMember());
		return "redirect:/restaurantfront";			
	}
	
	
	
	@DeleteMapping("/restaurantfront/memberReservation/delete")
	public String memberdeleteReservation(Integer r_id, Integer memberid,Model model) {
		reService.deletebyid(r_id);
		return "redirect:/restaurantfront/chickReservation?memberid="+ memberid;
	}
	
	@GetMapping("/restaurantfront/chickReservation")
	public String chickReservation(@RequestParam("memberid") Integer memberid, Model model) {
		List<Reservation> findMemberReservation = reService.findMemberReservation(memberid);
		model.addAttribute("memberReservation", findMemberReservation);
		
		return "/restaurantfront/memberReservation";
	}
	
	
	@PostMapping("/restaurantfront/post")
	public String restfrontReservation(@ModelAttribute("reservation") Reservation res, Model model) {
			
		reService.addreservation(res);
		model.addAttribute("reservation",new Reservation());
		return "redirect:/restaurantfront";
	}
	
//	@MemberLogin
	@GetMapping("/restaurantfront/reservation")
	public String addreservations(@RequestParam("restid") Integer restid,Model model) {
		RestaurantInformation findRestById = reService.findRestaurantById(restid);
		
		byte[] restLogo = findRestById.getCompany().getCompanyLogo();
		if(restLogo != null) {
			String encodeToString = Base64.getEncoder().encodeToString(restLogo);
			findRestById.getCompany().setBase64StringCompanyLogo(encodeToString);
		}
		
		model.addAttribute("findRestaurant", findRestById);
		
		List<CompanyCounter> restaurantCounter = reService.findCompanyCounter();
		model.addAttribute("restaurantCounter",restaurantCounter);
		
		model.addAttribute("reservation", new Reservation());
			
		return "restaurantfront/addreservation";
	}
	
	@GetMapping("/restaurantfront/UserQueryCompany")
	public String showUserQueryCompany(@RequestParam("companyname") String companyname,
			@RequestParam(name="p",defaultValue = "1") Integer pageNumber,Model model) {
		Page<RestaurantInformation> userQueryRestaurant = reService.findByUserQueryCompany(companyname, pageNumber);
		for(RestaurantInformation restaurant: userQueryRestaurant.getContent()) {
			byte[] companyLogo = restaurant.getCompany().getCompanyLogo();
			if(companyLogo != null) {
				String encodeToString = Base64.getEncoder().encodeToString(companyLogo);
				restaurant.getCompany().setBase64StringCompanyLogo(encodeToString); 
			}
		}
		
		model.addAttribute("page",userQueryRestaurant);
		return "restaurantfront/showrest";
	}
	
	
	@GetMapping("/restaurantfront")
	public String ShowAllReservationByPage(@RequestParam(name="p",defaultValue = "1") Integer pageNumber,Model model) {
		Page<RestaurantInformation> page = reService.findAllrestInformationPage(pageNumber);
		for(RestaurantInformation restaurant : page.getContent() ) {
			byte[] companyLogo = restaurant.getCompany().getCompanyLogo();
			if(companyLogo != null) {
				String encodeToString = Base64.getEncoder().encodeToString(companyLogo);
				restaurant.getCompany().setBase64StringCompanyLogo(encodeToString); 
			}

		}

		model.addAttribute("page",page);
		
		List<CompanyCounter> restaurantCounter = reService.findCompanyCounter();
		model.addAttribute("restaurantCounter",restaurantCounter);
		
		return "restaurantfront/showrest";
	}
	
	
	
//	以下為後台系統 ------------------
	@GetMapping("/restaurant/add")
	public String addReservation(Model model) {
		
		List<RestaurantInformation> findAllRestInformation = reService.findAllRestInformation();
		model.addAttribute("findAllRestInfor",findAllRestInformation);
		
		model.addAttribute("reservation", new Reservation());
		return "restaurant/addreservation";
	}
	
	
	@PostMapping("/reservation/post")
	public String postReservation(@ModelAttribute("reservation") Reservation res, Model model) {
		
		List<RestaurantInformation> findAllRestInformation = reService.findAllRestInformation();
		model.addAttribute("findAllRestInfor",findAllRestInformation);
		
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
		List<RestaurantInformation> findAllRestInformation = reService.findAllRestInformation();
		model.addAttribute("findAllRestInfor",findAllRestInformation);
		
		Reservation findbyid = reService.findreservationbyid(r_id);
		model.addAttribute("reservation",findbyid);
		return "restaurant/editReservation";
	}
	
	@PutMapping("/restaurant/edit")
	public String putEditReservation(@ModelAttribute("reservation") Reservation res) {
		reService.upDateReservationbyid(res.getR_id(), res.getName(), res.getTelephone(),
				                        res.getRestaurantInformation(), res.getEmail(), res.getRemark(), 
				                        res.getDate(), res.getTimeInterval(), res.getTime(), 
										res.getAdult(), res.getChildren(), res.getMember());
		return "redirect:/restaurant";			
	}
	
	
	@DeleteMapping("restaurant/delete")
	public String deleteReservationbyRid(Integer r_id,Model model) {
		reService.deletebyid(r_id);
		return "redirect:/restaurant";
	}
	
	
}
