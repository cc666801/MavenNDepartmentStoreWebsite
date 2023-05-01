package com.mavenN.MavenNDepartmentStoreWebsite.models.services;


import java.util.ArrayList;
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
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum.fakemember;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.ArticleLikeRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.ArticleRepository;

@Service
public class ArticleService {
 
	@Autowired
	private ArticleRepository articleRepository;
	
	@Autowired
    private ArticleLikeRepository articleLikeRepository;
	
//	  @Autowired
//	    private ArticleLikeRepository articleLikeRepository;
//	  
//	  @Autowired
//	    private fakeMemberRepository fakeMemberRepository ;
	
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
	
	
	
	///////////////////點讚系統////////////////////
	// 當會員點讚時，將點讚紀錄新增到資料庫
    public void addLike(Integer articleId, Integer memberId) throws Exception {
        Optional<ArticleLike> optionalArticleLike = articleLikeRepository.findByArticleIdAndMemberId(articleId, memberId);
        if (optionalArticleLike.isPresent()) {
            throw new Exception("已經點過讚了");
        }

        ArticleLikeId articleLikeId = new ArticleLikeId();
        Article article = new Article();
        article.setArticleID(articleId);
        articleLikeId.setArticle(article);
        fakemember member = new fakemember();
        member.setMemberId(memberId);
        articleLikeId.setMember(member);
        
        ArticleLike articleLike = new ArticleLike();
        articleLike.setId(articleLikeId);

        articleLikeRepository.save(articleLike);
    }

    // 當會員取消點讚時，將該點讚紀錄從資料庫中刪除
    public void cancelLike(Integer articleId, Integer memberId) throws Exception {
        Optional<ArticleLike> optionalArticleLike = articleLikeRepository.findByArticleIdAndMemberId(articleId, memberId);
        if (!optionalArticleLike.isPresent()) {
            throw new Exception("沒有點過讚");
        }

        ArticleLike articleLike = optionalArticleLike.get();
        articleLikeRepository.delete(articleLike);
    }

    // 取得某篇文章的所有點讚紀錄
    public List<fakemember> getLikedMembers(Integer articleId) {
    	List<ArticleLike> articleLikes = articleLikeRepository.findByArticleId(articleId);
        List<fakemember> likedMembers = new ArrayList<>();
        for (ArticleLike articleLike : articleLikes) {
            likedMembers.add(articleLike.getId().getMember());
        }
        return likedMembers;
    }
	
	
	
}
