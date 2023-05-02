package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CooperationStatus;

public interface CooperationStatusRepository extends JpaRepository<CooperationStatus, Integer> {
	// 通過 cooperationStatusName 找到 CooperationStatus
	@Query("SELECT c FROM CooperationStatus c WHERE c.cooperationStatusName = :cooperationStatusName")
	CooperationStatus findByCooperationStatusName(@Param("cooperationStatusName") String cooperationStatusName);
}
