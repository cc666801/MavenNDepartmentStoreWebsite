package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.store;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Commodity;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;

@Entity
@IdClass(WishList.class)
@Table(name = "wishlist")
public class WishList implements Serializable{

//	嘗試撰寫複合主鍵 將會員與商品綁定作為複合主鍵
	
	
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "wishlist_Id")
	private Integer wishlistId;
//	心願清單編號  一組會員只會有一個心願清單

	@Column(name = "commodity_quantity")
	private Integer quantity;
//	紀錄商品預購買數量

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "wishlist_CDay", columnDefinition = "datetime")
	private Date wishlistCDay;
//	心願清單 創立時間

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "wishlist_MDay", columnDefinition = "datetime")
	private Date wishlistMDay;
//	心願清單 最後修改時間

	@Id
	@ManyToOne
	@JoinColumn(name = "fk_member_id")
	private Member member;
//	會員外鍵
//	一個會員只可以有一個 心願清單

	@Id
	@ManyToOne
	@JoinColumn(name = "fk_commodity_id")
	private Commodity commodity;
//	商品外鍵
//	多個商品 可新增進入 一筆心願清單


	
	@PrePersist
	@PreUpdate
	public void onCreateOrUpdate() {
		if (wishlistCDay == null) {
			wishlistCDay = new Date();
		}
		if (wishlistMDay == null) {
			wishlistMDay = new Date();
		} else {
			wishlistMDay = new Date();
		}
	}
//	處理時間用

//	處理心願清單id用  暫時不用
//	@PrePersist
//	public void generateWishListId() {
//	    LocalDateTime now = LocalDateTime.now();
//	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS");
//	    String wishlistIdString = now.format(formatter);
//	    this.wishlistId = Integer.parseInt(wishlistIdString);
//	}
//	

	public WishList() {
		// TODO Auto-generated constructor stub
	}

	public Integer getWishlistId() {
		return wishlistId;
	}

	public void setWishlistId(Integer wishlistId) {
		this.wishlistId = wishlistId;
	}

	public Date getWishlistCDay() {
		return wishlistCDay;
	}

	public void setWishlistCDay(Date wishlistCDay) {
		this.wishlistCDay = wishlistCDay;
	}

	public Date getWishlistMDay() {
		return wishlistMDay;
	}

	public void setWishlistMDay(Date wishlistMDay) {
		this.wishlistMDay = wishlistMDay;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

}
