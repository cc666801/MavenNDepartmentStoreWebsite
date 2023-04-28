package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CompanyCounter;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CompanyCounterId;

public interface CompanyCounterRepository extends JpaRepository<CompanyCounter, CompanyCounterId>{

}
