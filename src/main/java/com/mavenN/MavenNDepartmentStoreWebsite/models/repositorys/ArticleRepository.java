package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum.Article;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;

public interface ArticleRepository extends JpaRepository<Article, Integer>  {
	List<Article> findAllByMemberId(Integer memberId);
	
	
}
