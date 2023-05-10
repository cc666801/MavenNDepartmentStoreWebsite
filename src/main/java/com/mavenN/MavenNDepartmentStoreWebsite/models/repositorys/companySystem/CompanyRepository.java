package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;

public interface CompanyRepository extends JpaRepository<Company, Integer> {
	@Query("SELECT c FROM Company c JOIN c.cooperationStatus cs WHERE cs.cooperationStatusName = :cooperationStatusName")
	List<Company> findByCooperationStatus_CooperationStatusName(
			@Param("cooperationStatusName") String cooperationStatusName);

	@Query("SELECT c FROM Company c " + "JOIN c.cooperationStatus cs " + "JOIN c.counters cc " + "JOIN cc.counter c2 "
			+ "WHERE cs.cooperationStatusName = :cooperationStatusName " + "AND c2.counterFloor = :counterFloor "
			+ "AND cc.offCounterTime >= CURRENT_TIMESTAMP")
	List<Company> findCompaniesByStatusAndFloor(String cooperationStatusName, String counterFloor);

	@Query("SELECT c FROM Company c "
	        + "INNER JOIN c.cooperationStatus cs "
	        + "INNER JOIN c.industryCategory ic "
	        + "INNER JOIN c.counters cc "
	        + "INNER JOIN cc.counter c2 "
	        + "WHERE c.companyName LIKE %:companyName% "
	        + "AND cs.cooperationStatusName = '在櫃中' "
	        + "AND ic.industryCategoryId IN :industryCategoryIds "
	        + "AND c2.counterFloor IN :counterFloors")
	List<Company> findCompaniesByKeywordAndFloorAndIndustryCategory(
	        @Param("companyName") String companyName,
	        @Param("counterFloors") List<String> counterFloors,
	        @Param("industryCategoryIds") List<Integer> industryCategoryIds
	);
	
	public Page<Company> findByCompanyNameContaining(String companyname, Pageable page);
	
	
	@Query(value="select * from company INNER JOIN industry_category"
		   +"on fk_industry_category_id = industry_category_id"
		   +"where industry_category_name = '餐廳'", nativeQuery = true)
	public List<Company> findAllByCompanyName();
	

}
