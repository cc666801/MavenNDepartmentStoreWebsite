package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant.RestaurantInformation;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.RestaurantInformationRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CompanyRepository;

@Service
public class RestaurantInformationService {

	@Autowired
	private RestaurantInformationRepository resInformationRepository;
	
	@Autowired
	private CompanyRepository companyRepository;
	
	public String addRestaurantInformation(RestaurantInformation rest) {
		System.out.println("***************");
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
	 
	public List<RestaurantInformation> findAllRestInformation(){
		List<RestaurantInformation> findAllRestInformation = resInformationRepository.findAll();		
		return findAllRestInformation;
	}
	
	public List<Company> findAllRestaurants(){
		List<Company> findAllRestaurant = companyRepository.findAllByCompanyName();
		return findAllRestaurant;
	}
	
	public List<Company> findCompanyNoCuisineType(){
		List<Company> findAllRestaurant = resInformationRepository.findCompanyNoCuisineType();
		
		return findAllRestaurant;
	}
	

}
