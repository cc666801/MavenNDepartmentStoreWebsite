package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.memberSystem.MemberRepository;

@Service
public class MemberService {
	@Autowired
	private MemberRepository memberRepository;

	// 新增會員
	public void addMember(Member member) {

		memberRepository.save(member);

	}

	// 搜索單筆會員
	public Member findMemberById(Integer id) {
		Optional<Member> option = memberRepository.findById(id);

		if (option.isPresent()) {

			return option.get();
			
		}

		return null;

	}
	
	// 分頁搜索所有會員
	public Page<Member> findLostByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1, 3, Sort.Direction.DESC, "id");
		Page<Member> page = memberRepository.findAll(pgb);
		return page;
	}

	
	// 刪除會員資料
	public void deleteMemberById(Integer id) {

		memberRepository.deleteById(id);

	}


	// 更新會員資料
	@Transactional
	public Member updateMemberById(Integer id, Member newMember) {
		Optional<Member> option = memberRepository.findById(id);

		if (option.isPresent()) {
			Member mem = option.get();
			mem.setName(newMember.getName());
			mem.setAddress(newMember.getAddress());
			mem.setPassword(newMember.getPassword());
			mem.setEmail(newMember.getEmail());
			mem.setPhone(newMember.getPhone());
//			mem.setPicture(newMember.getPicture());
			return mem;
		}
		return null;
	}

	// 查詢所有會員
	public List<Member> findAllMember() {
		List<Member> findAllMember = memberRepository.findAll();
		return findAllMember;
	}

	
	
	
	
//-------------------------------------------------------------------------

}
