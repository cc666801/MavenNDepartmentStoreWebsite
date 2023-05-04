package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.mavenN.MavenNDepartmentStoreWebsite.models.services.CommodityService;

@Controller
public class StoreController {

	@Autowired
	private CommodityService commodityService;

	

	
// 
	
//    @GetMapping("/list")
//    public String listCommodities(Model theModel, @RequestParam(defaultValue = "0") int pageNo) {
// 
//        int pageSize = 3; // 每頁顯示的商品數量
// 
//        List<Commodity> commodityList = commodityService.getCommodityList(pageNo, pageSize);
// 
//        theModel.addAttribute("commodityList", commodityList);
// 
//        int totalItems = commodityService.getCommodityCount(); 
// 
//        int totalPages = (int) Math.ceil((double) totalItems / pageSize); 
// 
//        theModel.addAttribute("totalPages", totalPages);
// 
//        return "commodity-list";
//    }

//	
//	@GetMapping("/Store/Storeindex")
//	public String getstore(Model model) {
//
//		List<Commodity> findAllCommodity = commodityService.findAllCommodity();
//		for (Commodity commodity : findAllCommodity) {
//			byte[] imageData = commodity.getCommPicture();
//			if (imageData != null) {
//				String base64String = Base64.getEncoder().encodeToString(imageData);
//				commodity.setBase64StringcommPicture(base64String);
//			}
//		}
//		model.addAttribute("commodityList", findAllCommodity);
//		return "Store/Storeindex";
//	}
//	
//	
	
	
	
	
	//分頁器
	
//	@GetMapping("/Store/Commodity/page")
//	public String findByPage(@RequestParam("p")Integer pageNumber,Model model){
//		Page<Commodity> page=commodityService.findByPage(pageNumber);
//		model.addAttribute("page",page);
//		
//		return "Store/Storeindex";
//		
//		
//	}
//	
//	
	
	
	
	
	
}

//	@GetMapping("/Store/Storeindex")
//	public String getCommodityList(Model theModel, @RequestParam(name="pageNo",defaultValue = "1") int pageNo) {
//	    int pageSize = 3; // 每頁顯示的商品數量
//	    List<Commodity> commodityList = commodityService.getCommodityList(pageNo, pageSize);
//	    for (Commodity commodity : commodityList) {
//	        byte[] imageData = commodity.getComm_Picture();
//	        if (imageData != null) {
//	            String base64String = Base64.getEncoder().encodeToString(imageData);
//	            commodity.setBase64Stringcomm_Picture(base64String);
//	        }
//	    }
//	    theModel.addAttribute("commodityList", commodityList);
//	    int totalItems = commodityService.getCommodityCount(); // 商品總數
//	    int totalPages = (int) Math.ceil((double) totalItems / pageSize); // 總頁數
//	    theModel.addAttribute("totalPages", totalPages);
//	    return "Store/Storeindex";
//	}
//}
