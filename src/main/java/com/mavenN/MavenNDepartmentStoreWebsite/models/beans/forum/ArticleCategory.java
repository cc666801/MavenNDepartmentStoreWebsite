package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;



@Entity
@Table(name="article_category")
public class ArticleCategory {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="category_id")
	private Integer articleCategoryID;
	
	
	@Column(name="category_name" ,nullable = false, unique=true)
	private String articleCategoryName;
	
	@OneToMany(mappedBy = "articleCategory", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Article> articles = new ArrayList<>();

		
	
	public ArticleCategory() {		
	}

	public Integer getArticleCategoryID() {
		return articleCategoryID;
	}

	public void setArticleCategoryID(Integer articleCategoryID) {
		this.articleCategoryID = articleCategoryID;
	}

	public String getArticleCategoryName() {
		return articleCategoryName;
	}

	public void setArticleCategoryName(String articleCategoryName) {
		this.articleCategoryName = articleCategoryName;
	}

	public List<Article> getArticles() {
		return articles;
	}

	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}
	
	
	
	
}
