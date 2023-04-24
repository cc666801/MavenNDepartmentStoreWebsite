package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.customerService.LostAndFound;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.LostService;


@Controller
public class LostController {
	
	@Autowired
	private LostService lostService;

//Front-end
	@GetMapping("/LostAndFound")
	public String findAllLost(Model model){
		List<LostAndFound> findAllLost=lostService.findAllLost();
		model.addAttribute("lostList", findAllLost);
		return "/customerService/lost/LostAndFound";
	}
	
	
	
//Backend	
	
	@GetMapping("/LostAndFoundBack/add")
	public String addLost(Model model) {
		model.addAttribute("lost",new LostAndFound());	
		return "/customerService/lost/LostAndFoundBackAdd";
	}
	@PostMapping("/LostAndFoundBack/post")
	public String postLost(@ModelAttribute("lost")LostAndFound lost,Model model) {
		lostService.addLost(lost);	
		return "redirect:/LostAndFoundBack";
	}	
	
	@GetMapping("/LostAndFoundBack")
	public String findAllLostBack(Model model){
		List<LostAndFound> findAllLost=lostService.findAllLost();
		model.addAttribute("lostList", findAllLost);
		return "/customerService/lost/LostAndFoundBack";
	}
		
	@DeleteMapping("/LostAndFoundBack/delete")
	public String deleteLost(@RequestParam Integer id) {
		lostService.deleteLostById(id);
		return "redirect:/LostAndFoundBack";
	}
	@GetMapping("/LostAndFoundBack/edit")
	public String editLost(@RequestParam("id") Integer id, Model model) {
		LostAndFound lost=lostService.findLostById(id);
		model.addAttribute("lost", lost);
		return "/customerService/lost/LostAndFoundBackEdit";
	}
	
	@PutMapping("/LostAndFoundBack/edit")
	public String putEditLost(@ModelAttribute("lost") LostAndFound lost) {
		 lostService.updateLostById(lost.getId(),lost);
		 return "redirect:/LostAndFoundBack";
	}
	
	
	
}
