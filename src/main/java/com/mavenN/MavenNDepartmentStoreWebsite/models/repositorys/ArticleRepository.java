package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.customerService.LostAndFound;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum.Article;

public interface ArticleRepository extends JpaRepository<Article, Integer>  {

	
	
}
