package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;
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
	public String addToWishList(@RequestParam(name = "commId") Integer commId,
	                            @AuthenticationPrincipal Member member,
	                            Model model) {
	    try {
	        member = mService.findMemberById(member.getId());
	        wishListService.addToWishList(commId, member);
	    } catch (Exception e) {
	    }
	    return "redirect:/Store/wishlist/readwishlist";
	}


//	這可看到心願清單...
	@GetMapping("/Store/wishList/readwishlist")
	public String getWishListStatus(){
		return "/Store/wishList/wishList";
	}
	
	
	public WishListController() {
		// TODO Auto-generated constructor stub
	}

}