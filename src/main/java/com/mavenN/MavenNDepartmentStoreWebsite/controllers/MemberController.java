package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.MemberFavorite;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.MemberLevel;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.MemberShopViolation;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.MemberSystem;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.memberSystem.MemberSystemRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberSystemRepository memberSystemRepository;

	// 新增會員
	@ResponseBody
	@PostMapping("/member/add")
	public MemberSystem addOneMember(@RequestBody MemberSystem mem) {
		MemberSystem resMember = memberSystemRepository.save(mem);
		return resMember;
	}

	// 搜索單筆會員
	@ResponseBody
	@GetMapping("/member/{id}")
	public MemberSystem getOneMemberById(@PathVariable Integer id) {
		Optional<MemberSystem> option = memberSystemRepository.findById(id);

		if (option.isPresent()) {
			MemberSystem result = option.get();
			return result;
		}

		return null;
	}

	// 搜索所有會員
	@ResponseBody
	@GetMapping("/allmember")
	public List<MemberSystem> findAllMember() {
		List<MemberSystem> findAll = memberSystemRepository.findAll();

		return findAll;
	}

//	// 更新會員資料
//	@ResponseBody
//	@PutMapping("/member/update")
//	

	// 刪除會員資料
	@ResponseBody
	@DeleteMapping("/member/delete")
	public String deleteMember(@RequestParam(name = "memberId") Integer memberId) {
		try {
			memberSystemRepository.deleteById(memberId);
			return "刪除成功";
		} catch (EmptyResultDataAccessException e) {
			return "沒有這筆資料";
		}
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
