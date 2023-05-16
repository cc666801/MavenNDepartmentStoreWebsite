package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant.CuisineType;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.CuisineTypeRepository;

@Service
public class CuisineTypeService {
	@Autowired
	private CuisineTypeRepository cuisineTypeRepository;
	
	@Transactional
	public CuisineType updateCuisineTypeById(Integer cuisineTypeId, String cuisineTypeName) {
		Optional<CuisineType> option = cuisineTypeRepository.findById(cuisineTypeId);
		if(option.isPresent()) {
			CuisineType cuisineType = option.get();
			cuisineType.setCuisineTypeName(cuisineTypeName);
			return cuisineType;
		}
		
		return null;
	}
	
	public CuisineType findCusineTypeById(Integer cuisineTypeId) {
		Optional<CuisineType> option = cuisineTypeRepository.findById(cuisineTypeId);
		if(option.isEmpty()) {
			return null;
		}
		
		return option.get();
	}
	
	public void deleteById(Integer cuisineTypeId) {
		cuisineTypeRepository.deleteById(cuisineTypeId);
	}
	
	public void addCuisineType(CuisineType cuisinetype) {
		cuisineTypeRepository.save(cuisinetype);
	}
	
	public List<CuisineType> findAllCuisineType(){
		List<CuisineType> findAllCuisineType = cuisineTypeRepository.findAll();
		return findAllCuisineType;	
	}
	
	
}
