package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CommCate;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.CommCateService;



@Controller
public class CommCateController {
	@Autowired
	private CommCateService CommCateService;
	
	
//	@GetMapping("/Store/CommCate")
//	public String Storeindex() {
//		return "Store/CommCate";
//	}
//	
	
	@GetMapping("/CommCate/add")
	public String addCommCate() {
		return "Store/CommCate/CommCateBackadd";
	}
	
//	找到所有類別
	@GetMapping("/CommCate")
	public String CommCate(Model model) {
		List<CommCate> findAllCate = CommCateService.findAllCate();
		model.addAttribute("CateList",findAllCate);
		return "Store/CommCate/CommCate";
	}
	
	
	
	
// 新增類別	
	
//	@GetMapping("/CommCate/add")
//	public String addCommCate(@ModelAttribute("CommCate")CommCate cate ,Model model) {
//		model.addAttribute("Cate",new CommCate());
//				
//		return "CommCate/CommCateBackadd";
//	}
//	

}