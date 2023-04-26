package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;

import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.memberSystem.MemberRepository;

@Service
public class MemberService {
	@Autowired
	private MemberRepository memberSystemRepository;
	
	// 新增會員
	public void addMember(Member memberSystem) {
		memberSystemRepository.save(memberSystem);
	}

	// 搜索單筆會員
	public Member getMemberById(Integer id) {
		return memberSystemRepository.findById(id).orElse(null);
	}

	// 搜索所有會員
	public List<Member> getAllMember() {
		return memberSystemRepository.findAll();
	}

	// 更新會員資料
	@Transactional
	public Member updateMember(Integer id,Member newMember) {
		Optional<Member> option = memberSystemRepository.findById(id);
		
		if(option.isPresent()) {
			Member mem = option.get();
			mem.setName(newMember.getName());
			mem.setAddress(newMember.getAddress());
			mem.setPassword(newMember.getPassword());
			mem.setEmail(newMember.getEmail());
			mem.setPhone(newMember.getPhone());
			mem.setPicture(newMember.getPicture());
			return mem;
		}
		return null;
	}

	// 刪除會員資料
	public void deleteMember(Integer id) {
		memberSystemRepository.deleteById(id);
	}

//-------------------------------------------------------------------------
	
	
	


}
