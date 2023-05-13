package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Commodity;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.store.WishList;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.StoreSystem.WishListRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CommodityRepository;

@Service
public class WishListService {

	@Autowired
	private WishListRepository wishListRepository;

	@Autowired
	private CommodityRepository commodityRepository;

	// 從當前商品的 ID 獲取該商品的實例
	
	
//	新增心願清單
	
	public void addwishList (WishList wishList) {
		wishListRepository.save(wishList);
	}
	
	
//	商品新增進入心願清單
	
	public void addToWishList(Integer commId, Member member) {
        // 從當前商品的 ID 獲取該商品的實例
        Commodity commodity = commodityRepository.findById(commId).orElse(null);

        if (commodity != null) {
            // 創建一個新的心願清單項目
            WishList wishListItem = new WishList();
            wishListItem.setMember(member);
            wishListItem.setCommodity(commodity);
            wishListItem.setWishlistCDay(new Date());
            wishListItem.setWishlistMDay(new Date());
            
         // 將心願清單項目保存到數據庫中
            wishListRepository.save(wishListItem);
        }
    }

	
	
	
	
	
	
	
	

	public WishListService() {
		// TODO Auto-generated constructor stub
	}

}
