package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "articleLike")
public class ArticleLike {


	@EmbeddedId
	private ArticleLikeId id;
	
	public ArticleLike() {
	}

	public ArticleLikeId getId() {
		return id;
	}

	public void setId(ArticleLikeId id) {
		this.id = id;
	}

}
