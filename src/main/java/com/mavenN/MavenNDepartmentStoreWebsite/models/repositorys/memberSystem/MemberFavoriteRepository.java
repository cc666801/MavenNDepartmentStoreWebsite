package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.memberSystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.MemberFavorite;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.MemberLevel;

@Repository
public interface MemberFavoriteRepository extends JpaRepository<MemberFavorite, Integer> {
	List<MemberFavorite> findByMemberSystem_MemberAccount(String account);}