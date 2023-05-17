package com.mavenN.MavenNDepartmentStoreWebsite.controllers.forum;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.HtmlUtils;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum.Article;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum.ArticleCategory;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum.Comment;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.forum.ArticleCategoryService;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.forum.ArticleService;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.forum.CommentService;



@Controller
public class ArticleController {

	@Autowired
	private ArticleService articleService;

	@Autowired
	private ArticleCategoryService articleCategoryService;
	
	
	@Autowired
	private CommentService commentService;
	
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
//		String escapedHtml = HtmlUtils.htmlEscape(content);
//		art.setArticleContent(escapedHtml);
		art.setArticleContent(content);
		// 處理圖片上傳
		if (!file.isEmpty()) {
			art.setArticleImage(file.getBytes());
		}else {
		    // 如果上傳的圖片為空，則設定預設圖片
			Path imagePath = Paths.get("src/main/webapp/assetsForFrontend/img/noImage.png");
			byte[] defaultImage = Files.readAllBytes(imagePath);
			art.setArticleImage(defaultImage);
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
		
		// 取得圖片資訊
	    byte[] imageData = art.getArticleImage();
	    if (imageData != null) {
	        String base64Image = Base64.getEncoder().encodeToString(imageData);
	        model.addAttribute("imageData", base64Image);
	    }
		
		//XSS
//		String unescapedHtml = HtmlUtils.htmlUnescape(art.getArticleContent());
//		model.addAttribute("articleContent", unescapedHtml);
		model.addAttribute("articleContent",art.getArticleContent());
		return "/forum/article/articleBackEdit";
	}

	@PutMapping("/articleBack/edit")
	public String putEditArticle(@ModelAttribute("art") Article art, @RequestParam("articleContent") String content,
			@RequestParam("imgToByte") MultipartFile file)throws IOException {
		// XSS
//		String escapedHtml = HtmlUtils.htmlEscape(content);
//		art.setArticleContent(escapedHtml);
//		art.setArticleContent(content);
		// 處理圖片上傳
		if (!file.isEmpty()) {
			art.setArticleImage(file.getBytes());
		}else {
			// 若使用者沒有選擇要上傳圖片，就使用舊的圖片資料更新回資料庫中
	        Article oldArticle = articleService.findArticleById(art.getArticleID());
	        art.setArticleImage(oldArticle.getArticleImage());
		}
		
		articleService.updateArticleById(art.getArticleID(), art);
		return "redirect:/articleBack";
	}

	
	//個別文章內容
	@GetMapping("/articleContent/{id}")
	public String getArticleById(@PathVariable Integer id, Model model, HttpSession session) {
		 
		//取得當前登入會員
			Member currentMember = (Member) session.getAttribute("member");
		    model.addAttribute("currentMember", currentMember);
		    //取得文章資料
			Article article = articleService.findArticleById(id);
			model.addAttribute("article", article);
			// XSS
			String unescapedHtml = HtmlUtils.htmlUnescape(article.getArticleContent());
			article.setArticleContent(unescapedHtml);
			//留言數
			int commentCount = commentService.countCommentsByArticleId(id);		
			model.addAttribute("commentCount", commentCount);
			//取得該文章的留言資料
			 List<Comment> comments = commentService.findByArticleId(id);		
			 model.addAttribute("comments", comments);
			// 判斷該會員是否已經點過該篇文章
			 boolean isLiked = false;
			 if (currentMember != null) {
			     List<Member> likedMembers = articleService.getLikedMembers(id);
			     for (Member member : likedMembers) {
			         if (member.getId().equals(currentMember.getId())) {
			             isLiked = true;
			             break;
			         }
			     }
			 }
			    model.addAttribute("isLiked", isLiked);
			 
			return "/forum/article/showArticleContent";
		}
		
		
		
	

///////////////前台//////////////////////////

	// 前台文章列表
	
	@GetMapping("/articleList")
	public String showPageFront(@RequestParam(required = false) String keyword,
            @RequestParam(required = false) Integer categoryId,
            @RequestParam(required = false) String sortBy,
            @RequestParam(name = "p",defaultValue = "0") int pageNumber,
 Model model) {
		

		System.out.println("keyword: " + keyword);
	    System.out.println("categoryId: " + categoryId);
	    System.out.println("sortBy: " + sortBy);
	    System.out.println("pageNumber: " + pageNumber);
	    sortBy = (sortBy != null) ? sortBy : "articleEditTime";
	    
	    Pageable pageable = PageRequest.of(pageNumber, 5);
	    
	    Page<Article> page = articleService.searchByKeywordAndCategory(keyword, categoryId, sortBy, pageable);
    
		// 縮圖
		for (Article art : page) {
			if (art.getArticleImage() != null) {
				String base64 = Base64.getEncoder().encodeToString(art.getArticleImage());
				art.setArticleBase64(base64);
			}
		}
		
		Map<Integer, Integer> commentCounts = new HashMap<>();
		// 預覽文章
		for (Article art : page.getContent()) {
		    Document doc = Jsoup.parse(art.getArticleContent());
		    String articlePreview = doc.text().substring(0, Math.min(doc.text().length(), 20));
		    art.setArticlePreview(articlePreview);
		  //取得該文章的留言數量
			Integer commentCount = commentService.countCommentsByArticleId(art.getArticleID());
			commentCounts.put(art.getArticleID(), commentCount);
		}	
				
				
		model.addAttribute("commentCounts", commentCounts);
		model.addAttribute("page", page);
		//取得類別
		List<ArticleCategory> categoryList = articleCategoryService.findAllArticleCategory();
		model.addAttribute("categoryList", categoryList);
		//最新文章
		Page<Article> latestArticles = articleService.findArticleByPage(1);
		model.addAttribute("latestArticles", latestArticles);
		//熱門文章
		Page<Article> hotsArticles = articleService.findArticleByArticleLikeCountAndPage(1, 5);
		model.addAttribute("hotsArticles", hotsArticles);		
		//人氣文章
				Page<Article> commentsArticles = articleService.findArticleByCommentCountAndPage(1, 5);
				model.addAttribute("commentsArticles", commentsArticles);
		
		return "/forum/article/articleList";
	}
	
	// 前台發文
	@GetMapping("/articleFront/add")
	public String addArticleFront(Model model,HttpSession session, HttpServletRequest request) {
		// 取得當前會員
	    Member currentMember = (Member) session.getAttribute("member");
	    // 如果會員未登入，則將頁面導向登入畫面
	    if (currentMember == null) {
	        // 使用JavaScript顯示提示訊息
	    	 model.addAttribute("contextRoot", request.getContextPath());
	        model.addAttribute("errorMsg", "請先登入會員");
//	        return "redirect:/member/login";  // 先顯示訊息再跳轉至登入頁面
	    }
	
	    model.addAttribute("article", new Article());
	    List<ArticleCategory> categoryList = articleCategoryService.findCategoriesPermissions();
	    model.addAttribute("categoryList", categoryList);

	    return "/forum/article/articleFrontAdd";
	}

	@PostMapping("/articleFront/post")
	public String postArticleFront(@ModelAttribute("article") Article art, @RequestParam("content") String content,
			@RequestParam("imgToByte") MultipartFile file,HttpSession session) throws IOException {

		// 取得當前會員
	    Member currentMember = (Member) session.getAttribute("member");
	    // 如果會員未登入，則將頁面導向登入畫面
	    if (currentMember == null) {
	      
        return "redirect:/member/login";  // 先顯示訊息再跳轉至登入頁面
	    }
	    // 設定發文者為當前會員
	    art.setMember(currentMember);
  
	    
		// XSS
		String escapedHtml = HtmlUtils.htmlEscape(content);
		art.setArticleContent(escapedHtml);
//	    art.setArticleContent(content);
		// 處理圖片上傳
		if (!file.isEmpty()) {
			art.setArticleImage(file.getBytes());
		}else {
		    // 如果上傳的圖片為空，則設定預設圖片
			Path imagePath = Paths.get("src/main/webapp/assetsForFrontend/img/noImage.png");
			byte[] defaultImage = Files.readAllBytes(imagePath);
			art.setArticleImage(defaultImage);
		}

		articleService.addArticle(art);
		return "redirect:/articleList";
	}

	// 前台會員文章管理
	@GetMapping("/articleManage")
	public String findAllArtManage(Model model, HttpSession session, HttpServletRequest request) {
		try {
	        Member currentMember = (Member) session.getAttribute("member");
	        List<Article> findAllArt = articleService.findAllByMember(currentMember.getId());
	        for (Article art : findAllArt) {
	            if (art.getArticleImage() != null) {
	                String base64 = Base64.getEncoder().encodeToString(art.getArticleImage());
	                art.setArticleBase64(base64);
	            }
	        }
	        model.addAttribute("artList", findAllArt);
	        return "/forum/article/articleManage";
	    } catch (NullPointerException e) {
	        // 添加錯誤訊息到model中
	        model.addAttribute("errorMsg", "請先登入會員");
	        return "/forum/article/articleManage";
	    }
	}
	@DeleteMapping("/articleManage/delete")
	public String deleteArticleManage(@RequestParam Integer id) {
		articleService.deleteArticleById(id);
		return "redirect:/articleManage";
	}

	@GetMapping("/articleManage/edit")
	public String editArticleMange(@RequestParam("id") Integer id, Model model){
		Article art = articleService.findArticleById(id);
		 List<ArticleCategory> categoryList = articleCategoryService.findCategoriesPermissions();
		    model.addAttribute("categoryList", categoryList);
		model.addAttribute("art", art);		
		
		// 取得圖片資訊
	    byte[] imageData = art.getArticleImage();
	    if (imageData != null) {
	        String base64Image = Base64.getEncoder().encodeToString(imageData);
	        model.addAttribute("imageData", base64Image);
	    }
		
		//XSS
				String unescapedHtml = HtmlUtils.htmlUnescape(art.getArticleContent());
				model.addAttribute("articleContent", unescapedHtml);
//	    model.addAttribute("articleContent",art.getArticleContent());
		return "/forum/article/articleFrontEdit";
	}

	@PutMapping("/articleManage/edit")
	public String putEditArticleMange(@ModelAttribute("art") Article art,
			@RequestParam("articleContent") String content,
			@RequestParam("imgToByte") MultipartFile file)throws IOException {
		// XSS
				String escapedHtml = HtmlUtils.htmlEscape(content);
				art.setArticleContent(escapedHtml);
//				art.setArticleContent(content);
		 art.setArticleContent(content);
				// 處理圖片上傳
				if (!file.isEmpty()) {
					art.setArticleImage(file.getBytes());
				}else {
					// 若使用者沒有選擇要上傳圖片，就使用舊的圖片資料更新回資料庫中
			        Article oldArticle = articleService.findArticleById(art.getArticleID());
			        art.setArticleImage(oldArticle.getArticleImage());
				}
				
				articleService.updateArticleById(art.getArticleID(), art);
		return "redirect:/articleManage";
	}
	@GetMapping("/articleCollect")
	public String findAllArtCollect(Model model, HttpSession session, HttpServletRequest request) {
		try {
	        Member currentMember = (Member) session.getAttribute("member");
	        List<Article> findAllArt = articleService.getLikedArticlesByMemberId(currentMember.getId());
	        for (Article art : findAllArt) {
	            if (art.getArticleImage() != null) {
	                String base64 = Base64.getEncoder().encodeToString(art.getArticleImage());
	                art.setArticleBase64(base64);
	            }
	        }
	        model.addAttribute("artList", findAllArt);
	        return "/forum/article/articleCollect";
	    } catch (NullPointerException e) {
	        // 添加錯誤訊息到model中
	        model.addAttribute("errorMsg", "請先登入會員");
	        return "/forum/article/articleCollect";
	    }
	}
	
	
///////////////////點讚系統////////////////
	@ResponseBody
	@PostMapping("/showArticleContent/{articleID}/like")
	public String like(@PathVariable("articleID") Integer articleID, HttpSession session,Model model) {
		 Member currentMember = (Member) session.getAttribute("member");
    try {
    	 boolean isLiked = articleService.addLike(articleID, currentMember.getId());
         model.addAttribute("isLiked", isLiked);
	    } catch (Exception e) {
	        // 處理重複點讚的錯誤
	        e.printStackTrace();
	        String errorMessage = "已經點過讚了!!";
	        model.addAttribute("errorMessage", errorMessage);
	        
	    }
    Article article = articleService.findArticleById(articleID);
    model.addAttribute("article", article);
 
	    return "redirect:/showArticleContent/" + articleID;
	}
	
	@ResponseBody
	@PostMapping("/showArticleContent/{articleID}/unlike")
	public String unlike(@PathVariable("articleID") Integer articleID, HttpSession session) {
		 Member currentMember = (Member) session.getAttribute("member");
		 if (currentMember == null) {
		        // 如果會員未登入，返回錯誤訊息
		        return "error: 會員未登入";
		    }

	    try {
	    	articleService.cancelLike(articleID,currentMember.getId());
	    } catch (Exception e) {
	        // 處理未點過讚的錯誤
	        e.printStackTrace();
	    }

	    return "redirect:/showArticleContent/" + articleID;
	}
	//檢查會員是否登入
	@ResponseBody
	@GetMapping("/checkLogin")
	public String checkLogin(HttpSession session) {
	    Member currentMember = (Member) session.getAttribute("member");
	    if (currentMember == null) {
	        return "false";
	    } else {
	        return "true";
	    }
	}
	

}
