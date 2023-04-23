package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.memberSystem;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.MemberFavorite;

@Repository
public interface MemberFavoriteRepository extends JpaRepository<MemberFavorite, Integer> {

}