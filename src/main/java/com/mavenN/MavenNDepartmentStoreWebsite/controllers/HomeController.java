package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Commodity;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.store.Advertise;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CommodityRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CompanyRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.AdvertiseCateService;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.AdvertiseService;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.CommodityService;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.MemberService;

@Controller
public class HomeController {
	
	@Autowired
	private MemberService mService;
	
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
	
//	@GetMapping(value = { "/" })
//	public String getHomePage(HttpSession session) {
//	    Member member = (Member) session.getAttribute("member");
//	    if(member != null) {
//	        Member updatedMember = mService.findMemberById(member.getId());
//	        session.setAttribute("member", updatedMember);
//	    }
//	    return "frontend/index";
//	}
	
//	會員整合至 AdvertiseController之中 @GetMapping(value = { "/" })


	
	
//	嘗試顯示圖片在主畫面之中
//	嘗試把資料庫圖片塞入網頁之中
//	嘗試顯示 廣告上下架
	@GetMapping(value = { "/" })
	public String showAdPicture(Model model,HttpSession session) {
//		顯示廣告
		List<Advertise> findAllAdvertise = advertiseService.findAllAdvertise();
		for (Advertise advertise : findAllAdvertise) {
			byte[] imageData = advertise.getAdvertisePicture();
			if (imageData != null) {
				String base64String = Base64.getEncoder().encodeToString(imageData);
				advertise.setBase64StringadvertisePicture(base64String);
			}
		}

		model.addAttribute("findAllAdvertise",findAllAdvertise);
				
//		找尋所有商品
		List<Commodity> findAllCommodities = commodityService.findAllCommodity();
		
		
		  for (Commodity commodity : findAllCommodities) {
		        byte[] imageData = commodity.getCommPicture();
		        if (imageData != null) {
		            String base64String = Base64.getEncoder().encodeToString(imageData);
		            commodity.setBase64StringcommPicture(base64String);
		        }
		    }
		
		  
		  model.addAttribute("findAllCommodities",findAllCommodities);
		
//		  商品按照點擊次數排序 且檢查上下架狀態。
		  List<Commodity> hotCommodities = commodityRepository.findByCommShelveIsTrueOrderByCommClickDesc();
		    model.addAttribute("hotCommodities", hotCommodities);
		    
		    

		    
		    
		
//		    廣告上下架
		List<Advertise> shelvesIsTrue = advertiseService.findByAdvertiseShelveIsTrue();
		    model.addAttribute("shelvesIsTrue",shelvesIsTrue);
		
//		    會員的
		    Member member = (Member) session.getAttribute("member");
		    if(member != null) {
		        Member updatedMember = mService.findMemberById(member.getId());
		        session.setAttribute("member", updatedMember);
		    }

		    
		    return "frontend/index";
		}
	
	
	
	
	
	
	@GetMapping(value = { "/exampleFrontendPage" })
	public String getExamplePage() {
		return "example/exampleFrontendPage";
	}

	@GetMapping(value = { "/backend" })
	public String getBackendPage() {
		return "backend/index";
	}

	
	













}


