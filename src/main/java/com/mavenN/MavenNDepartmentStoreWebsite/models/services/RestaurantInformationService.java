package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant.CuisineType;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant.RestaurantInformation;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.RestaurantInformationRepository;

@Service
public class RestaurantInformationService {

	@Autowired
	private RestaurantInformationRepository resInformationRepository;
	
	@Transactional
	public RestaurantInformation updateRestInformationById(Integer resid,  Company company, CuisineType cusinetype) {
		Optional<RestaurantInformation> option = resInformationRepository.findById(resid);
		if(option.isPresent()) {
			RestaurantInformation rest = option.get();
			rest.setCompany(company);
			rest.setCuisineType(cusinetype);
			return rest;
		}
		
		return null;
	}
	
	public RestaurantInformation findRsetInformationById(Integer resid) {
		Optional<RestaurantInformation> option = resInformationRepository.findById(resid);
		if(option.isEmpty()) {
			return null;
		}
		
		return option.get();
	}
	
	public void deleterestaurantbyid(Integer id) {
		resInformationRepository.deleteById(id);
	}
	
	public String addRestaurantInformation(RestaurantInformation rest) {
//		System.out.println("***************");
		if(rest.getCompany() == null) {
			return "所有餐廳已新增料理分類完畢無須新增";
		}else {
			Integer companyId = rest.getCompany().getCompanyId();
			System.out.println(companyId);
			
			boolean companyexist = false; 
			List<RestaurantInformation> findAll = resInformationRepository.findAll();
			for(RestaurantInformation companykey : findAll) {
				if( companyId == companykey.getCompany().getCompanyId()) {
					companyexist = true;
					break;
				} 
			}
			
			if(companyexist) {
				return "新增失敗,此餐廳已建立料理類型";
			}else {
				resInformationRepository.save(rest);
				return "已新增餐廳料理類型";
			}
		}
	}
	 
	public List<RestaurantInformation> findAllRestInformation(){
		List<RestaurantInformation> findAllRestInformation = resInformationRepository.findAll();		
		return findAllRestInformation;
	}
	
	
	public List<Company> findCompanyNoCuisineType(){
		List<Company> findAllRestaurant = resInformationRepository.findCompanyNoCuisineType();
		
		return findAllRestaurant;
	}
	

}
