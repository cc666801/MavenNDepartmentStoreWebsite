package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.OrderDetail;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.OrderDetailId;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, OrderDetailId> {
//	@Query("SELECT s FROM ShoppingCart s WHERE s.member.id = :memberId")
//	Optional<ShoppingCart> findByMemberId(@Param("memberId") Integer memberId);
}
