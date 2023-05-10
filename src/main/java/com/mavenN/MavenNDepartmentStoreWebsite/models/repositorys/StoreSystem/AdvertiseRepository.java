package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.StoreSystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.store.Advertise;

public interface AdvertiseRepository extends JpaRepository <Advertise, Integer>{
	
	
//	邪教寫法    要展示上下架功能
	
	List<Advertise>findByAdvertiseShelveIsTrue();
	
	
//	修改狀態    會出錯
//	List<Advertise> findByAdvertiseShelveByadvertiseClick();
	
	

}
