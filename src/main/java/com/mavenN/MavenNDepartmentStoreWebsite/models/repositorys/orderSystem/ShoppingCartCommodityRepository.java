package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.ShoppingCartCommodity;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.ShoppingCartCommodityId;

public interface ShoppingCartCommodityRepository extends JpaRepository<ShoppingCartCommodity, ShoppingCartCommodityId> {

}
