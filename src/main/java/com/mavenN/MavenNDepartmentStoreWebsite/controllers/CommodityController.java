package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CommCate;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Commodity;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.CommCateService;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.CommodityService;

@Controller
public class CommodityController {

	@Autowired
	private CommodityService commodityService;

//	@Autowired
//	private CommodityRepository commodityRepository;

	@Autowired
	private CommCateService commCateService;

//	新增商品 

	@GetMapping("/Store/Commodity/add")
	public String addCommodity(Commodity commodity, Model model) {
		model.addAttribute("commodity", new Commodity());

		List<CommCate> commcateList = commCateService.findAllCate();
		model.addAttribute("commcateList", commcateList);

		return "Store/Commodity/CommodityBackadd";
	}

	@PostMapping("/Store/Commodity/post")
	public String postCommodity(@ModelAttribute("commodity") Commodity commodity, Model model,
			@RequestParam("transferToByteArray") MultipartFile comm_pictureFile) {
		if (!comm_pictureFile.isEmpty()) {
			try {
				// Get bytes of the uploaded file
				byte[] comm_Picture = comm_pictureFile.getBytes();
				commodity.setCommPicture(comm_Picture);

			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		commodityService.addCommodity(commodity);
		model.addAttribute("commodity", commodity);

		return "redirect:/Store/Commodity/CommodityBack";
	}

//	讀取所有資料
//	@GetMapping("/Store/Commodity/CommodityBack")
//	public String findAllCommodityBack(Model model) {
//		List<Commodity> findAllCommodity = CommodityService.findAllCommodity();
//		model.addAttribute("commodityList",findAllCommodity);
//		return "/Store/Commodity/CommodityBack";
//	}
//	

	@GetMapping("/Store/Commodity/CommodityBack")
	public String findAllCommodityBack(Model model) {
		List<Commodity> findAllCommodity = commodityService.findAllCommodity();
		for (Commodity commodity : findAllCommodity) {
			byte[] imageData = commodity.getCommPicture();
			if (imageData != null) {
				String base64String = Base64.getEncoder().encodeToString(imageData);
				commodity.setBase64StringcommPicture(base64String);
			}
		}
		model.addAttribute("commodityList", findAllCommodity);
		return "/Store/Commodity/CommodityBack";
	}

//	讀取所有資料 (可將路徑設為 ShowAll)
	@GetMapping("/Store/Commodity/ShowAll")
	public String ShowAllCommodity(Model model) {
		List<Commodity> findAllCommodity = commodityService.findAllCommodity();
		for (Commodity commodity : findAllCommodity) {
			byte[] imageData = commodity.getCommPicture();
			if (imageData != null) {
				String base64String = Base64.getEncoder().encodeToString(imageData);
				commodity.setBase64StringcommPicture(base64String);
			}
		}

		model.addAttribute("commodityList", findAllCommodity);
		return "/Store/Commodity/CommodityBack";
	}

//	刪除資料 透過 id
	@DeleteMapping("/Store/Commodity/delete")
	public String deleteCommodity(@RequestParam Integer commId) {
		commodityService.deleteById(commId);
		return "redirect:/Store/Commodity/CommodityBack";
	}

//	更新
	@GetMapping("/Store/Commodity/editCommodity")
	public String editCommodity(@RequestParam("commId") Integer commId, Model model) {
		Commodity commodity = commodityService.findCommodityById(commId);

		model.addAttribute("commodity", commodity);
		return "Store/Commodity/CommodityEdit";

	}

	@PutMapping("/Store/Commodity/editCommodity")
	public String puteditCommodity(@ModelAttribute("commodity") Commodity commodity,
			@RequestParam(value = "transferToByteArray", required = false) MultipartFile commpictureFile) {
		if (commpictureFile != null && !commpictureFile.isEmpty()) {
			try {
				// Get bytes of the uploaded file
				byte[] commPicture = commpictureFile.getBytes();
				commodity.setCommPicture(commPicture);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			Commodity oldCommodity = commodityService.findCommodityById(commodity.getCommId());
			commodity.setCommPicture(oldCommodity.getCommPicture());
		}
		commodityService.updateCommodityById(commodity.getCommId(), commodity);
		return "redirect:/Store/Commodity/CommodityBack";
	}

	// 分頁器
	@GetMapping("/Store/Commodity/findAllComm")
	public String findByPage(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {
		Page<Commodity> page = commodityService.findByPage(pageNumber);

		model.addAttribute("page", page);
		return "Store/Storeindex";

	}

// 找商品透過id
	@GetMapping("/Store/Commodity/findComm")
	public String findByCommId(@RequestParam(name = "commId") Integer commodity, Model model) {
		Commodity commodityInfo = commodityService.getCommodityById(commodity);
		model.addAttribute("commodityInfo", commodityInfo);
		return "Store/Commodity/CommodityDetail";
	}

//	嘗試顯示折扣價格   無做動  ...
//	@RequestMapping("/commodityDetail")
//	public String commodityDetail(Model model, @RequestParam(name = "commId") Integer commId) {
//	    Commodity commodityInfo = commodityService.getCommodityById(commId);
//	    Double price = commodityInfo.getCommPrice();
//	    String discount = commodityInfo.getCommDiscount();
//	    Double discountedPrice = commodityService.calculateDiscountedPrice(price, discount);
//	    commodityInfo.setCommPrice(discountedPrice);
//	    model.addAttribute("commodityInfo", commodityInfo);
//	    return "commodityDetail";
//	}


	
//	這裡還可以執行 2023/05/01 11:27
	@GetMapping("/Store/Commodity/findCate")
	public String showAllCommByCommcate(CommCate commCate ,Model model) {
		List<Commodity> showAllCommByCommcate =commodityService.findAllCommByCommCate(commCate);
		for (Commodity commodity : showAllCommByCommcate) {
			byte[] imageData = commodity.getCommPicture();
			if (imageData != null) {
				String base64String = Base64.getEncoder().encodeToString(imageData);
				commodity.setBase64StringcommPicture(base64String);
			}
		}

		
		model.addAttribute("commodityList", showAllCommByCommcate);
		return "Store/Commodity/findCommByCate";
	}

//	分類的分頁器  5/2 12:27 未完成
//	@GetMapping("/Store/Commodity/findAllCommByCate")
//	public String findByCatePage(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber,
//	                             @RequestParam(name = "cateId") Integer cateId,
//	                             Model model) {
//	    CommCate commCate = new CommCate();
//	    commCate.setCateId(cateId);
//
//	    Page<Commodity> page = commodityService.findByCommCateAndPage(commCate, pageNumber);
//
//	    model.addAttribute("page", page);
//	    return "Store/Commodity/findCommByCate";
//	}
	
	
	
	
	public CommodityController() {
		// TODO Auto-generated constructor stub
	}

}
