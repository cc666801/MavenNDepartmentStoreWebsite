package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum.ArticleCategory;

public interface ArticleCategoryRepository extends JpaRepository<ArticleCategory, Integer> {

}
