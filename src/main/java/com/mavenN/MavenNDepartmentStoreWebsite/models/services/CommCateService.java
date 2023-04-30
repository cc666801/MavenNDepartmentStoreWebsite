package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CommCate;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CommCateRepository;

@Service
public class CommCateService {

	@Autowired
	private CommCateRepository CommCateRepository;
	
	
	
//	新增類別
	public void addComm(CommCate cate) {
		CommCateRepository.save(cate);
	}
	
//	透過id查詢類別
	public CommCate findcateById(Integer cateId) {
		Optional<CommCate> option = CommCateRepository.findById(cateId);
		
		if(option.isEmpty()) {
			return null;
		}
		
		return option.get();
	}
	
//	更新透過 id
	@Transactional
	public CommCate updateCommById(Integer cateId ,CommCate newcate) {
		Optional<CommCate> option = CommCateRepository.findById(cateId);
		
		if(option.isPresent()) {
			CommCate cate=option.get();
			cate.setCateName(newcate.getCateName());
			cate.setCateDesc(newcate.getCateDesc());
			
			return cate;
		}
		
		return null;
	}
	
//	刪除透過 id
	public void deleteById(Integer cateId ) {
		CommCateRepository.deleteById(cateId);
	}
	
//	找尋所有類別
	public List<CommCate> findAllCate(){
		List<CommCate> findAllCate = CommCateRepository.findAll();
		return findAllCate;
	}
	
	
}