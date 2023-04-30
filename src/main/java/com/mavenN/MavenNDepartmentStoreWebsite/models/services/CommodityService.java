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
import org.springframework.web.bind.annotation.RequestParam;

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
	
	public Commodity findCommodityById (Integer commId) {
		Optional<Commodity> option = commodityRepository.findById(commId);
		
		if(option.isEmpty()) {
			return null;
		}
		
		return option.get();
	}
	
	
	
//	透過 id 更新
	@Transactional
	public Commodity updateCommodityById(Integer commId, Commodity newcommodity) {
		Optional<Commodity> option = commodityRepository.findById(commId);

		if(option.isPresent()) {
			Commodity comm=option.get();
			comm.setCommName(newcommodity.getCommName());
			comm.setCommDesc(newcommodity.getCommDesc());
			comm.setCommShelve(newcommodity.getCommShelve());
			comm.setCommPicture(newcommodity.getCommPicture());
			comm.setCommDiscount(newcommodity.getCommDiscount());
			comm.setCommPrice(newcommodity.getCommPrice());
			
			return comm;
		}
		return null;
	}
	
	
//	透過id刪除
	
	public void deleteById(Integer commId) {
		commodityRepository.deleteById(commId);
	}
	
	
	
//	嘗試增加分頁器 4/28 04:17
//	原本下面這行 還有
//	    Pageable pageable = PageRequest.of(pageNo - 1, pageSize, Sort.by("id").ascending());

//	@GetMapping("/Store/Commodity/page")
//	public List<Commodity> findByPage(@RequestParam("p")Integer pageNumber){
//		Pageable pgb =PageRequest.of(pageNumber-1, 3,Sort.Direction.ASC, "comm_Id");
//		Page<Commodity> page=commodityRepository.findAll(pgb);
//		return page.getContent();
//	}
//	
	
	
	
//	public List<Commodity> getCommodityList(int pageNo, int pageSize) {
//	    Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
//	    Page<Commodity> pageResult = commodityRepository.findAll(pageable);
//	    return pageResult.getContent();
//	}

//	public int getCommodityCount() {
//	    return (int) commodityRepository.count();
//	}
//	
	
	
	
	public Page<Commodity> findByPage(@RequestParam("p")Integer pageNumber){
		Pageable pgb =PageRequest.of(pageNumber-1, 3,Sort.Direction.ASC, "commId");
		Page<Commodity> page=commodityRepository.findAll(pgb);
		return page;
	}
	
	
	
	public CommodityService() {
		// TODO Auto-generated constructor stub
	}

}
