package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.store.AdvertiseCate;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.StoreSystem.AdvertiseCateRepository;

@Service
public class AdvertiseCateService {

	@Autowired
	private AdvertiseCateRepository AdvertiseCateRepository;

//	新增類別   名稱簡寫  

	public void addAdvertiseCate(AdvertiseCate advertiseCate) {
		AdvertiseCateRepository.save(advertiseCate);
	}

//	刪除透過 id 

	public void deleteById(Integer advertiseCateId) {
		AdvertiseCateRepository.deleteById(advertiseCateId);
	}

//	找尋 所有廣告類別

	public List<AdvertiseCate> findAllAdCate() {
		List<AdvertiseCate> findAllAdCate = AdvertiseCateRepository.findAll();
		return findAllAdCate;
	}

	 
//	更新 透過id @Transactional這個要加 才會啟動交易
	@Transactional
	public AdvertiseCate updateAdCateById(Integer advertiseCateId , AdvertiseCate newcate) {
		Optional<AdvertiseCate> option = AdvertiseCateRepository.findById(advertiseCateId);
		
		if(option.isPresent()) {
			AdvertiseCate adCate = option.get();
			adCate.setAdvertiseCateName(newcate.getAdvertiseCateName());
			adCate.setAdvertiseCateDesc(newcate.getAdvertiseCateDesc());
			
			return adCate;
		}
		return null;
		
	}
	
	
//	透過 id 去查詢類別 之後接著找到所有類別用
	
	public AdvertiseCate findAdCateById(Integer advertiseCateId) {
		Optional<AdvertiseCate> option = AdvertiseCateRepository.findById(advertiseCateId);
		
		if(option.isEmpty()) {
			return null;
		}
		
		return option.get();
		
		
	}
	
	
	
}
