package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.store.Advertise;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.StoreSystem.AdvertiseRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CompanyRepository;

@Service
public class AdvertiseService {

	@Autowired
	private AdvertiseRepository advertiseRepository;
	

	
	

//	新增廣告詳細資料

	public void addadvertise(Advertise advertise) {
		advertiseRepository.save(advertise);
	}

//	刪除廣告詳細資料

	public void deleteadvertiseById(Integer advertiseId) {
		advertiseRepository.deleteById(advertiseId);
	}

//	找尋所有廣告

	public List<Advertise> findAllAdvertise() {
		List<Advertise> findAllAdvertise = advertiseRepository.findAll();
		return findAllAdvertise;
	}

// 透過 id 去找尋廣告

	public Advertise findAdvertiseById(Integer advertiseId) {
		Optional<Advertise> option = advertiseRepository.findById(advertiseId);

		if (option.isEmpty()) {
			return null;
		}

		return option.get();
	}

//	透過 id廣告 更新

	public Advertise updateAdvertiseById(Integer advertiseId, Advertise newadvertise) {
		Optional<Advertise> option = advertiseRepository.findById(advertiseId);

		if (option.isPresent()) {
			Advertise advertise = option.get();
			advertise.setAdvertiseName(newadvertise.getAdvertiseName());
			advertise.setAdvertisePicture(newadvertise.getAdvertisePicture());
			advertise.setAdvertiseDesc(newadvertise.getAdvertiseDesc());
			advertise.setAdvertiseURL(newadvertise.getAdvertiseURL());
			advertise.setAdvertiseStartDay(newadvertise.getAdvertiseStartDay());
			advertise.setAdvertiseRemoveDay(newadvertise.getAdvertiseRemoveDay());
			advertise.setAdvertiseShelve(newadvertise.getAdvertiseShelve());
			advertise.setAdvertiseFee(newadvertise.getAdvertiseFee());
			advertise.setAdvertiseDiscount(newadvertise.getAdvertiseDiscount());
			advertise.setAdvertiseFrequency(newadvertise.getAdvertiseFrequency());
//			這邊是更新 廣告類別跟公司
			advertise.setAdvertiseCate(newadvertise.getAdvertiseCate());
			advertise.setCompany(newadvertise.getCompany());
			
			
			return advertise;

		}
		return null;
	}
	
	

	
	
	
	
	
	public AdvertiseService() {
		// TODO Auto-generated constructor stub
	}
	

}
