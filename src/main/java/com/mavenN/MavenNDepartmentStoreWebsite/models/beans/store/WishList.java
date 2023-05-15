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
@IdClass(WishListId.class)
@Table(name = "wishlist")
public class WishList implements Serializable {

    @Column(name = "commodity_quantity")
    private Integer quantity;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @Column(name = "wishlist_CDay", columnDefinition = "datetime")
    private Date wishlistCDay;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @Column(name = "wishlist_MDay", columnDefinition = "datetime")
    private Date wishlistMDay;

    @Id
    @ManyToOne
    @JoinColumn(name = "fk_member_id")
    private Member member;

    @Id
    @ManyToOne
    @JoinColumn(name = "fk_commodity_id")
    private Commodity commodity;
	
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

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
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


	
}
