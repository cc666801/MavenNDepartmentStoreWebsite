package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "comment")
public class Comment {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "comment_id")
	private Integer commentID;
	

	@Column(name = "comment_content")
	private String commentContent;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "article_id")
    private Article article;
	
	
	@Column(name = "member_id")
	private String memberID;
	
	
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "comment_createTime", nullable = false)
	private Date commentCreateTime;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "comment_editTime", nullable = false)
	private Date commentEditTime;

	@PrePersist
	protected void onCreate() {
		commentCreateTime = new Date();
		commentEditTime = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		commentEditTime = new Date();
	}
	

	
	public Comment() {
		// TODO Auto-generated constructor stub
	}

	public Integer getCommentID() {
		return commentID;
	}

	public void setCommentID(Integer commentID) {
		this.commentID = commentID;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public String getMemberID() {
		return memberID;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}

	public Date getCommentCreateTime() {
		return commentCreateTime;
	}

	public void setCommentCreateTime(Date commentCreateTime) {
		this.commentCreateTime = commentCreateTime;
	}

	public Date getCommentEditTime() {
		return commentEditTime;
	}

	public void setCommentEditTime(Date commentEditTime) {
		this.commentEditTime = commentEditTime;
	}

	
	
	
}
