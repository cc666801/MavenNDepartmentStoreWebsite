package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;

public interface CompanyRepository extends JpaRepository<Company, Integer>{
	@Query("SELECT c FROM Company c JOIN c.cooperationStatus cs WHERE cs.cooperationStatusName = :cooperationStatusName")
	List<Company> findByCooperationStatus_CooperationStatusName(@Param("cooperationStatusName") String cooperationStatusName);
}
