package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.Formula;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;

@Entity
@Table(name = "article")
public class Article {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "article_id")
	private Integer articleID;

	@Column(name = "title", nullable = false)
	private String articleTitle;
	
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id")
    private Member member;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "article_category_id")
	private ArticleCategory articleCategory;

	@OneToMany(mappedBy = "id.article", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<ArticleLike> articleLikes = new HashSet<>();

	 @OneToMany(mappedBy = "article")
	    private List<Comment> comments;
	
	@Column(name = "article_content", columnDefinition = "nvarchar(MAX)", nullable = false)
	private String articleContent;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "article_createTime", nullable = false)
	private Date articleCreateTime;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "article_editTime", nullable = false)
	private Date articleEditTime;

	@PrePersist
	protected void onCreate() {
		articleCreateTime = new Date();
		articleEditTime = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		articleEditTime = new Date();
	}
	
	@Column(name = "article_image", columnDefinition = "varbinary(MAX)")
	 private byte[] articleImage;
	
	@Transient
	private String articlePreview;
	
	@Transient
	private MultipartFile imgToByte;
	
	@Transient
	private String articleBase64;
	
	
	 @Transient
	    private boolean liked;

	    public boolean isLiked() {
	        return liked;
	    }
	    
	  @Formula("(select count(*) from articleLike al where al.article_id = article_id)")
	    private int articleLikeCount;
	  
	    @Formula("(SELECT COUNT(*) FROM comment c WHERE c.article_id = article_id)")
	    private int commentCount;


	public void setLiked(boolean liked) {
			this.liked = liked;
		}

	public Article() {

	}

	public Integer getArticleID() {
		return articleID;
	}

	public void setArticleID(Integer articleID) {
		this.articleID = articleID;
	}

	public String getArticleTitle() {
		return articleTitle;
	}

	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}

	

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public ArticleCategory getArticleCategory() {
		return articleCategory;
	}

	public void setArticleCategory(ArticleCategory articleCategory) {
		this.articleCategory = articleCategory;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public String getArticleContent() {
		return articleContent;
	}

	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}

	public Date getArticleCreateTime() {
		return articleCreateTime;
	}

	public void setArticleCreateTime(Date articleCreateTime) {
		this.articleCreateTime = articleCreateTime;
	}

	public Date getArticleEditTime() {
		return articleEditTime;
	}

	public void setArticleEditTime(Date articleEditTime) {
		this.articleEditTime = articleEditTime;
	}

	public Set<ArticleLike> getArticleLikes() {
		return articleLikes;
	}

	public void setArticleLikes(Set<ArticleLike> articleLikes) {
		this.articleLikes = articleLikes;
	}

	

	public String getArticlePreview() {
		return articlePreview;
	}

	public void setArticlePreview(String articlePreview) {
		this.articlePreview = articlePreview;
	}

	public String getArticleBase64() {
		return articleBase64;
	}

	public void setArticleBase64(String articleBase64) {
		this.articleBase64 = articleBase64;
	}

	public byte[] getArticleImage() {
		return articleImage;
	}

	public void setArticleImage(byte[] articleImage) {
		this.articleImage = articleImage;
	}

	public MultipartFile getImgToByte() {
		return imgToByte;
	}

	public void setImgToByte(MultipartFile imgToByte) {
		this.imgToByte = imgToByte;
	}

	
}
