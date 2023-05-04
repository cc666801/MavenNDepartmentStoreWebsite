package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.HtmlUtils;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum.Article;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum.Comment;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.ArticleService;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.CommentService;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.MemberService;

@Controller
public class CommentController {
	
	@Autowired
    private ArticleService articleService;
	
	 @Autowired
	    private CommentService commentService;
	    
	    @Autowired
	    private MemberService memberService;
	
	    @PostMapping("/showArticleContent/{id}/comment")
	    public String addComment(@PathVariable Integer id, @RequestParam("commentContent") String content, HttpSession session) {
	    	Member member = (Member) session.getAttribute("member");
	        Comment comment = new Comment();
	        comment.setCommentContent(content);
	        comment.setMember(member);
	        Article article = articleService.findArticleById(id);
	        comment.setArticle(article);
	        commentService.addComment(comment);
	        return "redirect:/articleContent/" + id;
	    }
	    
	    
	    
	    @DeleteMapping("showArticleContent/{id}/commentDelete")
		public  String deleteComment(@RequestParam Integer commentID,@PathVariable Integer id) {
			commentService.deleteCommentById(commentID);
			 return "redirect:/articleContent/" + id;
		}
	    
	    
	    @PutMapping("showArticleContent/{articleId}/commentEdit/{commentId}")
	    public String putEditComment(@PathVariable Integer articleId, @PathVariable Integer commentId, @RequestParam String commentContent) {
	        // XSS
	        String escapedHtml = HtmlUtils.htmlEscape(commentContent);
	        
	        Comment newComment = new Comment();
	        newComment.setCommentContent(escapedHtml);
	        
	        
	        commentService.updateCommentById(commentId, newComment);
	        
	        
	        
	        return "redirect:/articleContent/" + articleId;
	    }
	    
	    
	    
}
