package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;

@Embeddable
public class ArticleLikeId implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "article_id")
	private Article article;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "member_id")
	private Member member;
  
	public ArticleLikeId() {
	}

	public ArticleLikeId(Article article, Member member) {
		this.article = article;
		this.member = member;
	}

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	
	
 }



