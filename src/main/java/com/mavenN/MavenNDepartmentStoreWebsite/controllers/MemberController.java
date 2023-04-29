package com.mavenN.MavenNDepartmentStoreWebsite.controllers;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;

	
	// 新增會員
	@GetMapping("/member/register")
	public String addMember(Model model) {
		model.addAttribute("member",new Member());
		return "member/addMemberPage";//跳到JSP
		
	}
	
	@PostMapping("members/post")
	public String postMember(@ModelAttribute("members")Member mem) {
		mService.addMember(mem);
		return "/";
	}
	
	// 搜索所有會員
		@GetMapping("/member")
		public String findAllLostBack(Model model){
			List<Member> findAllLost=mService.findAllMember();
			model.addAttribute("lostList", findAllLost);
			return "";
		}
	
	// 搜索單筆會員

	
	// 更新會員資料	
	
	
	
	
	// 刪除會員資料

	
	

	
	

////-------------------------------------------------------------------------
//
//	// 新增會員最愛資料
//	@ResponseBody
//	@PostMapping("/newmemberfavorite")
//	public ResponseEntity<Void> createMemberFavorite(@RequestBody MemberFavorite memberFavorite) {
//	    memberService.createMemberFavorite(memberFavorite);
//	    return new ResponseEntity<>(HttpStatus.CREATED);
//	}
//	
//	// 刪除會員最愛資料
//	@ResponseBody
//	@DeleteMapping("/deletememberfavorite/{id}")
//	public ResponseEntity<Void> deleteMemberFavorite(@PathVariable Integer id) {
//	    memberService.deleteMemberFavorite(id);
//	    return new ResponseEntity<>(HttpStatus.OK);
//	}
//	
//	// 搜尋會員所有最愛資料
//	@ResponseBody
//	@GetMapping("/allmemberfavorite/{memberAccount}")
//	public ResponseEntity<List<MemberFavorite>> getMemberFavoritesByAccount(@PathVariable String memberAccount) {
//		List<MemberFavorite> memberFavorites = memberService.getMemberFavoritesByAccount(memberAccount);
//		return new ResponseEntity<>(memberFavorites, memberFavorites.isEmpty() ? HttpStatus.NOT_FOUND : HttpStatus.OK);
//	}
//	
////-------------------------------------------------------------------------
//	
//	// 新增會員等級
//	@ResponseBody
//	@PostMapping("/newmemberlevel")
//	public ResponseEntity<Void> createMemberLevel(@RequestBody MemberLevel memberLevel) {
//		memberService.createMemberLevel(memberLevel);
//		return new ResponseEntity<>(HttpStatus.CREATED);
//	}
//
//	// 搜尋會員等級資料
//	@ResponseBody
//	@GetMapping("/memberlevel/{memberAccount}")
//	public ResponseEntity<List<MemberLevel>> findMemberLevelByMemberAccount(@PathVariable String memberAccount) {
//		List<MemberLevel> memberLevels = memberService.findMemberLevelByMemberAccount(memberAccount);
//		return new ResponseEntity<>(memberLevels, memberLevels.isEmpty() ? HttpStatus.NOT_FOUND : HttpStatus.OK);
//	}
//
//	// 更新會員等級
//	@ResponseBody
//	@PutMapping("/updatememberlevel")
//	public ResponseEntity<Void> updateMemberLevel(@RequestBody MemberLevel memberLevel) {
//		memberService.updateMemberLevel(memberLevel);
//		return new ResponseEntity<>(HttpStatus.OK);
//	}
//	
////-------------------------------------------------------------------------
//
//	// 新增會員違規紀錄
//	@ResponseBody
//	@PostMapping("/newmembershopviolation")
//	public ResponseEntity<Void> createMemberShopViolation(@RequestBody MemberShopViolation memberShopViolation) {
//		memberService.createMemberShopViolation(memberShopViolation);
//		return new ResponseEntity<>(HttpStatus.CREATED);
//	}
//
//	// 查詢會員違規紀錄
//	@ResponseBody
//	@GetMapping("/membershopviolation/{memberAccount}")
//	public ResponseEntity<List<MemberShopViolation>> getMemberShopViolationsByAccount(
//			@PathVariable String memberAccount) {
//		List<MemberShopViolation> memberShopViolations = memberService.getMemberShopViolationsByAccount(memberAccount);
//		return new ResponseEntity<>(memberShopViolations,
//				memberShopViolations.isEmpty() ? HttpStatus.NOT_FOUND : HttpStatus.OK);
//	}
//
//	// 更新違規紀錄
//	@ResponseBody
//	@PutMapping("/updatemembershopviolation")
//	public ResponseEntity<Void> updateMemberShopViolation(@RequestBody MemberShopViolation memberShopViolation) {
//		memberService.updateMemberShopViolation(memberShopViolation);
//		return new ResponseEntity<>(HttpStatus.OK);
//	}
//
//	// 刪除違規紀錄
//	@ResponseBody
//	@DeleteMapping("/deletemembershopviolation/{id}")
//	public ResponseEntity<Void> deleteMemberShopViolation(@PathVariable Integer id) {
//		memberService.deleteMemberShopViolation(id);
//		return new ResponseEntity<>(HttpStatus.OK);
//	}

}
