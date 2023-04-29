package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;

public interface CompanyRepository extends JpaRepository<Company, Integer>{
	@Query("SELECT c FROM Company c JOIN c.cooperationStatus cs WHERE cs.cooperationStatusName = :cooperationStatusName")
	List<Company> findByCooperationStatus_CooperationStatusName(@Param("cooperationStatusName") String cooperationStatusName);
	
	@Query("SELECT c FROM Company c " +
			"JOIN c.cooperationStatus cs " +
			"JOIN c.counters cc " +
			"JOIN cc.counter c2 " +
			"WHERE cs.cooperationStatusName = :cooperationStatusName " +
			"AND c2.counterFloor = :counterFloor " +
			"AND cc.offCounterTime >= CURRENT_TIMESTAMP")
		List<Company> findCompaniesByStatusAndFloor(String cooperationStatusName, String counterFloor);
}
