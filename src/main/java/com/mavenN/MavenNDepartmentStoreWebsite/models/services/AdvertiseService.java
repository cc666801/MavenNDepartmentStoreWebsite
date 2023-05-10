package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Commodity;
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
	@Transactional
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

//	顯示上下架

	public List<Advertise> findByAdvertiseShelveIsTrue() {
		return advertiseRepository.findByAdvertiseShelveIsTrue();
	}

//	紀錄廣告點擊次數  可正確做動 

//	public void recordClick(Integer advertiseId) {
//		Optional<Advertise> optionadvertise = advertiseRepository.findById(advertiseId);
//		if (optionadvertise.isPresent()) {
//			Advertise advertise = optionadvertise.get();
//			advertise.setAdvertiseId(advertiseId);
//			if (advertise.getAdvertiseClick() != null) {
//				advertise.setAdvertiseClick(advertise.getAdvertiseClick() + 1); // 會記錄點擊次數 點擊後+1
//			} else {
//				advertise.setAdvertiseClick(1);// 若沒有點擊次數 就先設定為1
//			}
//			advertiseRepository.save(advertise);
//		} else {
//
//		}
//	}

//	當廣告被點擊次數  大於等於 廣告預設次數  將廣告狀態改為下架
//	public void setAdvertiseShelveIsFalse(Integer advertiseId, boolean advertiseShelve) {
//		Optional<Advertise> optionalAdvertise = advertiseRepository.findById(advertiseId);
//		if (optionalAdvertise.isPresent()) {
//			Advertise advertise = optionalAdvertise.get();
//			advertise.getAdvertiseClick()>=advertise.getAdvertiseFrequency();
//			advertise.setAdvertiseShelve(false);

//			advertiseRepository.save(advertise);
//		} else {
	// 廣告不存在，你可以選擇拋出異常或執行其他處理
//		}
//	}

	//調整狀態
//	@Transactional
//	public List<Advertise> updateAdvertiseShelveByadvertiseClick() {
//		List<Advertise> advertises = advertiseRepository.findAll();
//
//		for (Advertise advertise : advertises) {
//			if (advertise.getAdvertiseClick() >= advertise.getAdvertiseFrequency()) {
//				advertise.setAdvertiseShelve(false);
//				advertiseRepository.save(advertise);
//			}
//		}
//		return advertises;
//	}

//	嘗試混和
	
	
	@Transactional
	public void recordClickAndUpdateShelve(Integer advertiseId) {
		Optional<Advertise> optionadvertise = advertiseRepository.findById(advertiseId);
		if (optionadvertise.isPresent()) {
			Advertise advertise = optionadvertise.get();
			advertise.setAdvertiseId(advertiseId);
			if (advertise.getAdvertiseClick() != null) {
				advertise.setAdvertiseClick(advertise.getAdvertiseClick() + 1);
			} else {
				advertise.setAdvertiseClick(1);
			}
			advertiseRepository.save(advertise);

			if (advertise.getAdvertiseClick() >= advertise.getAdvertiseFrequency()) {
				advertise.setAdvertiseShelve(false);
				advertiseRepository.save(advertise);
			}
		} else {
			// 處理廣告不存在的情況
		}
	}

	public AdvertiseService() {
		// TODO Auto-generated constructor stub
	}

}
