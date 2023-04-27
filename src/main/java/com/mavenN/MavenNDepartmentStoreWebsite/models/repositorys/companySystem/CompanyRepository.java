package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;

public interface CompanyRepository extends JpaRepository<Company, Integer>{

}
