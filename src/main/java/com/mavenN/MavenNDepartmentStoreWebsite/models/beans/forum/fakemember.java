package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.forum;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="member")
public class fakemember {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="member_id")
    private Integer memberId;

    @Column(name="member_name")
    private String memberName;

    @OneToMany(mappedBy = "id.member")
    private List<ArticleLike> articleLikes;

	
	public fakemember() {
		
	}

}
