package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;

@Entity
@Table(name = "coupon_member")
public class CouponMember {
	
	@EmbeddedId
    private CouponMemberId id;

    @ManyToOne
    @MapsId("couponId")
    @JoinColumn(name = "coupon_id")
    private Coupon coupon;

    @ManyToOne
    @MapsId("memberId")
    @JoinColumn(name = "member_id")
    private Member member;

    
	public CouponMember(CouponMemberId id, Coupon coupon, Member member) {
		super();
		this.id = id;
		this.coupon = coupon;
		this.member = member;
	}

	public CouponMember() {
		super();
	}

	public CouponMemberId getId() {
		return id;
	}

	public void setId(CouponMemberId id) {
		this.id = id;
	}

	public Coupon getCoupon() {
		return coupon;
	}

	public void setCoupon(Coupon coupon) {
		this.coupon = coupon;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
    
    
    
}
