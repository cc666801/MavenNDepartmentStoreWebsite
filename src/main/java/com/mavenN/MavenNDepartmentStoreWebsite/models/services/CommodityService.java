package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.Base64;
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

	public List<Commodity> findAllCommodity() {
		List<Commodity> findAllCommodity = commodityRepository.findAll();
		return findAllCommodity;
	}

// 透過 id 去尋找此商品

	public Commodity findCommodityById(Integer commId) {
		Optional<Commodity> option = commodityRepository.findById(commId);

		if (option.isEmpty()) {
			return null;
		}

		return option.get();
	}

//	透過 id 更新
	@Transactional
	public Commodity updateCommodityById(Integer commId, Commodity newcommodity) {
		Optional<Commodity> option = commodityRepository.findById(commId);

		if (option.isPresent()) {
			Commodity comm = option.get();
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

//分頁器
	public Page<Commodity> findByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 3, Sort.Direction.ASC, "commId");
		Page<Commodity> page = commodityRepository.findAll(pgb);
		for (Commodity commodity : page.getContent()) {
			byte[] commPicture = commodity.getCommPicture();
			String base64string = Base64.getEncoder().encodeToString(commPicture);
			commodity.setBase64StringcommPicture(base64string);
		}

		return page;
	}

//嘗試顯示商品詳細頁面
	public Commodity getCommodityById(Integer commId) {
		Optional<Commodity> optionalCommodity = commodityRepository.findById(commId);
		if (optionalCommodity.isPresent()) {
			Commodity commodity = optionalCommodity.get();
		
			// 將其他需要的資訊放入 commodityInfo 對象中
			byte[] commPicture = commodity.getCommPicture();
			String base64string = Base64.getEncoder().encodeToString(commPicture);
			commodity.setBase64StringcommPicture(base64string);
			return commodity;
		}
		return null;
	}
	
//嘗試顯示價格變動...
	public Double calculateDiscountedPrice(Double price, String discount) {
	    if (discount == null) {
	        return price;
	    } else {
	        double discountPercentage = Double.parseDouble(discount.replace("%", "")) / 100;
	        return price * (1 - discountPercentage);
	    }
	}
	

	public CommodityService() {
		// TODO Auto-generated constructor stub
	}

}