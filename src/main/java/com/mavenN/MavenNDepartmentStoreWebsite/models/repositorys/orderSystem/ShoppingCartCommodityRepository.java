package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.ShoppingCartCommodity;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.ShoppingCartCommodityId;

public interface ShoppingCartCommodityRepository extends JpaRepository<ShoppingCartCommodity, ShoppingCartCommodityId> {
	@Query("SELECT scc FROM ShoppingCartCommodity scc JOIN scc.shoppingCart sc JOIN sc.member m WHERE m.id = :memberId")
	List<ShoppingCartCommodity> findByMemberId(@Param("memberId") Integer memberId);
}
