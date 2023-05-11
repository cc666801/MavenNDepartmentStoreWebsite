package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.store;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Commodity;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;

//@Entity
//@Table (name = "wishlist")
public class WishList {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "wishlist_Id")
	private Integer wishlistId;
//	心願清單編號  一組會員只會有一個心願清單

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

	@ManyToOne
	@JoinColumn(name = "fk_member_id", unique = true)
	@NotNull
	private Member member;
//	會員外鍵
//	一個會員只可以有一個 心願清單

	@ManyToOne
    @MapsId("commodityId")
	@JoinColumn(name = "fk_commodity_id")
	private Commodity commodity;
//	商品外鍵
//	多個商品 可新增進入 一筆心願清單

	public WishList() {
		// TODO Auto-generated constructor stub
	}

}
