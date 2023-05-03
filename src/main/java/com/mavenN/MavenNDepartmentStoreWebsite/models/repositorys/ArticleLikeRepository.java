package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum.ArticleLike;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum.ArticleLikeId;

public interface ArticleLikeRepository  extends JpaRepository<ArticleLike, ArticleLikeId>{
//	 // 透過文章id及會員id查詢點讚紀錄
//    Optional<ArticleLike> findByArticleIdAndMemberId(Integer articleId, Integer memberId);
//    
//    // 透過文章id查詢該文章的所有點讚紀錄
//    List<ArticleLike> findByIdArticle_Id(Integer articleId); 
	
}
