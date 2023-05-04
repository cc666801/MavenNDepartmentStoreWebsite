package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;

public interface CompanyRepository extends JpaRepository<Company, Integer>{
	public Page<Company> findByCompanyNameContaining(String companyname, Pageable page);
}
