package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

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
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.ArticleLikeRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.ArticleRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.fakeMemberRepository;

@Service
public class ArticleService {
 
	@Autowired
	private ArticleRepository articleRepository;
	
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
	
}
