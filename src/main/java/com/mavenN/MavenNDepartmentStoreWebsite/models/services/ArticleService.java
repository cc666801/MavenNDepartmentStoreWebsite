package com.mavenN.MavenNDepartmentStoreWebsite.models.services;


import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum.Article;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum.ArticleLike;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum.ArticleLikeId;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.ArticleLikeRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.ArticleRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.memberSystem.MemberRepository;

@Service
public class ArticleService {
 
	@Autowired
	private ArticleRepository articleRepository;
	
	@Autowired
    private ArticleLikeRepository articleLikeRepository;
	  
	@Autowired
    private MemberRepository memberRepository;
	
	public void addArticle(Article article) {
		articleRepository.save(article);
	}
	
	
	public Article findArticleById(Integer id) {
		Optional<Article> option =articleRepository.findById(id);
		
		if(option.isEmpty()) {
			return null;
		}
		
		return option.get();
	}
	
	public Page<Article> findArticleByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1, 5, Sort.Direction.DESC, "articleCreateTime");
		Page<Article> page = articleRepository.findAll(pgb);
		return page;
	}
	
	@Transactional
	public Article updateArticleById(Integer id,Article newArticle) {
		Optional<Article> option = articleRepository.findById(id);
		
		if(option.isPresent()) {
			Article art = option.get();
			art.setArticleContent(newArticle.getArticleContent());
			art.setArticleEditTime(newArticle.getArticleEditTime());  
			art.setArticleCategory(newArticle.getArticleCategory());
			art.setArticleTitle(newArticle.getArticleTitle());
			art.setArticleImage(newArticle.getArticleImage());
			return art;
		}
		return null;
	}
	
	public void deleteArticleById(Integer id) {
		articleRepository.deleteById(id);
	}
	
	public List<Article> findAllArticle(){
		List<Article> findAllArticle=articleRepository.findAll();
		return findAllArticle;
	}
	
	
	public List<Article> findAllByMember(Integer memberId) {
        return articleRepository.findAllByMemberId(memberId);
    }
	
	
	public Page<Article> findArticleByCategoryAndPage(Integer categoryId, Integer pageNumber) {
        Pageable pageable = PageRequest.of(pageNumber - 1,5, Sort.Direction.DESC, "articleCreateTime");
        return articleRepository.findByArticleCategory_articleCategoryID(categoryId, pageable);
    }
	
	///////////////////點讚系統////////////////////
	 // 當會員點讚時，將點讚紀錄新增到資料庫
	public boolean addLike(Integer articleId, Integer memberId) throws Exception {
	    Optional<Article> optionalArticle = articleRepository.findById(articleId);
	    Optional<Member> optionalMember = memberRepository.findById(memberId);

	    if (!optionalArticle.isPresent() || !optionalMember.isPresent()) {
	        throw new Exception("文章或會員不存在");
	    }

	    Article article = optionalArticle.get();
	    Member member = optionalMember.get();

	    Optional<ArticleLike> optionalArticleLike = articleLikeRepository.findById_ArticleAndId_Member(article, member);
	    if (optionalArticleLike.isPresent()) {
	        throw new Exception("已經點過讚了");
	    }

	    ArticleLikeId articleLikeId = new ArticleLikeId();
	    articleLikeId.setArticle(article);
	    articleLikeId.setMember(member);
	        
	    ArticleLike articleLike = new ArticleLike();
	    articleLike.setId(articleLikeId);

	    boolean isLiked = false;
	    ArticleLike savedArticleLike = articleLikeRepository.save(articleLike);
	    if (savedArticleLike != null) {
	    	 isLiked = true;
	    	    article.setLiked(true);
	    }

	    article.setLiked(isLiked);
	    articleRepository.save(article);
	    return isLiked;
	}

    // 當會員取消點讚時，將該點讚紀錄從資料庫中刪除
	public void cancelLike(Integer articleId, Integer memberId) {
	    Optional<Article> optionalArticle = articleRepository.findById(articleId);
	    Optional<Member> optionalMember = memberRepository.findById(memberId);

	    if (!optionalArticle.isPresent() || !optionalMember.isPresent()) {
	        return;
	    }

	    Article article = optionalArticle.get();
	    Member member = optionalMember.get();

	    Optional<ArticleLike> optionalArticleLike = articleLikeRepository.findById_ArticleAndId_Member(article, member);
	    if (!optionalArticleLike.isPresent()) {
	        return;
	    }

	    ArticleLike articleLike = optionalArticleLike.get();
	    articleLikeRepository.delete(articleLike);
	}

    // 取得某篇文章的所有點讚紀錄
	public List<Member> getLikedMembers(Integer articleID) {
	    Optional<Article> optionalArticle = articleRepository.findById(articleID);

	    if (!optionalArticle.isPresent()) {
	        return Collections.emptyList();
	    }

	    Article article = optionalArticle.get();
	    List<ArticleLike> articleLikes = articleLikeRepository.findById_Article(article);
	    List<Member> likedMembers = new ArrayList<>();
	    for (ArticleLike articleLike : articleLikes) {
	        likedMembers.add(articleLike.getId().getMember());
	    }
	    return likedMembers;
	}
	
	
}
