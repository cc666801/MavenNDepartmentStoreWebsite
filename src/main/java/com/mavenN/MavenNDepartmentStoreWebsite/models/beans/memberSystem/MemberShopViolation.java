package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "memberShopViolation")
public class MemberShopViolation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "member_ShopViolationID")
    private Integer memberShopViolationId;

    @ManyToOne
    @JoinColumn(name = "member_Account")
    private MemberSystem memberSystem;

    @Column(name = "member_Name")
    private String memberName;

    @Column(name = "member_ShopViolationCause")
    private String memberShopViolationCause;

    @Column(name = "member_Punishment")
    private String memberPunishment;

    @Column(name = "member_PunishmentDate")
    private Date memberPunishmentDate;

	public Integer getMemberShopViolationId() {
		return memberShopViolationId;
	}

	public void setMemberShopViolationId(Integer memberShopViolationId) {
		this.memberShopViolationId = memberShopViolationId;
	}

	public MemberSystem getMemberSystem() {
		return memberSystem;
	}

	public void setMemberSystem(MemberSystem memberSystem) {
		this.memberSystem = memberSystem;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberShopViolationCause() {
		return memberShopViolationCause;
	}

	public void setMemberShopViolationCause(String memberShopViolationCause) {
		this.memberShopViolationCause = memberShopViolationCause;
	}

	public String getMemberPunishment() {
		return memberPunishment;
	}

	public void setMemberPunishment(String memberPunishment) {
		this.memberPunishment = memberPunishment;
	}

	public Date getMemberPunishmentDate() {
		return memberPunishmentDate;
	}

	public void setMemberPunishmentDate(Date memberPunishmentDate) {
		this.memberPunishmentDate = memberPunishmentDate;
	}


}