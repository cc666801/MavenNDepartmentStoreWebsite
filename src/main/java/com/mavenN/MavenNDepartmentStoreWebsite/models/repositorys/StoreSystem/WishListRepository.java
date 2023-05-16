package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.StoreSystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Commodity;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.store.WishList;

public interface WishListRepository extends JpaRepository <WishList, Integer> {

//	再次嘗試邪教
	
	List<WishList> findWishListByMember( Member member);

	
//	 透過會員跟商品 找到品項 
	List<WishList> findWishListByMemberAndCommodity(Member member ,Commodity commodity);


//	@Modifying
//	@Query
//	("DELETE FROM WishList w WHERE w.member = :member AND w.commodity = :commodity")
	void deleteWishListByMemberAndCommodity(@Param("member") Member member, @Param("commodity") Commodity commodity);
	
}
