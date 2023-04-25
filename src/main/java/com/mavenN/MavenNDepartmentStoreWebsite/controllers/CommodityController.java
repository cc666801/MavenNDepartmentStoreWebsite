package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Commodity;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.CommodityService;

@Controller
public class CommodityController {

	@Autowired
	private CommodityService CommodityService;
	
	
//	新增商品 
	
	@GetMapping("/Store/Commodity/add")
	public String addCommodity(Commodity commodity,Model model) {
		model.addAttribute("commodity",new Commodity());
		return "Store/Commodity/CommodityBackadd";
	}
	
	
	@PostMapping("/Store/Commodity/post")
	public String postCommodity(@ModelAttribute("commodity")Commodity commodity,Model model,@RequestParam("transferToByteArray") MultipartFile comm_pictureFile
			) {if (!comm_pictureFile.isEmpty()) {    
				try {
					// Get bytes of the uploaded file
					byte[] comm_Picture = comm_pictureFile.getBytes();
					commodity.setComm_Picture(comm_Picture);
					
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		CommodityService.addCommodity(commodity);
		model.addAttribute("commodity",commodity);
		return"redirect:/Store/Commodity/CommodityBack";
	}
	
	
	
	
	
	
	
	
	
	
	public CommodityController() {
		// TODO Auto-generated constructor stub
	}

}
