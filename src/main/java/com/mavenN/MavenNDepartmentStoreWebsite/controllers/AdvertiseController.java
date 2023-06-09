package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.store.Advertise;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.store.AdvertiseCate;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CommodityRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CompanyRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.AdvertiseCateService;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.AdvertiseService;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.CommodityService;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.MemberService;

@Controller
public class AdvertiseController {

	@Autowired
	private AdvertiseService advertiseService;

	
	@Autowired
	private AdvertiseCateService advertiseCateService;
	
	@Autowired
	private  CommodityService commodityService;
	
	@Autowired
	private CommodityRepository commodityRepository;
	

	@Autowired
	private CompanyRepository companyRepository;
	
	
	@Autowired
	private MemberService mService;
	
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
		
		
//		5/11  把這個controller 帶回 由 homeController來做
//	嘗試顯示圖片在主畫面之中
//	嘗試把資料庫圖片塞入網頁之中
//	嘗試顯示 廣告上下架
//	@GetMapping(value = { "/" })
//	public String showAdPicture(Model model,HttpSession session) {
////		顯示廣告
//		List<Advertise> findAllAdvertise = advertiseService.findAllAdvertise();
//		for (Advertise advertise : findAllAdvertise) {
//			byte[] imageData = advertise.getAdvertisePicture();
//			if (imageData != null) {
//				String base64String = Base64.getEncoder().encodeToString(imageData);
//				advertise.setBase64StringadvertisePicture(base64String);
//			}
//		}
//
//		model.addAttribute("findAllAdvertise",findAllAdvertise);
//				
////		找尋所有商品
//		List<Commodity> findAllCommodities = commodityService.findAllCommodity();
//		
//		
//		  for (Commodity commodity : findAllCommodities) {
//		        byte[] imageData = commodity.getCommPicture();
//		        if (imageData != null) {
//		            String base64String = Base64.getEncoder().encodeToString(imageData);
//		            commodity.setBase64StringcommPicture(base64String);
//		        }
//		    }
//		
//		  
//		  model.addAttribute("findAllCommodities",findAllCommodities);
//		
////		  商品按照點擊次數排序
//		  List<Commodity> hotCommodities = commodityRepository.findByOrderByCommClickDesc();
//		    model.addAttribute("hotCommodities", hotCommodities);
//		
////		    廣告上下架
//		List<Advertise> shelvesIsTrue = advertiseService.findByAdvertiseShelveIsTrue();
//		    model.addAttribute("shelvesIsTrue",shelvesIsTrue);
//		
////		    會員的
//		    Member member = (Member) session.getAttribute("member");
//		    if(member != null) {
//		        Member updatedMember = mService.findMemberById(member.getId());
//		        session.setAttribute("member", updatedMember);
//		    }
//
//		    
//		    return "frontend/index";
//		}


//	找單獨一支廣告 原本可做動版本
	
//	@GetMapping("/Advertise/Advertise/findAdvertise")
//	public String findByAdveretiseId(@RequestParam(name="advertiseId")Integer advertise,Model model) {
//		Advertise advertiseInfo = advertiseService.findAdvertiseById(advertise);
//		advertiseService.recordClick(advertise);
//		
//
//
//		model.addAttribute("advertiseInfo",advertiseInfo);
//		return "Advertise/Advertise/advertiseDetail";
//	}
//	
	
		
	
	
//	修改版本   5/10   可做動版本  這個可以紀錄點擊次數 且 點擊次數超過設定時 讓廣告下架
	
//	@GetMapping("/Advertise/Advertise/findAdvertise")
//	public String findByAdveretiseId(@RequestParam(name="advertiseId")Integer advertise,Model model) {
//		Advertise advertiseInfo = advertiseService.findAdvertiseById(advertise);
//		advertiseService.recordClickAndUpdateShelve(advertise);
//		
//		model.addAttribute("advertiseInfo",advertiseInfo);
//		return "Advertise/Advertise/advertiseDetail";
//	}
	

	
	
	
	//	5/10  14:0測試時間 成功! 
//	@GetMapping("/Advertise/Advertise/findAdvertise")
//	public String findByAdveretiseId(@RequestParam(name="advertiseId")Integer advertise,Model model) {
//		Advertise advertiseInfo = advertiseService.updateAdvertiseStatus(advertise);
//								
//		
//		model.addAttribute("advertiseInfo",advertiseInfo);
//		return "Advertise/Advertise/advertiseDetail";
//	}
	
	
	
	//	5/10  三點要測試送廣告圖片到廣告詳細資料
	@GetMapping("/Advertise/Advertise/findAdvertise")
	public String findByAdveretiseId(@RequestParam(name="advertiseId")Integer advertise,Model model) {
		Advertise advertiseInfo = advertiseService.updateAdvertiseStatus(advertise);
		Advertise advertiseDetail = advertiseService.findAdvertiseById(advertise);
		byte[] imageData = advertiseDetail.getAdvertisePicture(); // 取得廣告圖片資料
		if (imageData != null) {
		    String base64String = Base64.getEncoder().encodeToString(imageData);
		    advertiseDetail.setBase64StringadvertisePicture(base64String); // 將 Base64 編碼後的字串設定到 advertiseDetail 物件的 base64StringadvertisePicture 欄位中
		}
		model.addAttribute("advertiseInfo",advertiseInfo);
		model.addAttribute("advertiseDetail",advertiseDetail);
		return "Advertise/Advertise/advertiseDetail";
	
	}
	
	}
	
	
