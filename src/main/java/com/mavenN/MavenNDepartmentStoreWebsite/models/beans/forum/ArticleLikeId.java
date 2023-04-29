package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Embeddable
public class ArticleLikeId implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "article_id")
	private Article article;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "member_id")
	private fakemember member;
  
	public ArticleLikeId() {
	}

	public ArticleLikeId(Article article, fakemember member) {
		this.article = article;
		this.member = member;
	}

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public fakemember getMember() {
		return member;
	}

	public void setMember(fakemember member) {
		this.member = member;
	}
	
 }



