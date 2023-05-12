package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.StoreSystem;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.store.WishList;

public interface WishListRepository extends JpaRepository <WishList, Integer> {

	
	
}
