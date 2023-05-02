package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CommCate;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Commodity;

public interface CommodityRepository extends JpaRepository<Commodity,Integer> {

//嘗試使用邪教寫法
//	這邊設計的是所有商品的分頁器
	List<Commodity> findAllCommByCommCate(CommCate commCate);

//	嘗試使用分頁器  方法名稱改為 findCommodityByCommCate
	Page<Commodity> findCommodityByCommCate(CommCate commCate, Pageable pageable);


//嘗試僅顯示 上架產品
	
	List<Commodity> findBycommShelve(boolean commShelve);

	
	
}
