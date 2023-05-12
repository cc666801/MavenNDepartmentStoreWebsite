package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum.Article;

public interface ArticleRepository extends JpaRepository<Article, Integer>  {
	List<Article> findAllByMemberId(Integer memberId);
		
	
	 Page<Article> findByArticleCategory_articleCategoryID(Integer categoryId, Pageable pageable);
	
	 @Query("select a from Article a where lower(a.articleTitle) like %:keyword%")
	    Page<Article> findByTitleContainingIgnoreCase(@Param("keyword") String keyword, Pageable pageable);
	
	 
	 
	
}
