package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.Order;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.OrderStatus;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.ShoppingCart;

public interface OrderStatusRepository extends JpaRepository<OrderStatus, Integer> {
//	@Query("SELECT s FROM ShoppingCart s WHERE s.member.id = :memberId")
//	Optional<ShoppingCart> findByMemberId(@Param("memberId") Integer memberId);
}
