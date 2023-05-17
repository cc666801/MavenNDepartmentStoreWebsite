package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.forum;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum.Comment;

public interface CommentRepository extends JpaRepository<Comment, Integer> {
	
	//對應文章ID
	List<Comment> findByArticleArticleID(Integer articleId);
	
	//計算文章留言數量
	@Query("SELECT COUNT(c) FROM Comment c WHERE c.article.id = :id")
    int countByArticleId(@Param("id") int articleId);
}
