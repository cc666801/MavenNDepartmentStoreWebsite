package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CompanyCounter;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CompanyCounterId;

public interface CompanyCounterRepository extends JpaRepository<CompanyCounter, CompanyCounterId>{
	@Query("SELECT cc FROM CompanyCounter cc WHERE cc.counter.property = :propertyValue")
	List<CompanyCounter> findByCounterProperty(@Param("propertyValue") String counterFloor);
	
	List<CompanyCounter> findByOnCounterTimeGreaterThanEqualAndOffCounterTimeLessThanEqual(Date startTime, Date endTime);
}
