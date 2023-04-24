package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="Article")
public class Article {

	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="article_id")
	private Integer articleID;
	
	@Column(name="title")
	private String title;
	@Column(name="member_id")
	private String memberID;
	
	@Column(name="category_id")
	private String categoryID;
	
	@Column(name="article_content", columnDefinition = "nvarchar(MAX)")
	private String articleContent;
	
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name="article_createTime")
	private Date createTime;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name="article_editTime")
	private Date editTime;
	
	 @PrePersist
	 protected void onCreate() {
	       createTime = new Date();
	       editTime = new Date();
	 }

	 
	 @PreUpdate
	 protected void onUpdate() {
	        editTime = new Date();	      
	 }
	
	public Article() {
		
	}


	public Integer getArticleID() {
		return articleID;
	}


	public void setArticleID(Integer articleID) {
		this.articleID = articleID;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getMemberID() {
		return memberID;
	}


	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}


	public String getCategoryID() {
		return categoryID;
	}


	public void setCategoryID(String categoryID) {
		this.categoryID = categoryID;
	}


	public String getArticleContent() {
		return articleContent;
	}


	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}


	public Date getCreateTime() {
		return createTime;
	}


	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}


	public Date getEditTime() {
		return editTime;
	}


	public void setEditTime(Date editTime) {
		this.editTime = editTime;
	}
	
	
	
	
}
