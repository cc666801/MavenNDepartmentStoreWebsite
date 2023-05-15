package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CommCate;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Commodity;

public interface CommodityRepository extends JpaRepository<Commodity, Integer> {

//嘗試使用邪教寫法
//	這邊設計的是所有商品的分頁器
	List<Commodity> findAllCommByCommCate(CommCate commCate);

//	嘗試使用分頁器  方法名稱改為 findCommodityByCommCate   5/10暫時隱蔽
	Page<Commodity> findCommodityByCommCate(CommCate commCate, Pageable pageable);



//	5/4邪教寫法 ， 可成功!
//    List<Commodity> findByCommShelveIsTrue();

//	5/4 以下開始亂寫 含分頁器
	Page<Commodity> findByCommShelveIsTrue(Pageable pageable);

    
	
//	找尋關鍵字  5/4 開始
//		邪教
	Page<Commodity> findByCommNameContaining(String commName,Pageable pageable);
    
//	顯示產品是否上下架
	List<Commodity> findByCommShelveIsTrue();
	
	
//	5/3 嘗試開始判斷 是否有下一筆 或者上一筆資料 失敗
	
	@Query(value = "SELECT MIN(c.comm_Id) FROM Commodity c", nativeQuery = true)
	Long findMinCommId();

	@Query(value = "SELECT MAX(c.comm_Id) FROM Commodity c", nativeQuery = true)
	Long findMaxCommId();

	Commodity findFirstByCommIdGreaterThanOrderByCommIdAsc(Long commId);

	Commodity findFirstByCommIdLessThanOrderByCommIdDesc(Long commId);

    

	
//	嘗試撰寫 熱門商品排序寫法
	List<Commodity>findByOrderByCommClickDesc();

	
//	點類別 顯示上架產品
	Page<Commodity> findByCommCateAndCommShelveIsTrue(CommCate commCate, Pageable pageable);
	
	List<Commodity>findByCommShelveIsTrueOrderByCommClickDesc();
	
//	重寫分類與分頁器
//	Page<Commodity>findCommodityByCommCate(Pageable pageable);
	
	
	
}
