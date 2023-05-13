package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
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
	@PostMapping(value = "/wishlist/addtowishlist", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> addToWishList(@RequestParam Integer commId, @AuthenticationPrincipal Member member) {
	try {
	member = mService.findMemberById(member.getId());
	wishListService.addToWishList(commId, member);
	return ResponseEntity.ok("成功加入心願清單！");
	} catch (Exception e) {
	return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("添加心願清單時出錯：" + e.getMessage());
	}
	}
	
	

	
	
	public WishListController() {
		// TODO Auto-generated constructor stub
	}

}