package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "coupon")
public class Coupon {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "coupon_id")
    private Integer couponId;
	
	@Column(name = "coupon_name")
	private String couponName;
	
	@Column(name = "coupon_discount")
	private String couponDiscount;
	
	@OneToMany(mappedBy = "coupon")
    private Set<CouponMember> couponMembers = new HashSet<>();

	
	public Coupon() {
		super();
	}

	public Coupon(Integer couponId, String couponName, String couponDiscount) {
		super();
		this.couponId = couponId;
		this.couponName = couponName;
		this.couponDiscount = couponDiscount;
	}

	public Integer getCouponId() {
		return couponId;
	}

	public void setCouponId(Integer couponId) {
		this.couponId = couponId;
	}

	public String getCouponDiscount() {
		return couponDiscount;
	}

	public void setCouponDiscount(String couponDiscount) {
		this.couponDiscount = couponDiscount;
	}

	public Set<CouponMember> getCouponMembers() {
		return couponMembers;
	}

	public void setCouponMembers(Set<CouponMember> couponMembers) {
		this.couponMembers = couponMembers;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	
	
}
