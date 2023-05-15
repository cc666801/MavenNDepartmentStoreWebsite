package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant.CuisineType;

public interface CuisineTypeRepository extends JpaRepository<CuisineType, Integer>{
	
}
