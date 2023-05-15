package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.StoreSystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.store.WishList;

public interface WishListRepository extends JpaRepository <WishList, Integer> {

//	再次嘗試邪教
	
	List<WishList> findWishListByMember( Member member);

	
	
}
