package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.Coupon;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.dto.CouponDto;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.CouponService;

@RestController
@RequestMapping("/api/coupon")
public class CouponControllerApi {

	@Autowired
	private CouponService couponService;

	@GetMapping("/unusedCoupon/{memberId}")
	public List<CouponDto> findUnusedCouponsByMemberId(@PathVariable Integer memberId) {
		List<Coupon> coupons = couponService.findUnusedCouponsByMemberId(memberId);
		List<CouponDto> couponDtos = coupons.stream().map(CouponDto::new).collect(Collectors.toList());
		return couponDtos;
	}

}
