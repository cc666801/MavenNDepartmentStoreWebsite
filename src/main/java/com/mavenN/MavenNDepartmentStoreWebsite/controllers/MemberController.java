package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.MemberFavorite;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.MemberLevel;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.MemberShopViolation;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.MemberSystem;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.MemberService;

public class MemberController {

	@Autowired
	private MemberService memberService;

	// 新增會員
	@PostMapping("/newmember")
	public ResponseEntity<Void> createMemberSystem(@RequestBody MemberSystem memberSystem) {
		memberService.createMemberSystem(memberSystem);
		return new ResponseEntity<>(HttpStatus.CREATED);
	}

	// 搜索單筆會員
	@GetMapping("/member/{id}")
	public ResponseEntity<MemberSystem> getMemberSystemById(@PathVariable Integer id) {
		MemberSystem memberSystem = memberService.getMemberSystemById(id);
		return new ResponseEntity<>(memberSystem, memberSystem == null ? HttpStatus.NOT_FOUND : HttpStatus.OK);
	}

	// 搜索所有會員
	@GetMapping("/allmember")
	public ResponseEntity<List<MemberSystem>> getAllMemberSystems() {
		List<MemberSystem> memberSystems = memberService.getAllMemberSystems();
		return new ResponseEntity<>(memberSystems, memberSystems.isEmpty() ? HttpStatus.NOT_FOUND : HttpStatus.OK);
	}

	// 更新會員資料
	@PutMapping("/updatemember")
	public ResponseEntity<Void> updateMemberSystem(@RequestBody MemberSystem memberSystem) {
		memberService.updateMemberSystem(memberSystem);
		return new ResponseEntity<>(HttpStatus.OK);
	}

	// 刪除會員資料
	@DeleteMapping("/deletemember/{id}")
	public ResponseEntity<Void> deleteMemberSystem(@PathVariable Integer id) {
		memberService.deleteMemberSystem(id);
		return new ResponseEntity<>(HttpStatus.OK);
	}

//-------------------------------------------------------------------------

	// 新增會員最愛資料
	@PostMapping("/newmemberfavorite")
	public ResponseEntity<Void> createMemberFavorite(@RequestBody MemberFavorite memberFavorite) {
	    memberService.createMemberFavorite(memberFavorite);
	    return new ResponseEntity<>(HttpStatus.CREATED);
	}
	
	// 刪除會員最愛資料
	@DeleteMapping("/deletememberfavorite/{id}")
	public ResponseEntity<Void> deleteMemberFavorite(@PathVariable Integer id) {
	    memberService.deleteMemberFavorite(id);
	    return new ResponseEntity<>(HttpStatus.OK);
	}
	
	// 搜尋會員所有最愛資料
	@GetMapping("/allmemberfavorite/{memberAccount}")
	public ResponseEntity<List<MemberFavorite>> getMemberFavoritesByAccount(@PathVariable String memberAccount) {
		List<MemberFavorite> memberFavorites = memberService.getMemberFavoritesByAccount(memberAccount);
		return new ResponseEntity<>(memberFavorites, memberFavorites.isEmpty() ? HttpStatus.NOT_FOUND : HttpStatus.OK);
	}
	
//-------------------------------------------------------------------------
	
	// 新增會員等級
	@PostMapping("/newmemberlevel")
	public ResponseEntity<Void> createMemberLevel(@RequestBody MemberLevel memberLevel) {
		memberService.createMemberLevel(memberLevel);
		return new ResponseEntity<>(HttpStatus.CREATED);
	}

	// 搜尋會員等級資料
	@GetMapping("/memberlevel/{memberAccount}")
	public ResponseEntity<List<MemberLevel>> findMemberLevelByMemberAccount(@PathVariable String memberAccount) {
		List<MemberLevel> memberLevels = memberService.findMemberLevelByMemberAccount(memberAccount);
		return new ResponseEntity<>(memberLevels, memberLevels.isEmpty() ? HttpStatus.NOT_FOUND : HttpStatus.OK);
	}

	// 更新會員等級
	@PutMapping("/updatememberlevel")
	public ResponseEntity<Void> updateMemberLevel(@RequestBody MemberLevel memberLevel) {
		memberService.updateMemberLevel(memberLevel);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
//-------------------------------------------------------------------------

	// 新增會員違規紀錄
	@PostMapping("/newmembershopviolation")
	public ResponseEntity<Void> createMemberShopViolation(@RequestBody MemberShopViolation memberShopViolation) {
		memberService.createMemberShopViolation(memberShopViolation);
		return new ResponseEntity<>(HttpStatus.CREATED);
	}

	// 查詢會員違規紀錄
	@GetMapping("/membershopviolation/{memberAccount}")
	public ResponseEntity<List<MemberShopViolation>> getMemberShopViolationsByAccount(
			@PathVariable String memberAccount) {
		List<MemberShopViolation> memberShopViolations = memberService.getMemberShopViolationsByAccount(memberAccount);
		return new ResponseEntity<>(memberShopViolations,
				memberShopViolations.isEmpty() ? HttpStatus.NOT_FOUND : HttpStatus.OK);
	}

	// 更新違規紀錄
	@PutMapping("/updatemembershopviolation")
	public ResponseEntity<Void> updateMemberShopViolation(@RequestBody MemberShopViolation memberShopViolation) {
		memberService.updateMemberShopViolation(memberShopViolation);
		return new ResponseEntity<>(HttpStatus.OK);
	}

	// 刪除違規紀錄:
	@DeleteMapping("/deletemembershopviolation/{id}")
	public ResponseEntity<Void> deleteMemberShopViolation(@PathVariable Integer id) {
		memberService.deleteMemberShopViolation(id);
		return new ResponseEntity<>(HttpStatus.OK);
	}

}
