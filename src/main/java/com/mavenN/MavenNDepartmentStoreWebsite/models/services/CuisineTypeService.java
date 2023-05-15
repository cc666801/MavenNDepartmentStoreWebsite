package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant.CuisineType;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.CuisineTypeRepository;

@Service
public class CuisineTypeService {
	@Autowired
	private CuisineTypeRepository cuisineTypeRepository;
	
	public void addCuisineType(CuisineType cuisinetype) {
		cuisineTypeRepository.save(cuisinetype);
	}
	
	public List<CuisineType> findAllCuisineType(){
		List<CuisineType> findAllCuisineType = cuisineTypeRepository.findAll();
		return findAllCuisineType;	
	}
	
	
}
