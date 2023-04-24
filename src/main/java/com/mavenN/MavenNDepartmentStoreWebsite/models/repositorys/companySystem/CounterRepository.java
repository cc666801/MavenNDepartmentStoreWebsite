package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.Message;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Address;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Counter;

public interface CounterRepository extends JpaRepository<Counter, Integer>{

}
