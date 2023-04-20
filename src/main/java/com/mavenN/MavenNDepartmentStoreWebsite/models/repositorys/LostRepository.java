package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.LostAndFound;

public interface LostRepository extends JpaRepository<LostAndFound, Integer> {

}
