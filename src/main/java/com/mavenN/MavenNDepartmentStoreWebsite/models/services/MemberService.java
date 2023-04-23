package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.MemberFavorite;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.MemberLevel;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.MemberShopViolation;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.MemberSystem;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.memberSystem.MemberFavoriteRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.memberSystem.MemberLevelRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.memberSystem.MemberShopViolationRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.memberSystem.MemberSystemRepository;

public class MemberService {
	@Autowired
	private MemberSystemRepository memberSystemRepository;
	
	@Autowired
	private MemberLevelRepository memberLevelRepository;
	
	@Autowired
	private MemberFavoriteRepository memberFavoriteRepository;
	
	@Autowired
	private MemberShopViolationRepository memberShopViolationRepository;
	
	//for create MemberSystem
	public void createMemberSystem(MemberSystem memberSystem) {
	    memberSystemRepository.save(memberSystem);
	}
	
	//for read one MemberSystem
	public MemberSystem getMemberSystemById(Integer id) {
	    return memberSystemRepository.findById(id).orElse(null);
	}
	
	//for read all MemberSystem
	public List<MemberSystem> getAllMemberSystems() {
        return memberSystemRepository.findAll();
    }
	
	//for update MemberSystem
	public void updateMemberSystem(MemberSystem memberSystem) {
	    memberSystemRepository.save(memberSystem);
	}
	
	//for delete MemberSystem
	public void deleteMemberSystem(Integer id) {
	    memberSystemRepository.deleteById(id);
	}
	
	//use member_Account to read MemberLevel
	public List<MemberLevel> findMemberLevelByMemberAccount(String memberAccount) {
        return memberLevelRepository.findByMemberSystem_MemberAccount(memberAccount);
    }
	
	//use member_Account to read all MemberFavorite
	public List<MemberFavorite> getMemberFavoritesByAccount(String account) {
        return memberFavoriteRepository.findByMemberSystem_MemberAccount(account);
    }
	
	//for create MemberShopViolation
	public void createMemberShopViolation(MemberShopViolation memberShopViolation) {
	    memberShopViolationRepository.save(memberShopViolation);
	}
	
	//use member_Account read all MemberShopViolation
	public List<MemberShopViolation> getMemberShopViolationsByAccount(String account) {
	    return memberShopViolationRepository.findByMemberSystem_MemberAccount(account);
	}
	
}
