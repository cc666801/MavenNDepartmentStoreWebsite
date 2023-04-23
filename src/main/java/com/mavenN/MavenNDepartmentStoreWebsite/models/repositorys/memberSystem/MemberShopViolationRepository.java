package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.memberSystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.MemberShopViolation;

@Repository
public interface MemberShopViolationRepository extends JpaRepository<MemberShopViolation, Integer> {
	List<MemberShopViolation> findByMemberSystem_MemberAccount (String account);
}