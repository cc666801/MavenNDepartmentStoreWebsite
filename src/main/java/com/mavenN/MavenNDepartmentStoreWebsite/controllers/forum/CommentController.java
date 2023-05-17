package com.mavenN.MavenNDepartmentStoreWebsite.controllers.forum;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum.Article;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum.Comment;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.MemberService;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.forum.ArticleService;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.forum.CommentService;

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
	    
	    
	    
	    
	    
//	 // 更新留言
//	    @PutMapping("showArticleContent/{id}/commentEdit")
//	    public String putEditComment(@PathVariable Integer commentID,  @ModelAttribute("comment") Comment editedComment,@PathVariable Integer id) {
//	        // XSS
//	        String escapedHtml = HtmlUtils.htmlEscape(editedComment.getCommentContent());
//	      
//	        // update the edited comment
//	        editedComment.setCommentContent(escapedHtml);
//	        commentService.updateCommentById(commentID, editedComment);
//	       
//	        return "redirect:/articleContent/"+id;
//	    }
	    
	    
	 // 更新留言
	    @PostMapping("showArticleContent/{id}/commentEdit")
		public String putEditArticle(@ModelAttribute("comment") Comment comment, @RequestParam("commentID") Integer commentID, @RequestParam("commentContent") String content,@PathVariable Integer id) {			
	    	 comment.setCommentID(commentID);
	    	comment.setCommentContent(content);		
			commentService.updateCommentById(commentID, comment);
			return "redirect:/articleContent/"+ id ;
		}
	    
	    
}
