package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.memberSystem;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.MemberSystem;

@Repository
public interface MemberSystemRepository extends JpaRepository<MemberSystem, Integer> {
	
	
}
