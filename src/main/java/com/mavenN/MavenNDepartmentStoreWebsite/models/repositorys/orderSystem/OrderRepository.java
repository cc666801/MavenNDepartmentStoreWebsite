package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.Order;

public interface OrderRepository extends JpaRepository<Order, Integer> {
	@Query("SELECT o FROM Order o JOIN o.orderStatus os WHERE o.member.id = :memberId AND os.orderStatusName = '貨到付款訂單' ORDER BY o.createOrderTime DESC")
	List<Order> findAllCashOnDeliverByMemberId(@Param("memberId") Integer memberId);
	
	@Query("SELECT o FROM Order o JOIN o.orderStatus os WHERE o.member.id = :memberId AND os.orderStatusName = '信用卡付款訂單' ORDER BY o.createOrderTime DESC")
	List<Order> findAllPaymentFlowByMemberId(@Param("memberId") Integer memberId);
	
	@Query("SELECT o FROM Order o JOIN o.orderStatus os WHERE o.member.id = :memberId AND os.orderStatusName = '已取消訂單' ORDER BY o.createOrderTime DESC")
	List<Order> findAllCancelOrderByMemberId(@Param("memberId") Integer memberId);
	
	@Query("SELECT o FROM Order o JOIN o.orderStatus os WHERE o.member.id = :memberId")
	List<Order> findAllOrderByMemberId(@Param("memberId") Integer memberId);
}
