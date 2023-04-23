package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "memberFavorite")
public class MemberFavorite {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "member_FavoriteID")
    private Integer memberFavoriteId;

    @Column(name = "comm_ID")
    private Integer commId;

    @ManyToOne
    @JoinColumn(name = "member_Account")
    private MemberSystem memberSystem;

	public Integer getMemberFavoriteId() {
		return memberFavoriteId;
	}

	public void setMemberFavoriteId(Integer memberFavoriteId) {
		this.memberFavoriteId = memberFavoriteId;
	}

	public Integer getCommId() {
		return commId;
	}

	public void setCommId(Integer commId) {
		this.commId = commId;
	}

	public MemberSystem getMemberSystem() {
		return memberSystem;
	}

	public void setMemberSystem(MemberSystem memberSystem) {
		this.memberSystem = memberSystem;
	}
}
