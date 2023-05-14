package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Commodity;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.Coupon;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.Order;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.OrderDetail;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.OrderDetailId;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.OrderStatus;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.ShoppingCart;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.dto.OrderDetailDto;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.dto.OrderDto;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CommodityRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.memberSystem.MemberRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem.CouponRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem.OrderDetailRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem.OrderRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem.OrderStatusRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem.ShoppingCartRepository;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

@Service
public class CouponService {

	@Autowired
	private MemberRepository memberRepository;

	@Autowired
	public OrderRepository orderRepository;

	@Autowired
	public CouponRepository couponRepository;
	
	// Api
	public List<Coupon> findUnusedCouponsByMemberId(Integer memberId){
		return couponRepository.findUnusedCouponsByMemberId(memberId);
	}
	
}
