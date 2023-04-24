package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.MemberFavorite;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.MemberLevel;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.MemberShopViolation;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.MemberSystem;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.memberSystem.MemberFavoriteRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.memberSystem.MemberLevelRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.memberSystem.MemberShopViolationRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.memberSystem.MemberSystemRepository;

@Service
public class MemberService {
	@Autowired
	private MemberSystemRepository memberSystemRepository;

	@Autowired
	private MemberLevelRepository memberLevelRepository;

	@Autowired
	private MemberFavoriteRepository memberFavoriteRepository;

	@Autowired
	private MemberShopViolationRepository memberShopViolationRepository;

	// 新增會員
	public void createMemberSystem(MemberSystem memberSystem) {
		memberSystemRepository.save(memberSystem);
	}

	// 搜索單筆會員
	public MemberSystem getMemberSystemById(Integer id) {
		return memberSystemRepository.findById(id).orElse(null);
	}

	// 搜索所有會員
	public List<MemberSystem> getAllMemberSystems() {
		return memberSystemRepository.findAll();
	}

	// 更新會員資料
	public void updateMemberSystem(MemberSystem memberSystem) {
		memberSystemRepository.save(memberSystem);
	}

	// 刪除會員資料
	public void deleteMemberSystem(Integer id) {
		memberSystemRepository.deleteById(id);
	}

//-------------------------------------------------------------------------
	
	// 新增會員最愛資料
	public void createMemberFavorite(MemberFavorite memberFavorite) {
		memberFavoriteRepository.save(memberFavorite);
	}

	// 刪除會員最愛資料
	public void deleteMemberFavorite(Integer memberFavoriteId) {
		memberFavoriteRepository.deleteById(memberFavoriteId);
	}

	// 搜尋會員所有最愛資料
	public List<MemberFavorite> getMemberFavoritesByAccount(String account) {
		return memberFavoriteRepository.findByMemberSystem_MemberAccount(account);
	}
	
//-------------------------------------------------------------------------

	// 新增會員等級
	public void createMemberLevel(MemberLevel memberLevel) {
		memberLevelRepository.save(memberLevel);
	}

	// 搜尋會員等級資料
	public List<MemberLevel> findMemberLevelByMemberAccount(String memberAccount) {
		return memberLevelRepository.findByMemberSystem_MemberAccount(memberAccount);
	}

	// 更新會員等級
	public void updateMemberLevel(MemberLevel memberLevel) {
		memberLevelRepository.save(memberLevel);
	}
	
//-------------------------------------------------------------------------
	
	// 新增會員違規紀錄
	public void createMemberShopViolation(MemberShopViolation memberShopViolation) {
		memberShopViolationRepository.save(memberShopViolation);
	}

	// 查詢會員違規紀錄
	public List<MemberShopViolation> getMemberShopViolationsByAccount(String account) {
		return memberShopViolationRepository.findByMemberSystem_MemberAccount(account);
	}

	// 更新違規紀錄
	public void updateMemberShopViolation(MemberShopViolation memberShopViolation) {
		memberShopViolationRepository.save(memberShopViolation);
	}

	// 刪除違規紀錄
	public void deleteMemberShopViolation(Integer id) {
		memberShopViolationRepository.deleteById(id);
	}

}
