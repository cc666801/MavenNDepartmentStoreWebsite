package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.memberSystem.MemberRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	@Autowired
	private MemberRepository mRepository;
	
	// 註冊會員  帳號重複不會顯示在前台
	@GetMapping("/member/register")
	public String addMember(Model model) {
		model.addAttribute("member", new Member());
		return "member/addMemberPage";// 跳到JSP

	}

	@PostMapping("/member/post")
	public String postMember(@ModelAttribute("member") Member mem, Model model) {
	    Optional<Member> existingMember = mRepository.findByAccount(mem.getAccount());
	    if (existingMember.isPresent()) {
	        model.addAttribute("error", "該帳號已經存在");
	        return "member/addMemberPage";
	    } else {
	        mService.addMember(mem);
	        return "member/jump";
	    }
	}

	// 搜索所有會員
	@GetMapping("/memberList")
	public String findAllLostBack(Model model) {
		List<Member> findAllMember = mService.findAllMember();
		model.addAttribute("memberList", findAllMember);
		return "member/memberList";
	}

	// 搜索單筆會員
	@GetMapping("/member/{id}")
	public String findMemberById(@PathVariable Integer id,Model model) {
		Member member = mService.findMemberById(id);
	    model.addAttribute("member", member);
	    return "member/memberdetail";
		
	}
	// 更新會員資料
	@GetMapping("/editmember/edit")
	public String editMember(@RequestParam("id") Integer id, Model model) {
		Member mem = mService.findMemberById(id);
		model.addAttribute("member", mem);
		return "member/editmember";
	}

	@PutMapping("/editmember/edit")
	public String putEditMember(@ModelAttribute("member") Member mem) {
		mService.updateMemberById(mem.getId(), mem);
		return "redirect:/memberlist";
	}

	// 刪除會員資料
	@DeleteMapping("/memberdelete/{id}")
	public String deleteMember(@PathVariable Integer id) {
		mService.deleteMemberById(id);
		return "redirect:/memberList";
	}

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
