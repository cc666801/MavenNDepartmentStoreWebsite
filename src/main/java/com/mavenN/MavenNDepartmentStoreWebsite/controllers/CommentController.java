package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum.Comment;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.CommentService;

@Controller
public class CommentController {
	
	 @Autowired
	    private CommentService commentService;
	    
	    @Autowired
	    private MemberService memberService;
	
	    @PostMapping("/articleContent/{id}/comment")
	    public String addComment(@PathVariable Integer id, @RequestParam("commentContent") String content, HttpSession session) {
	        Member member = (Member) session.getAttribute("member");
	        Comment comment = new Comment();
	        comment.setArticleID(id);
	        comment.setCommentContent(content);
	        comment.setMemberID(member.getMemberID());
	        commentService.saveComment(comment);
	        return "redirect:/articleContent/" + id;
	    }
}
