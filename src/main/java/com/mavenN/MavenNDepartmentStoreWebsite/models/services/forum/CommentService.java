package com.mavenN.MavenNDepartmentStoreWebsite.models.services.forum;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum.Comment;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.forum.ArticleRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.forum.CommentRepository;

@Service
public class CommentService {

	@Autowired
	private ArticleRepository articleRepository;
	
	@Autowired
	private CommentRepository commentRepository;
	
	
	
	public void addComment(Comment comment) {
		commentRepository.save(comment);
	}
	
	
	public Comment findCommentById(Integer id) {
		Optional<Comment> option =commentRepository.findById(id);
		
		if(option.isEmpty()) {
			return null;
		}
		
		return option.get();
	}
	
	public Page<Comment> findCommentByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1, 5, Sort.Direction.DESC, "commentCreateTime");
		Page<Comment> page = commentRepository.findAll(pgb);
		return page;
	}

	@Transactional
	public Comment updateCommentById(Integer id,Comment newComment) {
		Optional<Comment> option = commentRepository.findById(id);
		
		if(option.isPresent()) {
			Comment com = option.get();
			com.setCommentContent(newComment.getCommentContent());
			com.setCommentEditTime(newComment.getCommentEditTime());  
			
			return com;
		}
		return null;
	}
	
	public void deleteCommentById(Integer id) {
		commentRepository.deleteById(id);
	}
	
	public List<Comment> findAllComment(){
		List<Comment> findAllComment=commentRepository.findAll();
		return findAllComment;
	}
	
	public List<Comment> findByArticleId(Integer articleId) {
	    return commentRepository.findByArticleArticleID(articleId);
	}
	
	public int countCommentsByArticleId(int articleId) {
        return commentRepository.countByArticleId(articleId);
    }
	
}
