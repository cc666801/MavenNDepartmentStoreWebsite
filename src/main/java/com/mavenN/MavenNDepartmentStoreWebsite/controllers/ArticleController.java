package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.io.IOException;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
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

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum.Article;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum.ArticleCategory;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.ArticleCategoryService;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.ArticleService;
@Controller
public class ArticleController {

	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private ArticleCategoryService articleCategoryService;

//	@GetMapping("/articleBack")
//	public String article() {
//		return "/forum/article/articleBack";
//	}

////////////////後台///////////////////////////////
	@GetMapping("/articleBack/add")
	public String addArticle(Model model) {
		model.addAttribute("article", new Article());
		List<ArticleCategory> categoryList = articleCategoryService.findAllArticleCategory();
	    model.addAttribute("categoryList", categoryList);
		
		return "/forum/article/articleBackAdd";
	}
	
	@PostMapping("/articleBack/post")
	public String postArticle(@ModelAttribute("article")Article art,
			                  @RequestParam("content") String content,
			                  @RequestParam("articleImage") MultipartFile file) throws IOException  {
	    art.setArticleContent(content);
	    
	 // 處理圖片上傳
	    if (!file.isEmpty()) {
	        art.setArticleImage(file.getBytes());
	    }
	    
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
		List<ArticleCategory> categoryList = articleCategoryService.findAllArticleCategory();
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("art",art);
		return "/forum/article/articleBackEdit";
	}
	
	@PutMapping("/articleBack/edit")
	public String putEditArticle(@ModelAttribute("art") Article art,@RequestParam("articleContent") String content) {
		art.setArticleContent(content); 
		articleService.updateArticleById(art.getArticleID(),art);
		 return "redirect:/articleBack";
	}	
	
	@GetMapping("/articleContent/{id}")
	public String getArticleById(@PathVariable Integer id, Model model) {
	    Article article = articleService.findArticleById(id);
	    model.addAttribute("article", article);
	    return "/forum/article/showArticleContent";
	}
///////////////前台//////////////////////////	
	@GetMapping("/articleList")
	public String showPageFront(@RequestParam(name="p",defaultValue = "1") Integer pageNumber,Model model){
		Page<Article> page=articleService.findArticleByPage(pageNumber);
		model.addAttribute("page",page);
		for (Article art : page.getContent()) {
	        Document doc = Jsoup.parse(art.getArticleContent());
	        String articlePreview = doc.text().substring(0, Math.min(doc.text().length(), 20)); 
	        art.setArticlePreview(articlePreview);
	    }
		return "/forum/article/articleList";
	}
	
//	@GetMapping("/articleList")
//	public String findAllArtFront(Model model){
//		List<Article> findAllArt=articleService.findAllArticle();
//		model.addAttribute("artList", findAllArt);
//		
//		return "/forum/article/articleList";
//	}
	
	@GetMapping("/articleFront/add")
	public String addArticleFront(Model model) {
		model.addAttribute("article", new Article());
		List<ArticleCategory> categoryList = articleCategoryService.findCategoriesPermissions();
	    model.addAttribute("categoryList", categoryList);
		
		return "/forum/article/articleFrontAdd";
	}
	
	@PostMapping("/articleFront/post")
	public String postArticleFront(@ModelAttribute("article")Article art, @RequestParam("content") String content) {
	    art.setArticleContent(content);
	    articleService.addArticle(art);
		return "redirect:/articleList";
	}
	
	
	
	
}
