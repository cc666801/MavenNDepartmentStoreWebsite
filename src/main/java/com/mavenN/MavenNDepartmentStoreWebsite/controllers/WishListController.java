package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.store.WishList;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.CommodityService;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.MemberService;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.WishListService;

@Controller
public class WishListController {

	@Autowired
	private CommodityService commodityService;

	@Autowired
	private MemberService mService;

	@Autowired
	private WishListService wishListService;

//	新增商品 進入心願清單之中
	@PostMapping(value = "/wishlist/addtowishlist")
	public String addToWishList(@RequestParam(name = "commId") Integer commId,HttpSession session,
	                            Model model) {
	    try {
		    Member currentMember = (Member) session.getAttribute("member");
	        wishListService.addToWishList(commId, currentMember);
	    } catch (Exception e) {
	    }
	    return "redirect:/Store/wishList/readwishlist";
	}


//	這原本可看到心願清單...
//	@GetMapping("/Store/wishList/readwishlist")
//	public String getWishListStatus(Model model){
//		List<Commodity> commodity = commodityService.findAllCommodity();
//		model.addAttribute("wishList",commodity);
//		return "/Store/wishList/wishList";
//	}
	
	
//	10:50 開改
	@GetMapping("/Store/wishList/readwishlist")
	public String getWishListStatus(Model model,HttpSession session){
		Member currentMember = (Member) session.getAttribute("member");
		List<WishList> wishListInfo = wishListService.findWishListByMember(currentMember);
		model.addAttribute("wishListInfo", wishListInfo);

		return "/Store/wishList/wishList";
	}
	
	
	public WishListController() {
		// TODO Auto-generated constructor stub
	}

}