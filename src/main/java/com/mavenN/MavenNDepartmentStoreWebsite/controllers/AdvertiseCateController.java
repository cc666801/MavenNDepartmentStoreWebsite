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

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.store.AdvertiseCate;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.AdvertiseCateService;

@Controller
public class AdvertiseCateController {

	@Autowired
	private AdvertiseCateService advertiseCateService;

//	新增類別

	@GetMapping("/Advertise/Adv/addAdvertiseCate")
	public String addAdvertiseCate(AdvertiseCate advertiseCate, Model model) {
		model.addAttribute("advertiseCate", new AdvertiseCate());// 前面的是 該類別名稱 ， 後面是因為這是新增 所以使用 new 來創建一個新物件承接。
		return "Advertise/Adv/AdvertiseCateBackadd";// 透過該類別名稱(AdvertiseCate) 就可以帶到下一個頁面。

	}

	@PostMapping("/Advertise/Adv/postAdvertiseCate")
	public String postAdvertiseCate(@ModelAttribute("advertiseCate") AdvertiseCate advertiseCate, Model model) {
		advertiseCateService.addAdvertiseCate(advertiseCate);
		model.addAttribute("advertiseCate", advertiseCate);

		return "redirect:/Advertise/Adv/ShowAllAdCate";

	}

//	讀取清單

	@GetMapping("/Advertise/Adv/ShowAllAdCate")
	public String findAllAdCateBack(Model model) {

		List<AdvertiseCate> findAllAdCate = advertiseCateService.findAllAdCate();
		model.addAttribute("AdCateList", findAllAdCate);
		return "/Advertise/Adv/AdvertiseCateBack";

	}

//	刪除

	@DeleteMapping("/Advertise/Adv/deleteAdCate")
	public String deleteAdCate(@RequestParam Integer advertiseCateId) {
		advertiseCateService.deleteById(advertiseCateId);
		return "redirect:/Advertise/Adv/ShowAllAdCate";
	}

//	更新
	@GetMapping("/Advertise/Adv/editAdCate")
	public String editAdCate(@RequestParam("advertiseCateId") Integer advertiseCateId, Model model) {
		AdvertiseCate advertiseCate = advertiseCateService.findAdCateById(advertiseCateId);
		model.addAttribute("advertiseCate", advertiseCate);

		return "/Advertise/Adv/AdvertiseCateEdit";

	}

	@PutMapping("/Advertise/Adv/editAdCate")
	public String puteditAdCate(@ModelAttribute("advertiseCate") AdvertiseCate advertiseCate) {
		advertiseCateService.updateAdCateById(advertiseCate.getAdvertiseCateId() , advertiseCate);
		return "redirect:/Advertise/Adv/ShowAllAdCate";
		
	}
	
	
	
	
}
