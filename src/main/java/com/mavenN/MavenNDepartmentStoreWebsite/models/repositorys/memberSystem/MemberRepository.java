package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.memberSystem;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;


@Repository
public interface MemberRepository extends JpaRepository<Member, Integer> {
	
    Optional<Member> findByAccount(String account);

	
}
