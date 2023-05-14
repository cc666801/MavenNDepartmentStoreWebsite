package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class CouponMemberId implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Column(name = "coupon_id")
    private Integer couponId;

    @Column(name = "member_id")
    private Integer memberId;

    
    
    
	public CouponMemberId() {
		super();
	}

	public CouponMemberId(Integer couponId, Integer memberId) {
		super();
		this.couponId = couponId;
		this.memberId = memberId;
	}

	public Integer getCouponId() {
		return couponId;
	}

	public void setCouponId(Integer couponId) {
		this.couponId = couponId;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(couponId, memberId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CouponMemberId other = (CouponMemberId) obj;
		return Objects.equals(couponId, other.couponId) && Objects.equals(memberId, other.memberId);
	}
	
	
    
    
}
