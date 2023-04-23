package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CommCate;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.CommCateRepository;

@Service
public class CommCateService {

	@Autowired
	private CommCateRepository CommCateRepository;
	
	
	
//	新增類別
	public void addComm(CommCate cate) {
		CommCateRepository.save(cate);
	}
	
//	透過id查詢類別
	public CommCate findcateById(Integer id) {
		Optional<CommCate> option = CommCateRepository.findById(id);
		
		if(option.isEmpty()) {
			return null;
		}
		
		return option.get();
	}
	
//	更新透過 id
	public CommCate updateCommById(Integer id ,CommCate newcate) {
		Optional<CommCate> option = CommCateRepository.findById(id);
		
		if(option.isPresent()) {
			CommCate cate=option.get();
			cate.setCate_Name(newcate.getCate_Name());
			cate.setCate_Desc(newcate.getCate_Desc());
			
			return cate;
		}
		
		return null;
	}
	
//	刪除透過 id
	public void deleteById(Integer id ) {
		CommCateRepository.deleteById(id);
	}
	
//	找尋所有類別
	public List<CommCate> findAllCate(){
		List<CommCate> findAllCate = CommCateRepository.findAll();
		return findAllCate;
	}
	
	
}