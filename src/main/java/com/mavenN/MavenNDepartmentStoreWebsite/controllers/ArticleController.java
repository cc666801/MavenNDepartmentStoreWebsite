package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.io.IOException;
import java.util.Base64;
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
import org.springframework.web.util.HtmlUtils;

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

	// 後台發文
	@GetMapping("/articleBack/add")
	public String addArticle(Model model) {
		model.addAttribute("article", new Article());
		List<ArticleCategory> categoryList = articleCategoryService.findAllArticleCategory();
		model.addAttribute("categoryList", categoryList);

		return "/forum/article/articleBackAdd";
	}

	@PostMapping("/articleBack/post")
	public String postArticle(@ModelAttribute("article") Article art, @RequestParam("content") String content,
			@RequestParam("imgToByte") MultipartFile file) throws IOException {

		// XSS
		String escapedHtml = HtmlUtils.htmlEscape(content);

		art.setArticleContent(escapedHtml);
		
		// 處理圖片上傳
		if (!file.isEmpty()) {
			art.setArticleImage(file.getBytes());
		}

		articleService.addArticle(art);
		return "redirect:/articleBack";
	}

	// 後台主頁面
	@GetMapping("/articleBack")
	public String findAllArtBack(Model model) {
		List<Article> findAllArt = articleService.findAllArticle();
		for (Article art : findAllArt) {
			if (art.getArticleImage() != null) {
				String base64 = Base64.getEncoder().encodeToString(art.getArticleImage());
				art.setArticleBase64(base64);
			}
		}
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
		Article art = articleService.findArticleById(id);
		List<ArticleCategory> categoryList = articleCategoryService.findAllArticleCategory();
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("art", art);
		
		//XSS
		String unescapedHtml = HtmlUtils.htmlUnescape(art.getArticleContent());
		model.addAttribute("articleContent", unescapedHtml);
		return "/forum/article/articleBackEdit";
	}

	@PutMapping("/articleBack/edit")
	public String putEditArticle(@ModelAttribute("art") Article art, @RequestParam("articleContent") String content) {
		// XSS
		String escapedHtml = HtmlUtils.htmlEscape(content);
		art.setArticleContent(escapedHtml);
		articleService.updateArticleById(art.getArticleID(), art);
		return "redirect:/articleBack";
	}

	@GetMapping("/articleContent/{id}")
	public String getArticleById(@PathVariable Integer id, Model model) {
		Article article = articleService.findArticleById(id);
		// XSS
		String unescapedHtml = HtmlUtils.htmlUnescape(article.getArticleContent());
		article.setArticleContent(unescapedHtml);

		model.addAttribute("article", article);
		return "/forum/article/showArticleContent";
	}

///////////////前台//////////////////////////

	// 前台文章列表
	@GetMapping("/articleList")
	public String showPageFront(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {
		Page<Article> page = articleService.findArticleByPage(pageNumber);
		// 縮圖
		for (Article art : page) {
			if (art.getArticleImage() != null) {
				String base64 = Base64.getEncoder().encodeToString(art.getArticleImage());
				art.setArticleBase64(base64);
			}
		}
		// 預覽文章
		for (Article art : page.getContent()) {
			Document doc = Jsoup.parse(art.getArticleContent());
			String articlePreview = doc.text().substring(0, Math.min(doc.text().length(), 20));
			art.setArticlePreview(articlePreview);
		}

		model.addAttribute("page", page);
		return "/forum/article/articleList";
	}

//	@GetMapping("/articleList")
//	public String findAllArtFront(Model model){
//		List<Article> findAllArt=articleService.findAllArticle();
//		model.addAttribute("artList", findAllArt);
//		
//		return "/forum/article/articleList";
//	}
	// 前台發文
	@GetMapping("/articleFront/add")
	public String addArticleFront(Model model) {
		model.addAttribute("article", new Article());
		List<ArticleCategory> categoryList = articleCategoryService.findCategoriesPermissions();
		model.addAttribute("categoryList", categoryList);

		return "/forum/article/articleFrontAdd";
	}

	@PostMapping("/articleFront/post")
	public String postArticleFront(@ModelAttribute("article") Article art, @RequestParam("content") String content,
			@RequestParam("imgToByte") MultipartFile file) throws IOException {

		// XSS
		String escapedHtml = HtmlUtils.htmlEscape(content);
		art.setArticleContent(escapedHtml);

		// 處理圖片上傳
		if (!file.isEmpty()) {
			art.setArticleImage(file.getBytes());
		}

		articleService.addArticle(art);
		return "redirect:/articleList";
	}

	// 前台會員文章管理
	@GetMapping("/articleManage")
	public String findAllArtManage(Model model) {
		List<Article> findAllArt = articleService.findAllArticle();
		for (Article art : findAllArt) {
			if (art.getArticleImage() != null) {
				String base64 = Base64.getEncoder().encodeToString(art.getArticleImage());
				art.setArticleBase64(base64);
			}
		}
		model.addAttribute("artList", findAllArt);
		return "/forum/article/articleManage";
	}

	@DeleteMapping("/articleManage/delete")
	public String deleteArticleManage(@RequestParam Integer id) {
		articleService.deleteArticleById(id);
		return "redirect:/articleManage";
	}

	@GetMapping("/articleManage/edit")
	public String editArticleMange(@RequestParam("id") Integer id, Model model) {
		Article art = articleService.findArticleById(id);
		List<ArticleCategory> categoryList = articleCategoryService.findAllArticleCategory();
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("art", art);
		//XSS
				String unescapedHtml = HtmlUtils.htmlUnescape(art.getArticleContent());
				model.addAttribute("articleContent", unescapedHtml);
		return "/forum/article/articleManage";
	}

	@PutMapping("/articleManage/edit")
	public String putEditArticleMange(@ModelAttribute("art") Article art,
			@RequestParam("articleContent") String content) {
		// XSS
		String escapedHtml = HtmlUtils.htmlEscape(content);
		art.setArticleContent(escapedHtml);
		articleService.updateArticleById(art.getArticleID(), art);
		return "redirect:/articleManage";
	}
///////////////////點讚系統////////////////
//	@PostMapping("/article/{articleId}/like")
//	public String like(@PathVariable("articleId") Integer articleId, HttpSession session) {
//	    Integer memberId = (Integer) session.getAttribute("memberId");
//
//	    try {
//	    	articleService.addLike(articleId, memberId);
//	    } catch (Exception e) {
//	        // 處理重複點讚的錯誤
//	        e.printStackTrace();
//	    }
//
//	    return "redirect:/article/showArticleContent/{articleId}";
//	}
//	
//	
//	@PostMapping("/article/{articleId}/unlike")
//	public String unlike(@PathVariable("articleId") Integer articleId, HttpSession session) {
//	    Integer memberId = (Integer) session.getAttribute("memberId");
//
//	    try {
//	    	articleService.cancelLike(articleId, memberId);
//	    } catch (Exception e) {
//	        // 處理未點過讚的錯誤
//	        e.printStackTrace();
//	    }
//
//	    return "redirect:/article/showArticleContent/{articleId}";
//	}

}
