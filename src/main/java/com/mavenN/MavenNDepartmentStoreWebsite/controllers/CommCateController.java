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

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CommCate;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.CommCateService;



@Controller
public class CommCateController {
	@Autowired
	private CommCateService CommCateService;
	
	
	@GetMapping("/Store/CommCate")
	public String Storeindex() {
		return "Store/CommCate";
	}
	
//	新增已成功 已可成功寫入資料庫
	@GetMapping("/Store/CommCate/add")
	public String addCommCate(CommCate cate, Model model) {
		model.addAttribute("cate",new CommCate());
		return "Store/CommCate/CommCateBackadd";
	}
	
	@PostMapping("/Store/CommCate/post")
	public String postCate(@ModelAttribute("cate")CommCate cate, Model model) {
		CommCateService.addComm(cate);
		model.addAttribute("cate",cate);

		return "redirect:/Store/Commcate/CommCateBack";
	}
	

	
	
//	刪除
	@DeleteMapping("/Store/Commcate/delete")
	public String deleteCate(@RequestParam Integer cate_Id) {
		CommCateService.deleteById(cate_Id);
		return "redirect:/Store/Commcate/ShowAll";
	}
	
	
	
	
//	尚未實驗
//	@GetMapping("/CommCate")
//	public String findAllCate(Model model) {
//		List<CommCate> findAllCate= CommCateService.findAllCate();
//		model.addAttribute("cateList",findAllCate);
//		return "/Store/CommCate/CommCate";
//	}
	
	//可讀取清單
	@GetMapping("/Store/Commcate/CommCateBack")
	public  String findAllCommCateBack(Model model) {
		List<CommCate> findAllCate = CommCateService.findAllCate();
		model.addAttribute("cateList",findAllCate);
		return "/Store/CommCate/CommCateBack";
	}
	

	
//	讀取所有資料
	@GetMapping("/Store/Commcate/ShowAll")
	public String ShowAllCommCate(Model model) {
		List<CommCate> findAllCate = CommCateService.findAllCate();
		model.addAttribute("cateList",findAllCate);
		return "/Store/CommCate/CommCateBack";
	}
	
	
//	更新資料
	@GetMapping("/Store/Commcate/editCommCate")
	public String editCommCate(@RequestParam("cate_Id")Integer cate_Id, Model model) {
		CommCate cate=CommCateService.findcateById(cate_Id);
		model.addAttribute("cate",cate);
		return"/Store/CommCate/CommCateEdit";
		
	}

	@PutMapping("/Store/Commcate/editCommCate")
	public String puteditCate(@ModelAttribute("cate")CommCate cate) {
		CommCateService.updateCommById(cate.getCate_Id(), cate);
		return "redirect:/Store/Commcate/ShowAll";
	}

}