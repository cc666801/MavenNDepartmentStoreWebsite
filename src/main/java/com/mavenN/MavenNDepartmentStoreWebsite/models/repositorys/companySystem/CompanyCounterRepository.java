package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CompanyCounter;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CompanyCounterId;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Counter;

public interface CompanyCounterRepository extends JpaRepository<CompanyCounter, CompanyCounterId> {
	@Query("SELECT cc FROM CompanyCounter cc WHERE cc.counter.counterFloor = :propertyValue")
	List<CompanyCounter> findByCounterFloor(@Param("propertyValue") String counterFloor);

	@Query("SELECT c FROM Counter c WHERE c.counterId NOT IN " + "(SELECT cc.counter.counterId FROM CompanyCounter cc "
			+ "WHERE cc.offCounterTime >= CURRENT_TIMESTAMP)")
	List<Counter> findAllEmptyCounters();
	
	@Query("SELECT cc FROM CompanyCounter cc "
	        + "INNER JOIN cc.company c "
	        + "INNER JOIN c.cooperationStatus cs "
	        + "INNER JOIN c.industryCategory ic "
	        + "INNER JOIN cc.counter c2 "
	        + "WHERE c.companyName LIKE %:companyName% "
	        + "AND cs.cooperationStatusName = '在櫃中' "
	        + "AND ic.industryCategoryId IN :industryCategoryIds "
	        + "AND c2.counterFloor IN :counterFloors")
	List<CompanyCounter> findCompanyCountersByKeywordAndFloorAndIndustryCategory(
	        @Param("companyName") String companyName,
	        @Param("counterFloors") List<String> counterFloors,
	        @Param("industryCategoryIds") List<Integer> industryCategoryIds
	);
	
	@Query("SELECT cc FROM CompanyCounter cc " +
		       "JOIN cc.company c " +
		       "JOIN cc.counter co " +
		       "WHERE c.cooperationStatus.cooperationStatusName = :cooperationStatusName " +
		       "AND co.counterFloor = :counterFloor " +
		       "AND cc.offCounterTime >= CURRENT_TIMESTAMP")
		List<CompanyCounter> findCompanyCountersByStatusAndFloor(String cooperationStatusName, String counterFloor);


		
//	冠勳加的(餐廳用)----------
	@Query("SELECT cc FROM CompanyCounter cc WHERE cc.company.companyId IN (SELECT ri.company.companyId FROM RestaurantInformation ri)")
	List<CompanyCounter> findByCompany();
	
}
