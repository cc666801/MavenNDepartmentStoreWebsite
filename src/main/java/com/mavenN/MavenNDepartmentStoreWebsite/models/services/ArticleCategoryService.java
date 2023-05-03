package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum.ArticleCategory;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.ArticleCategoryRepository;

@Service
public class ArticleCategoryService {
	@Autowired
	private ArticleCategoryRepository articleCategoryRepository;
	
	public void addArticleCategory(ArticleCategory artCate) {
		articleCategoryRepository.save(artCate);
	}
	
	public List<ArticleCategory> findAllArticleCategory(){
		List<ArticleCategory> findAllArticleCategory=articleCategoryRepository.findAll();
		return findAllArticleCategory;
	}
	
	public ArticleCategory findArticleCategoryById(Integer id) {
		Optional<ArticleCategory> option =articleCategoryRepository.findById(id);
		
		if(option.isEmpty()) {
			return null;
		}
		
		return option.get();
	}
	
	
	public void deleteArticleCategoryById(Integer id) {
		articleCategoryRepository.deleteById(id);
	}
	
	@Transactional
	public ArticleCategory updateArticleCategoryById(Integer id,ArticleCategory artCate) {
		Optional<ArticleCategory> option = articleCategoryRepository.findById(id);
		
		if(option.isPresent()) {
			ArticleCategory art = option.get();
			art.setArticleCategoryName(artCate.getArticleCategoryName());
			
			return art;
		}
		return null;
	}
	
	public List<ArticleCategory> findCategoriesPermissions() {
        return articleCategoryRepository.findByArticleCategoryPermissions(1);
    }
	
}
