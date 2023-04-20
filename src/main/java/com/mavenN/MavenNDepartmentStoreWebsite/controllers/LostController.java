package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.LostAndFound;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.LostService;


@Controller
public class LostController {
	
	@Autowired
	private LostService lostService;
	
	@GetMapping("/LostAndFound")
	public String lostAndFound() {
		return "/lost/LostAndFound";
	}
	
	@GetMapping("/LostAndFoundBack/add")
	public String addLost(@ModelAttribute("lost")LostAndFound lost,Model model) {
		lostService.addLost(lost);
		model.addAttribute("lost",new LostAndFound());	
		return "/lost/LostAndFoundBackAdd";
	}
	@PostMapping("/LostAndFoundBack/post")
	public String postLost(@ModelAttribute("lost")LostAndFound lost,Model model) {
		lostService.addLost(lost);
		model.addAttribute("lost",new LostAndFound());	
		return "/lost/LostAndFoundBack";
	}
	
	public List<LostAndFound> findAllLost(){
		List<LostAndFound> findAllLost=lostService.findAll();
	}
	
	
}
