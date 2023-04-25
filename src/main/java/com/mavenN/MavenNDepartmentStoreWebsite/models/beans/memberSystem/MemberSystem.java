package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "memberSystem")
public class MemberSystem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "member_ID")
    private Integer memberId;

    @Column(name = "member_Name")
    private String memberName;

    
    @DateTimeFormat(pattern = "yyyy/MM/dd")
    @Column(name = "member_Birthday", columnDefinition = "date")
    private String memberBirthday;

    @Column(name = "member_Email")
    private String memberEmail;

    @Column(name = "member_Phone")
    private String memberPhone;

    @Column(name = "member_Account")
    private String memberAccount;

    @Column(name = "member_Password")
    private String memberPassword;

    @Column(name = "member_Address")
    private String memberAddress;

    @Column(name = "member_Verify")
    private String memberVerify;

    @Column(name = "member_Points")
    private String memberPoints;

    @Column(name = "member_Level")
    private String memberLevel;

    @Column(name = "member_ShopViolationTimes")
    private String memberShopViolationTimes;

    @Column(name = "member_Punishment")
    private String memberPunishment;

    @Column(name = "member_Picture")
    private String memberPicture;
    
	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberBirthday() {
		return memberBirthday;
	}

	public void setMemberBirthday(String memberBirthday) {
		this.memberBirthday = memberBirthday;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberAccount() {
		return memberAccount;
	}

	public void setMemberAccount(String memberAccount) {
		this.memberAccount = memberAccount;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberVerify() {
		return memberVerify;
	}

	public void setMemberVerify(String memberVerify) {
		this.memberVerify = memberVerify;
	}

	public String getMemberPoints() {
		return memberPoints;
	}

	public void setMemberPoints(String memberPoints) {
		this.memberPoints = memberPoints;
	}

	public String getMemberLevel() {
		return memberLevel;
	}

	public void setMemberLevel(String memberLevel) {
		this.memberLevel = memberLevel;
	}

	public String getMemberShopViolationTimes() {
		return memberShopViolationTimes;
	}

	public void setMemberShopViolationTimes(String memberShopViolationTimes) {
		this.memberShopViolationTimes = memberShopViolationTimes;
	}

	public String getMemberPunishment() {
		return memberPunishment;
	}

	public void setMemberPunishment(String memberPunishment) {
		this.memberPunishment = memberPunishment;
	}

	public String getMemberPicture() {
		return memberPicture;
	}

	public void setMemberPicture(String memberPicture) {
		this.memberPicture = memberPicture;
	}    
	
}
	
    
	
	
