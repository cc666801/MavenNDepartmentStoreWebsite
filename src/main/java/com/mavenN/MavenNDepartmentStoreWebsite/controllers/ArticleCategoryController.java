package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum.ArticleCategory;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.ArticleCategoryService;

@Controller
public class ArticleCategoryController {
	
	@Autowired
	private ArticleCategoryService articleCategoryService;
	
	
	
	
//	@GetMapping("/articleConfiguration")
//	public String articleConfiguration() {
//		return "/forum/article/articleConfiguration";
//	}
	
//	@GetMapping("/articleConfiguration")
//	public String addArticleCategory(Model model) {
//		model.addAttribute("category", new ArticleCategory());
//		return "/forum/article/articleConfiguration";
//	}
	@PostMapping("/articleConfiguration/postCategory")
	@ResponseBody
	public ResponseEntity<?> postArticleCategory(@ModelAttribute("category") ArticleCategory category,
	        BindingResult result, Model model) {
	    if (result.hasErrors()) {
	        return ResponseEntity.badRequest().body("表單輸入有誤！");
	    }
	    try {
	        articleCategoryService.addArticleCategory(category);
	        return ResponseEntity.ok().build();
	    } catch (DataIntegrityViolationException e) {
	        String errorMessage = "類別名稱已存在，請重新輸入。";
	        return ResponseEntity.status(HttpStatus.CONFLICT).body(errorMessage);
	    }
	}
	
	@GetMapping("/articleConfiguration")
	public String findAllArticleCategory(Model model){
		model.addAttribute("category", new ArticleCategory());
		List<ArticleCategory> findAllCate=articleCategoryService.findAllArticleCategory();
		model.addAttribute("categoryList", findAllCate);
		return "/forum/article/articleConfiguration";
	}
	
	
	
	@DeleteMapping("/articleConfiguration/deleteCategory")
	public String deleteArticleCategory(@RequestParam Integer id) {
		articleCategoryService.deleteArticleCategoryById(id);
		return "redirect:/articleConfiguration";
	}
	
	
	@PostMapping("/articleConfiguration/editCategory")
	@ResponseBody
	public ResponseEntity<?> editArticleCategory(@RequestParam("id") Integer categoryId,
	                                             @RequestParam("permission") Integer categoryPermission) {
	    try {
	        ArticleCategory category = articleCategoryService.findArticleCategoryById(categoryId);
	        category.setArticleCategoryPermissions(categoryPermission);
	        articleCategoryService.updateArticleCategoryById(categoryId, category);
	        return ResponseEntity.ok().build();
	    } catch (Exception e) {
	        String errorMessage = "更新類別權限失敗！";
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorMessage);
	    }
	}
		
		
	}
	

	
	

