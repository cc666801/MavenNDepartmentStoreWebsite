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

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CommCate;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Commodity;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.CommCateService;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.CommodityService;

@Controller
public class CommodityController {

	@Autowired
	private CommodityService commodityService;

	
	@Autowired
	private CommCateService commCateService;
	
//	新增商品 

	@GetMapping("/Store/Commodity/add")
	public String addCommodity(Commodity commodity, Model model) {
		model.addAttribute("commodity", new Commodity());
		
		List<CommCate> commcateList = commCateService.findAllCate();
		model.addAttribute("commcateList", commcateList);
		
		return "Store/Commodity/CommodityBackadd";
	}

	@PostMapping("/Store/Commodity/post")
	public String postCommodity(@ModelAttribute("commodity") Commodity commodity, Model model,
			@RequestParam("transferToByteArray") MultipartFile comm_pictureFile) {
		if (!comm_pictureFile.isEmpty()) {
			try {
				// Get bytes of the uploaded file
				byte[] comm_Picture = comm_pictureFile.getBytes();
				commodity.setComm_Picture(comm_Picture);

			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		commodityService.addCommodity(commodity);
		model.addAttribute("commodity", commodity);

		return "redirect:/Store/Commodity/CommodityBack";
	}

//	讀取所有資料
//	@GetMapping("/Store/Commodity/CommodityBack")
//	public String findAllCommodityBack(Model model) {
//		List<Commodity> findAllCommodity = CommodityService.findAllCommodity();
//		model.addAttribute("commodityList",findAllCommodity);
//		return "/Store/Commodity/CommodityBack";
//	}
//	

	@GetMapping("/Store/Commodity/CommodityBack")
	public String findAllCommodityBack(Model model) {
		List<Commodity> findAllCommodity = commodityService.findAllCommodity();
		for (Commodity commodity : findAllCommodity) {
			byte[] imageData = commodity.getComm_Picture();
			if (imageData != null) {
				String base64String = Base64.getEncoder().encodeToString(imageData);
				commodity.setBase64Stringcomm_Picture(base64String);
			}
		}
		model.addAttribute("commodityList", findAllCommodity);
		return "/Store/Commodity/CommodityBack";
	}

//	讀取所有資料 (可將路徑設為 ShowAll)
	@GetMapping("/Store/Commodity/ShowAll")
	public String ShowAllCommodity(Model model) {
		List<Commodity> findAllCommodity = commodityService.findAllCommodity();
		for (Commodity commodity : findAllCommodity) {
			byte[] imageData = commodity.getComm_Picture();
			if (imageData != null) {
				String base64String = Base64.getEncoder().encodeToString(imageData);
				commodity.setBase64Stringcomm_Picture(base64String);
			}
		}

		model.addAttribute("commodityList", findAllCommodity);
		return "/Store/Commodity/CommodityBack";
	}

//	刪除資料 透過 id
	@DeleteMapping("/Store/Commodity/delete")
	public String deleteCommodity(@RequestParam Integer comm_Id) {
		commodityService.deleteById(comm_Id);
		return "redirect:/Store/Commodity/CommodityBack";
	}

//	更新
	@GetMapping("Store/Commodity/editCommodity")
	public String editCommodity(@RequestParam("comm_Id") Integer comm_Id, Model model) {
		Commodity commodity = commodityService.findCommodityById(comm_Id);

		model.addAttribute("commodity", commodity);
		return "Store/Commodity/CommodityEdit";

	}

	@PutMapping("Store/Commodity/editCommodity")
	public String puteditCommodity(@ModelAttribute("commodity") Commodity commodity,
			@RequestParam(value = "transferToByteArray", required = false) MultipartFile comm_pictureFile) {
		if (comm_pictureFile != null && !comm_pictureFile.isEmpty()) {
			try {
				// Get bytes of the uploaded file
				byte[] comm_Picture = comm_pictureFile.getBytes();
				commodity.setComm_Picture(comm_Picture);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			Commodity oldCommodity = commodityService.findCommodityById(commodity.getComm_Id());
			commodity.setComm_Picture(oldCommodity.getComm_Picture());
		}
		commodityService.updateCommodityById(commodity.getComm_Id(), commodity);
		return "redirect:/Store/Commodity/CommodityBack";
	}

	

	
	
	
	
	
	public CommodityController() {
		// TODO Auto-generated constructor stub
	}

}
