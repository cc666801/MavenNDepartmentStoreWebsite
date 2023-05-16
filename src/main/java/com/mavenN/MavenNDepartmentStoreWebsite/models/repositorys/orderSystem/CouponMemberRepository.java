package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.CouponMember;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.CouponMemberId;

public interface CouponMemberRepository extends JpaRepository<CouponMember, CouponMemberId> {
	
}
