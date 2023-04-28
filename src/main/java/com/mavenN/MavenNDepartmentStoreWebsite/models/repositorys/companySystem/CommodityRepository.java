package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Commodity;

public interface CommodityRepository extends JpaRepository<Commodity,Integer> {

}
