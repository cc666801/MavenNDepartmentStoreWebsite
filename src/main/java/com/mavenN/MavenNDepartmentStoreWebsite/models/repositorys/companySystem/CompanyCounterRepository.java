package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CompanyCounter;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CompanyCounterId;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Counter;

public interface CompanyCounterRepository extends JpaRepository<CompanyCounter, CompanyCounterId> {
	@Query("SELECT cc FROM CompanyCounter cc WHERE cc.counter.counterFloor = :propertyValue")
	List<CompanyCounter> findByCounterFloor(@Param("propertyValue") String counterFloor);

	@Query("SELECT c FROM Counter c WHERE c.counterId NOT IN " + "(SELECT cc.counter.counterId FROM CompanyCounter cc "
			+ "WHERE cc.offCounterTime >= CURRENT_TIMESTAMP)")
	List<Counter> findAllEmptyCounters();
	
}
