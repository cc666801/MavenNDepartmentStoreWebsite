package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Commodity;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CommodityRepository;

@Service
public class CommodityService {

	@Autowired
	private CommodityRepository commodityRepository;
	
	
//	新增商品
	public void addCommodity(Commodity commodity) {
		commodityRepository.save(commodity);
	}
	
	
//	找尋所有商品
	
	public List<Commodity>findAllCommodity(){
		List<Commodity> findAllCommodity = commodityRepository.findAll();
		return findAllCommodity;
	}
	
	
// 透過 id 去尋找此商品
	
	public Commodity findCommodityById (Integer comm_Id) {
		Optional<Commodity> option = commodityRepository.findById(comm_Id);
		
		if(option.isEmpty()) {
			return null;
		}
		
		return option.get();
	}
	
	
	
//	透過 id 更新
	@Transactional
	public Commodity updateCommodityById(Integer comm_Id, Commodity newcommodity) {
		Optional<Commodity> option = commodityRepository.findById(comm_Id);

		if(option.isPresent()) {
			Commodity comm=option.get();
			comm.setComm_Name(newcommodity.getComm_Name());
			comm.setComm_Desc(newcommodity.getComm_Desc());
			comm.setComm_Shelve(newcommodity.getComm_Shelve());
			comm.setComm_Picture(newcommodity.getComm_Picture());
			comm.setComm_Discount(newcommodity.getComm_Discount());
			comm.setComm_Price(newcommodity.getComm_Price());
			
			return comm;
		}
		return null;
	}
	
	
//	透過id刪除
	
	public void deleteById(Integer comm_Id) {
		commodityRepository.deleteById(comm_Id);
	}
	
	
	
//	嘗試增加分頁器 4/28 04:17
//	原本下面這行 還有
//	    Pageable pageable = PageRequest.of(pageNo - 1, pageSize, Sort.by("id").ascending());

	public List<Commodity> getCommodityList(int pageNo, int pageSize) {
	    Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
	    Page<Commodity> pageResult = commodityRepository.findAll(pageable);
	    return pageResult.getContent();
	}

	public int getCommodityCount() {
	    return (int) commodityRepository.count();
	}
	
	
	
	
//嘗試加入 CommCate類別
	
	
	
	public CommodityService() {
		// TODO Auto-generated constructor stub
	}

}
