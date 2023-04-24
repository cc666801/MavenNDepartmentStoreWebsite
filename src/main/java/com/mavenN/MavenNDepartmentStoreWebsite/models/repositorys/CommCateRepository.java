package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CommCate;

public interface CommCateRepository extends JpaRepository<CommCate, Integer> {

	
	
}