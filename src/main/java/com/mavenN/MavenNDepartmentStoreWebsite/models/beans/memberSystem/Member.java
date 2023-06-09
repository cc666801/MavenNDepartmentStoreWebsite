package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "member")
public class Member {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	@NotBlank
	@Column(name = "name", nullable = false)
	private String name;

	@NotBlank
	@Column(name = "account", nullable = false, unique = true)
	private String account;

	@NotBlank
	@Column(name = "password", nullable = false)
	private String password;

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "birthday", columnDefinition = "date")
	private Date birthday;

	@NotBlank
	@Column(name = "email", nullable = false)
	private String email;

	@NotBlank
	@Column(name = "phone")
	private String phone;

	@NotBlank
	@Column(name = "address")
	private String address;

//    @Column(name = "picture")
//    private String picture;

	@Column(name = "points")
	private Integer points = 0;

	@Column(name = "verify")
	private String verify = "未驗證";

	@Column(name = "token")
	private String token;
	
	//權限
	@Column(name = "permissions")
	private String permissions="一般會員";

	public String getPermissions() {
		return permissions;
	}

	public void setPermissions(String permissions) {
		this.permissions = permissions;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getVerify() {
		return verify;
	}

	public void setVerify(String verify) {
		this.verify = verify;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

//	public String getPicture() {
//		return picture;
//	}
//
//	public void setPicture(String picture) {
//		this.picture = picture;
//	}

	public Integer getPoints() {
		return points;
	}

	public void setPoints(Integer points) {
		this.points = points;
	}

}