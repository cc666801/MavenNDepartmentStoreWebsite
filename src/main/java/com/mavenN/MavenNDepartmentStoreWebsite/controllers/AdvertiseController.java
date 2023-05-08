package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.io.IOException;
import java.util.Base64;
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
import org.springframework.web.multipart.MultipartFile;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Commodity;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.store.Advertise;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.store.AdvertiseCate;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CompanyRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.AdvertiseCateService;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.AdvertiseService;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.CompanyService;

@Controller
public class AdvertiseController {

	@Autowired
	private AdvertiseService advertiseService;

	
	@Autowired
	private AdvertiseCateService advertiseCateService;
	

	@Autowired
	private CompanyRepository companyRepository;
	
//	新增廣告
	@GetMapping("/Advertise/Advertise/add")
	public String addAdvertise(Advertise advertise, Model model) {
		model.addAttribute("advertise", new Advertise());

		List<AdvertiseCate>	 AdvertiseCateList = advertiseCateService.findAllAdCate();
		model.addAttribute("AdvertiseCateList",AdvertiseCateList);
		
		List<Company> CompanyList = companyRepository.findAll();
		model.addAttribute("CompanyList",CompanyList);
		return "Advertise/Advertise/AdvertiseBackadd";

	}

	@PostMapping("/Advertise/Advertise/post")
	public String postAdvertise(@ModelAttribute("advertise") Advertise advertise, Model model,
			@RequestParam("transferToByteArray") MultipartFile advertisePictureFile) {

		if (!advertisePictureFile.isEmpty()) {
			try {
				// Get bytes of the uploaded file
				byte[] advertisePicture = advertisePictureFile.getBytes();
				advertise.setAdvertisePicture(advertisePicture);

			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		advertiseService.addadvertise(advertise);
		model.addAttribute("advertise",advertise);
		
		return "redirect:/Advertise/Advertise/advertiseBack";

	}

//	找尋所有廣告
	@GetMapping("/Advertise/Advertise/advertiseBack")
	public String findALLadvertiseBack(Model model) {
		List<Advertise> findAllAdvertise = advertiseService.findAllAdvertise();
		for (Advertise advertise :findAllAdvertise) {
			byte[] imageData = advertise.getAdvertisePicture();
			if (imageData != null) {
				String base64String = Base64.getEncoder().encodeToString(imageData);
				advertise.setBase64StringadvertisePicture(base64String);
			}
		}
		model.addAttribute("advertiseList",findAllAdvertise);
		return "/Advertise/Advertise/AdvertiseBack";
			
		
	}
	
	
//	刪除廣告 透過id
	
	@DeleteMapping("/Advertise/Advertise/delete")
	public String deleteAdvertiseById(@RequestParam Integer advertiseId) {
				advertiseService.deleteadvertiseById(advertiseId);
				return "redirect:/Advertise/Advertise/advertiseBack";

	}
	
	
	
//	更新廣告  透過 id (原版)
	
//	@GetMapping("/Advertise/Advertise/editAdvertise")
//	public String editAdvertise(@RequestParam("advertiseId") Integer advertiseId, Model model) {
//		Advertise advertise =advertiseService.findAdvertiseById(advertiseId);
//		
//		List<Advertise> advertiseList = advertiseService.findAllAdvertise();
//		model.addAttribute("advertiseList",advertiseList);
//		
//		model.addAttribute("advertise",advertise);		
//		return "/Advertise/Advertise/AdvertiseEdit";
//		
//		
//	}
	
//	更新
	@GetMapping("/Advertise/Advertise/editAdvertise")
	public String editAdvertise(@RequestParam("advertiseId") Integer advertiseId, Model model) {
	Advertise advertise = advertiseService.findAdvertiseById(advertiseId);
	
	List<AdvertiseCate> advertiseCateList = advertiseCateService.findAllAdCate();
	model.addAttribute("advertiseCateList", advertiseCateList);
	
	List<Company> companyList = companyRepository.findAll();
	model.addAttribute("companyList",companyList);

	model.addAttribute("advertise", advertise);
	return "/Advertise/Advertise/AdvertiseEdit";
	}
	
	
	
	
	@PutMapping("/Advertise/Advertise/editAdvertise")
	public String putEditAdvertise(@ModelAttribute("advertise") Advertise advertise,
			@RequestParam(value = "transferToByteArray", required = false) MultipartFile advertisePictureFile) {
		if (advertisePictureFile != null && !advertisePictureFile.isEmpty()) {
			try {
				// Get bytes of the uploaded file
				byte[] advertisePicture = advertisePictureFile.getBytes();
				advertise.setAdvertisePicture(advertisePicture);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			Advertise oldAdvertise = advertiseService.findAdvertiseById(advertise.getAdvertiseId());
			advertise.setAdvertisePicture(oldAdvertise.getAdvertisePicture());
		}
		advertiseService.updateAdvertiseById(advertise.getAdvertiseId(), advertise);
		return "redirect:/Advertise/Advertise/advertiseBack";
	}
		
		
		
//	嘗試顯示圖片在主畫面之中
//	嘗試把資料庫圖片塞入網頁之中
	@GetMapping(value = { "/" })
	public String showAdPicture(Model model) {
		List<Advertise> findAllAdvertise = advertiseService.findAllAdvertise();
		for (Advertise advertise : findAllAdvertise) {
			byte[] imageData = advertise.getAdvertisePicture();
			if (imageData != null) {
				String base64String = Base64.getEncoder().encodeToString(imageData);
				advertise.setBase64StringadvertisePicture(base64String);
			}
		}

		model.addAttribute("findAllAdvertise",findAllAdvertise);
				
		
		return "frontend/index";
		}


	
	
	
		
	}
	
	
