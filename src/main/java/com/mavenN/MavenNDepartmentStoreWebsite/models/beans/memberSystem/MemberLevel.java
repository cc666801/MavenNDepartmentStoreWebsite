package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "memberLevel")
public class MemberLevel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "member_ID")
    private Integer memberId;

    @OneToOne
    @JoinColumn(name = "fk_member_Account")
    private MemberSystem memberSystem;

    @Column(name = "member_Level")
    private String memberLevel;

    @Column(name = "member_Spend")
    private Double memberSpend;

    @Column(name = "member_Name")
    private String memberName;

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public MemberSystem getMemberSystem() {
		return memberSystem;
	}

	public void setMemberSystem(MemberSystem memberSystem) {
		this.memberSystem = memberSystem;
	}

	public String getMemberLevel() {
		return memberLevel;
	}

	public void setMemberLevel(String memberLevel) {
		this.memberLevel = memberLevel;
	}

	public Double getMemberSpend() {
		return memberSpend;
	}

	public void setMemberSpend(Double memberSpend) {
		this.memberSpend = memberSpend;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
}