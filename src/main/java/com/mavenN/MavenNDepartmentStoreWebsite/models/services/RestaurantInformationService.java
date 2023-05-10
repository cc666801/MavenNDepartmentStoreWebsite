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
	
	public void addRestaurantInformation(RestaurantInformation rest) {
		resInformationRepository.save(rest);
	}
	 
	public List<RestaurantInformation> findAllRestInformation(){
		List<RestaurantInformation> findAllRestInformation = resInformationRepository.findAll();		
		return findAllRestInformation;
	}
	
	public List<Company> findAllRestaurants(){
		List<Company> findAllRestaurant = companyRepository.findAllByCompanyName();
		return findAllRestaurant;
	}
}
