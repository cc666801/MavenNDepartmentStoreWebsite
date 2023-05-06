package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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

//	後台讀取所有資料 (可將路徑設為 ShowAll)
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
//		下面這兩行是新加的  可能會有問題... (可讀取成功 讚啦)
		List<CommCate> commcateList = commCateService.findAllCate();
		model.addAttribute("commcateList", commcateList);

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

	// 分頁器 可做動
//	@GetMapping("/Store/Commodity/findAllComm")
//	public String findByPage(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {
//		Page<Commodity> page = commodityService.usePgbToFindAllCommodity(pageNumber);
//
//		model.addAttribute("page", page);
//		return "Store/Storeindex";
//
//	}

//	找所有類別這裡還可以執行 2023/05/01 11:27
	@GetMapping("/Store/Commodity/findCate")
	public String showAllCommByCommcate(CommCate commCate, Model model) {
		List<Commodity> showAllCommByCommcate = commodityService.findAllCommByCommCate(commCate);
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

//	5/3 嘗試來做 判斷上下一筆資料

	@GetMapping("/Store/Commodity/prevComm/{commId}")
	public String getPrevComm(@PathVariable Long commId, Model model) {
		Commodity prevComm = commodityService.findPrevComm(commId);
		if (prevComm != null) {
			model.addAttribute("commodity", prevComm);
			Integer prevCommId = prevComm.getCommId();
			model.addAttribute("prevCommId", prevCommId);
		}
		return "Store/Commodity/CommodityDetail";
	}

	@GetMapping("/Store/Commodity/nextComm/{commId}")
	public String getNextComm(@PathVariable Long commId, Model model) {
		Commodity nextComm = commodityService.findNextComm(commId);
		if (nextComm != null) {
			model.addAttribute("commodity", nextComm);
			Integer nextCommId = nextComm.getCommId();
			model.addAttribute("nextCommId", nextCommId);

		}
		return "Store/Commodity/CommodityDetail";
	}

//	5/4 顯示上架產品   可做動

//	@GetMapping("/Store/Commodity/commodities")
//	public String showCommodities(Model model) {
//		List<Commodity> commodities = commodityService.findByCommShelveIsTrue();
//		List<Commodity> findAllCommodity = commodityService.findAllCommodity();
//		for (Commodity commodity : findAllCommodity) {
//			byte[] imageData = commodity.getCommPicture();
//			if (imageData != null) {
//				String base64String = Base64.getEncoder().encodeToString(imageData);
//				commodity.setBase64StringcommPicture(base64String);
//			}
//		}
//		
//		model.addAttribute("commodities", commodities);
//		return "Store/Commodity/showCommodityByShelves";
//	}

	// 開始亂寫不知道是否可動

//	@GetMapping("/Store/Commodity/commodities")
////	public String showCommodities(Model model) {
//		public String showCommodities(@RequestParam(name = "p", defaultValue = "0")Model model, Pageable pageable) {
//
//		List<Commodity> commodities = commodityService.findByCommShelveIsTrue(pageable);
//		List<Commodity> findAllCommodity = commodityService.findAllCommodity();
//		for (Commodity commodity : findAllCommodity) {
//			byte[] imageData = commodity.getCommPicture();
//			if (imageData != null) {
//				String base64String = Base64.getEncoder().encodeToString(imageData);
//				commodity.setBase64StringcommPicture(base64String);
//			}
//		}
////		Page<Commodity> page = commodityService.usePgbToFindAllCommodity(pageNumber);
//		
////		model.addAttribute("page", page);
//		
//		model.addAttribute("commodities", commodities);
//		return "Store/Commodity/showCommodityByShelves";
//	}

////	分類的分頁器  原版可動
//	@GetMapping("/Store/Commodity/findAllCommByCate")
//	public String findByCatePage(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber,
//			@RequestParam(name = "cateId", required = false) Integer cateId, Model model) {
//		CommCate commCate = commCateService.findcateById(cateId);
//		Page<Commodity> commodityPage = commodityService.usePgbToFindCommodityByCommcate(commCate, pageNumber);
////		System.out.println(commodityPage.getContent().get(0).getCommId());
//		model.addAttribute("commodityPage", commodityPage);
//		
//		
//
//		return "Store/Commodity/findCommByCate";
//	}
//	

//	開改 顯示分類 同時顯示上下架產品
	@GetMapping("/Store/Commodity/findAllCommByCate")
	public String findByCatePage(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber,
			@RequestParam(name = "cateId", required = false) Integer cateId, Model model) {

		Pageable pageable = PageRequest.of(pageNumber - 1, 3);
		Page<Commodity> page = commodityService.findByCommShelveIsTrue(pageable);
		List<Commodity> commodities = page.getContent();
		for (Commodity commodity : commodities) {
			byte[] imageData = commodity.getCommPicture();
			if (imageData != null) {
				String base64String = Base64.getEncoder().encodeToString(imageData);
				commodity.setBase64StringcommPicture(base64String);
			}
		}

		CommCate commCate = commCateService.findcateById(cateId);
		Page<Commodity> commodityPage = commodityService.usePgbToFindCommodityByCommcate(commCate, pageNumber);
//		System.out.println(commodityPage.getContent().get(0).getCommId());
		model.addAttribute("commodityPage", commodityPage);
		model.addAttribute("page", page);
		model.addAttribute("commodities", commodities);

		return "Store/Commodity/findCommByCate";
	}

//	上下架可以動 不要問 已經整合進入 Store index
	@GetMapping("/Store/Commodity/commodities")
	public String showCommodities(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {

		Pageable pageable = PageRequest.of(pageNumber - 1, 2); // 每頁 10 筆資料
		Page<Commodity> page = commodityService.findByCommShelveIsTrue(pageable);
		List<Commodity> commodities = page.getContent();

		for (Commodity commodity : commodities) {
			byte[] imageData = commodity.getCommPicture();
			if (imageData != null) {
				String base64String = Base64.getEncoder().encodeToString(imageData);
				commodity.setBase64StringcommPicture(base64String);
			}
		}

		model.addAttribute("page", page);
		model.addAttribute("commodities", commodities);
		return "Store/Commodity/showCommodityByShelves";
	}

//	5/5gpt寫的 可動 但不理解

//	@GetMapping("/Store/Commodity/commodities")
//	public String showCommodities(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {
//		Pageable pageable = PageRequest.of(pageNumber, 3); // 每頁 3 筆資料
//		Page<Commodity> page = commodityService.findByCommShelveIsTrue(pageable);
//		List<Commodity> commodities = new ArrayList<>(page.getContent()); // 複製分頁結果，避免修改原始結果
//
//		// 篩選下架商品，並移除
//		List<Commodity> soldOutCommodities = commodities.stream().filter(c -> !c.getCommShelve())
//				.collect(Collectors.toList());
//		commodities.removeAll(soldOutCommodities);
//
//		for (Commodity commodity : commodities) {
//			byte[] imageData = commodity.getCommPicture();
//			if (imageData != null) {
//				String base64String = Base64.getEncoder().encodeToString(imageData);
//				commodity.setBase64StringcommPicture(base64String);
//			}
//		}
//
//		model.addAttribute("page", new PageImpl<>(commodities, pageable, commodities.size())); // 使用修改後的商品列表建立新的分頁結果
//		model.addAttribute("commodities", commodities);
//		return "Store/Commodity/showCommodityByShelves";
//	}

////	 可動
//	@GetMapping("/Store/Commodity/findAllComm")
//	public String findByPage(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {
//		Page<Commodity> page = commodityService.usePgbToFindAllCommodity(pageNumber);
//
//		model.addAttribute("page", page);
//		
//		List<CommCate> findAllCate = commCateService.findAllCate();
//		model.addAttribute("findAllCate",findAllCate);
//		return "Store/Storeindex";
//
//	}
//	

//	 可動 綜合的 讚啦
	@GetMapping("/Store/Commodity/findAllComm")
	public String findByPage(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {
		Pageable pageable = PageRequest.of(pageNumber - 1, 5); // 每頁 10 筆資料
		Page<Commodity> page = commodityService.findByCommShelveIsTrue(pageable);
		List<Commodity> commodities = page.getContent();

		for (Commodity commodity : commodities) {
			byte[] imageData = commodity.getCommPicture();
			if (imageData != null) {
				String base64String = Base64.getEncoder().encodeToString(imageData);
				commodity.setBase64StringcommPicture(base64String);
			}
		}

		model.addAttribute("page", page);
		model.addAttribute("commodities", commodities);
		List<CommCate> findAllCate = commCateService.findAllCate();
		model.addAttribute("findAllCate", findAllCate);
		return "Store/Storeindex";

	}
//	

//	5/4 開始模糊搜尋

	@GetMapping("/Store/Commodity/findCommByName")
	public String findByCommNameContaining(@RequestParam("commName") String commName,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {
		Page<Commodity> page = commodityService.findByCommNameContaining(commName, pageNumber);
		model.addAttribute("page", page);
		return "Store/Storeindex";

	}

//	寫分頁欄  壞了

	@GetMapping("/Store/Commodity/findCommByCate")
	public String findByCommNameContaining1(@RequestParam("commName") String commName,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {
		Page<Commodity> page = commodityService.findByCommNameContaining(commName, pageNumber);
		model.addAttribute("page", page);
		return "Store/Commodity/CatePage";

	}

	public CommodityController() {
		// TODO Auto-generated constructor stub
	}

}
