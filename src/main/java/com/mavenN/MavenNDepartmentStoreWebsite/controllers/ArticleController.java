package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.customerService.LostAndFound;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum.Article;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.ArticleService;

@Controller
public class ArticleController {

	@Autowired
	private ArticleService articleService;

//	@GetMapping("/articleBack")
//	public String article() {
//		return "/forum/article/articleBack";
//	}
	
	@GetMapping("/articleBack/add")
	public String addArticle(Model model) {
		model.addAttribute("article", new Article());
		return "/forum/article/articleBackAdd";
	}
	
	@PostMapping("/articleBack/post")
	public String postArticle(@ModelAttribute("article")Article art, @RequestParam("content") String content) {
	    art.setArticleContent(content);
	    articleService.addArticle(art);
		return "redirect:/articleBack";
	}
	
	@GetMapping("/articleBack")
	public String findAllArtBack(Model model){
		List<Article> findAllArt=articleService.findAllArticle();
		model.addAttribute("artList", findAllArt);
		return "/forum/article/articleBack";
	}
	
	@DeleteMapping("/articleBack/delete")
	public String deleteArticle(@RequestParam Integer id) {
		articleService.deleteArticleById(id);
		return "redirect:/articleBack";
	}
	@GetMapping("/articleBack/edit")
	public String editArticle(@RequestParam("id") Integer id, Model model) {
		Article art=articleService.findArticleById(id);
		model.addAttribute("art",art);
		return "/forum/article/articleBackEdit";
	}
	
	@PutMapping("/articleBack/edit")
	public String putEditArticle(@ModelAttribute("art") Article art) {
		 articleService.updateArticleById(art.getArticleID(),art);
		 return "redirect:/articleBack";
	}
	
	
	
}
