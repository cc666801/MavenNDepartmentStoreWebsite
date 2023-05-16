package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.OrderDetail;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.OrderDetailId;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, OrderDetailId> {
	
	@Query("SELECT od FROM OrderDetail od WHERE od.id.orderId = :orderId")
    List<OrderDetail> findAllByOrderId(@Param("orderId") String orderId);
}
