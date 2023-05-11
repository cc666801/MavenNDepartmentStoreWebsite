package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant.RestaurantInformation;

public interface RestaurantInformationRepository extends JpaRepository<RestaurantInformation, Integer> {
	@Query("SELECT c "
			+ "FROM Company c "
			+ "LEFT JOIN RestaurantInformation ri ON ri.company = c "
			+ "INNER JOIN IndustryCategory id ON c.industryCategory = id "
			+ "INNER JOIN CooperationStatus st ON c.cooperationStatus = st "
			+ "WHERE ri.cuisineType IS NULL AND id.industryCategoryName='餐廳' AND st.cooperationStatusName='在櫃中'")
	public List<Company> findCompanyNoCuisineType();
	
	
	@Query("SELECT ri FROM RestaurantInformation ri "
			+ "INNER JOIN Company c ON ri.company = c "
			+ "INNER JOIN CuisineType ct ON ri.cuisineType = ct "
			+ "WHERE c.companyName LIKE %:companyName% OR ct.cuisineTypeName LIKE %:companyName%")
	public Page<RestaurantInformation> findrestByCompanyname(@Param("companyName") String companyName, Pageable page);
			
			





	
	
	
	
}
