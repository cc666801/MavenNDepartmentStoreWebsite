package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.memberSystem;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.MemberSystem;

@Repository
public interface MemberSystemRepository extends JpaRepository<MemberSystem, Integer> {

}
