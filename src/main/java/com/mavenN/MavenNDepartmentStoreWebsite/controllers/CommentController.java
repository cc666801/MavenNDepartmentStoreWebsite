package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import org.springframework.stereotype.Controller;

@Controller
public class CommentController {
	
//	 @Autowired
//	    private CommentService commentService;
//	    
//	    @Autowired
//	    private MemberService memberService;
//	
//	    @PostMapping("/articleContent/{id}/comment")
//	    public String addComment(@PathVariable Integer id, @RequestParam("commentContent") String content, HttpSession session) {
//	        Member member = (Member) session.getAttribute("member");
//	        Comment comment = new Comment();
//	        comment.setArticleID(id);
//	        comment.setCommentContent(content);
//	        comment.setMemberID(member.getMemberID());
//	        commentService.saveComment(comment);
//	        return "redirect:/articleContent/" + id;
//	    }
}
