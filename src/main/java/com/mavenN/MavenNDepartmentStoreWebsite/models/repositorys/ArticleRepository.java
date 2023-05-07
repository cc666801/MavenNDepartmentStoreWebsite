package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum.Article;

public interface ArticleRepository extends JpaRepository<Article, Integer>  {
	List<Article> findAllByMemberId(Integer memberId);
	
	 Page<Article> findByArticleCategory_articleCategoryID(Integer categoryId, Pageable pageable);
	
	 
//	// 按照文章点赞数排序
//	 @Query("SELECT a, COUNT(al) FROM Article a LEFT JOIN a.articleLikes al GROUP BY a.articleID ORDER BY COUNT(al) DESC")
//	    Page<Object[]> findArticlesOrderByArticleLikesCount(Pageable pageable);
//
//	 // 按照文章评论数排序
//	    @Query("SELECT a, COUNT(c) FROM Article a LEFT JOIN a.comments c GROUP BY a.articleID ORDER BY COUNT(c) DESC")
//	    Page<Object[]> findArticlesOrderByCommentsCount(Pageable pageable);
	 
	 
	
}
