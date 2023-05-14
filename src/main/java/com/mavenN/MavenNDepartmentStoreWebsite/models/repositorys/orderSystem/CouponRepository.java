package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.Coupon;

public interface CouponRepository extends JpaRepository<Coupon, Integer> {
	@Query("SELECT c FROM Coupon c LEFT JOIN CouponMember cm ON c.couponId = cm.id.couponId AND cm.id.memberId = :memberId WHERE cm.id.couponId IS NULL")
    List<Coupon> findUnusedCouponsByMemberId(@Param("memberId") Integer memberId);
}
