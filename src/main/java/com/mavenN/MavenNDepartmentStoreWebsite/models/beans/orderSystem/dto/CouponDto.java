package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.dto;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.Coupon;

public class CouponDto {
	
	private Integer couponId;
	
	private String couponName;
	
	private String couponDiscount;

	public CouponDto() {
		super();
	}

	public CouponDto(Coupon coupon) {
		super();
		this.couponId = coupon.getCouponId();
		this.couponName = coupon.getCouponName();
		this.couponDiscount = coupon.getCouponDiscount();
	}

	public Integer getCouponId() {
		return couponId;
	}

	public void setCouponId(Integer couponId) {
		this.couponId = couponId;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public String getCouponDiscount() {
		return couponDiscount;
	}

	public void setCouponDiscount(String couponDiscount) {
		this.couponDiscount = couponDiscount;
	}
	
	
}
