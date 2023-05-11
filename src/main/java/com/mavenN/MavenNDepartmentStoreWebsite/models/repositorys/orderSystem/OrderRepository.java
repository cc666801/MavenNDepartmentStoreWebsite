package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.Order;

public interface OrderRepository extends JpaRepository<Order, Integer> {
	@Query("SELECT o FROM Order o JOIN o.orderStatus os WHERE o.member.id = :memberId AND os.orderStatusName != '已取消訂單'")
	List<Order> findByMemberId(@Param("memberId") Integer memberId);
}
