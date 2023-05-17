package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.forum;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum.Article;

public interface ArticleRepository extends JpaRepository<Article, Integer> {
	List<Article> findAllByMemberId(Integer memberId);

	Page<Article> findByArticleCategory_articleCategoryID(Integer categoryId, Pageable pageable);

	@Query("select a from Article a where lower(a.articleTitle) like %:keyword%")
	Page<Article> findByTitleContainingIgnoreCase(@Param("keyword") String keyword, Pageable pageable);

	// 以 articleTitle 搜尋，並以 articleEditTime, articleLikeCount, commentCount,
	// commentEditTime 排序

	Page<Article> findByArticleTitleContainingOrderByArticleEditTimeDesc(String articleTitle, Pageable pageable);

	Page<Article> findByArticleTitleContainingOrderByArticleLikeCountDesc(String articleTitle, Pageable pageable);

	Page<Article> findByArticleTitleContainingOrderByCommentCountDesc(String articleTitle, Pageable pageable);

	Page<Article> findByArticleTitleContainingOrderByComments_CommentEditTimeDesc(String articleTitle,
			Pageable pageable);

	// 以 articleCategoryID 搜尋，並以 articleEditTime, articleLikeCount, commentCount,
	// commentEditTime 排序

	Page<Article> findByArticleCategoryArticleCategoryIDOrderByArticleEditTimeDesc(Integer articleCategoryID,
			Pageable pageable);

	Page<Article> findByArticleCategoryArticleCategoryIDOrderByArticleLikeCountDesc(Integer articleCategoryID,
			Pageable pageable);

	Page<Article> findByArticleCategoryArticleCategoryIDOrderByCommentCountDesc(Integer articleCategoryID,
			Pageable pageable);

	Page<Article> findByArticleCategoryArticleCategoryIDOrderByComments_CommentEditTimeDesc(Integer articleCategoryID,
			Pageable pageable);

	// 以 articleTitle 和 articleCategoryID 同時篩選，並以 articleEditTime, articleLikeCount,
	// commentCount, commentEditTime 排序

	Page<Article> findByArticleTitleContainingAndArticleCategoryArticleCategoryIDOrderByArticleEditTimeDesc(
			String articleTitle, Integer articleCategoryID, Pageable pageable);

	Page<Article> findByArticleTitleContainingAndArticleCategoryArticleCategoryIDOrderByArticleLikeCountDesc(
			String articleTitle, Integer articleCategoryID, Pageable pageable);

	Page<Article> findByArticleTitleContainingAndArticleCategoryArticleCategoryIDOrderByCommentCountDesc(
			String articleTitle, Integer articleCategoryID, Pageable pageable);

	Page<Article> findByArticleTitleContainingAndArticleCategoryArticleCategoryIDOrderByComments_CommentEditTimeDesc(
			String articleTitle, Integer articleCategoryID, Pageable pageable);
	
	// 根据文章编辑时间降序排序
	Page<Article> findAllByOrderByArticleEditTimeDesc(Pageable pageable);

	// 根据文章点赞数降序排序
	Page<Article> findAllByOrderByArticleLikeCountDesc(Pageable pageable);

	// 根据评论数量降序排序
	Page<Article> findAllByOrderByCommentCountDesc(Pageable pageable);

	// 根据评论编辑时间降序排序
	Page<Article> findAllByOrderByComments_CommentEditTimeDesc(Pageable pageable);
}
