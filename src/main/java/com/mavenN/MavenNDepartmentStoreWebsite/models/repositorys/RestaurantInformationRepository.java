package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant.RestaurantInformation;

public interface RestaurantInformationRepository extends JpaRepository<RestaurantInformation, Integer> {
	
}
