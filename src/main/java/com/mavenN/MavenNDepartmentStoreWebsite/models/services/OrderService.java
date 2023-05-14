package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Commodity;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.Coupon;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.CouponMember;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.CouponMemberId;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.Order;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.OrderDetail;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.OrderDetailId;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.OrderStatus;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.ShoppingCart;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.dto.OrderDetailDto;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.dto.OrderDto;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CommodityRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.memberSystem.MemberRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem.CouponMemberRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem.CouponRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem.OrderDetailRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem.OrderRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem.OrderStatusRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem.ShoppingCartRepository;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

@Service
public class OrderService {

	@Autowired
	private MemberRepository memberRepository;

	@Autowired
	public OrderRepository orderRepository;

	@Autowired
	public OrderDetailRepository orderDetailRepository;

	@Autowired
	public CommodityRepository commodityRepository;

	@Autowired
	private ShoppingCartRepository shoppingCartRepository;

	@Autowired
	private OrderStatusRepository orderStatusRepository;

	@Autowired
	private CouponRepository couponRepository;

	@Autowired
	private CouponMemberRepository couponMemberRepository;

	// Api
	// For saveShoppingCart()
	@Transactional
	public Order saveCashOnDeliverOrderByDto(OrderDto orderDto) {
		Optional<Member> optionalMember = memberRepository.findById(orderDto.getMemberId());
		if (optionalMember.isPresent()) {
			Member member = optionalMember.get();
			Order newOrder = new Order(null, member);
			newOrder.setCreateOrderTimeIfNull();
			newOrder.setTotal(orderDto.getTotal());
			if(orderDto.getCouponId() != null) {
			// 有優惠卷就 set 進 newOrder
			Optional<Coupon> optionalCoupon = couponRepository.findById(orderDto.getCouponId());
			if (optionalCoupon.isPresent()) {
				Coupon coupon = optionalCoupon.get();
				newOrder.setCoupon(coupon);
				// 有使用優惠卷就寫入中間表格 CouponMember
				CouponMemberId id = new CouponMemberId(orderDto.getCouponId(), orderDto.getMemberId());
				CouponMember couponMember = new CouponMember(id, coupon, member);
				couponMemberRepository.save(couponMember);
			}
			}
			// 設定為貨到付款訂單
			Optional<OrderStatus> optionalOrderStatus = orderStatusRepository.findById(3);
			OrderStatus orderStatus = optionalOrderStatus.get();
			newOrder.setOrderStatus(orderStatus);
			Order order = orderRepository.save(newOrder);
			List<OrderDetailDto> orderDetailDtos = orderDto.getOrderDetailDtos();
			for (OrderDetailDto orderDetailDto : orderDetailDtos) {
				Optional<Commodity> optionalCommodity = commodityRepository.findById(orderDetailDto.getCommodityId());
				if (optionalCommodity.isPresent()) {
					Commodity commodity = optionalCommodity.get();
					OrderDetailId id = new OrderDetailId(commodity.getCommId(), order.getOrderId());
					OrderDetail newOrderDetail = new OrderDetail(id, orderDetailDto.getQuantity(),
							orderDetailDto.getCommodityPrice(), commodity, order);
					orderDetailRepository.save(newOrderDetail);
				}
			}

			// 刪除已經加入訂單的購物車
			Optional<ShoppingCart> optionalShoppingCart = shoppingCartRepository.findByMemberId(orderDto.getMemberId());
			if (optionalShoppingCart.isPresent()) {
				ShoppingCart shoppingCart = optionalShoppingCart.get();
				shoppingCartRepository.deleteById(shoppingCart.getShoppingCartId());
			}

			return order;
		}
		return null;
	}

	@Transactional
	public Order savePaymentFlowOrderByDto(OrderDto orderDto) {
		Optional<Member> optionalMember = memberRepository.findById(orderDto.getMemberId());
		if (optionalMember.isPresent()) {
			Member member = optionalMember.get();
			Order newOrder = new Order(null, member);
			newOrder.setCreateOrderTimeIfNull();
			newOrder.setTotal(orderDto.getTotal());
			if(orderDto.getCouponId() != null) {
			// 有優惠卷就 set 進 newOrder
			Optional<Coupon> optionalCoupon = couponRepository.findById(orderDto.getCouponId());
			if (optionalCoupon.isPresent()) {
				Coupon coupon = optionalCoupon.get();
				newOrder.setCoupon(coupon);
				// 有使用優惠卷就寫入中間表格 CouponMember
				CouponMemberId id = new CouponMemberId(orderDto.getCouponId(), orderDto.getMemberId());
				CouponMember couponMember = new CouponMember(id, coupon, member);
				couponMemberRepository.save(couponMember);
			}
			}
			// 設定為信用卡付款訂單
			Optional<OrderStatus> optionalOrderStatus = orderStatusRepository.findById(2);
			OrderStatus orderStatus = optionalOrderStatus.get();
			newOrder.setOrderStatus(orderStatus);
			Order order = orderRepository.save(newOrder);
			List<OrderDetailDto> orderDetailDtos = orderDto.getOrderDetailDtos();
			for (OrderDetailDto orderDetailDto : orderDetailDtos) {
				Optional<Commodity> optionalCommodity = commodityRepository.findById(orderDetailDto.getCommodityId());
				if (optionalCommodity.isPresent()) {
					Commodity commodity = optionalCommodity.get();
					OrderDetailId id = new OrderDetailId(commodity.getCommId(), order.getOrderId());
					OrderDetail newOrderDetail = new OrderDetail(id, orderDetailDto.getQuantity(),
							orderDetailDto.getCommodityPrice(), commodity, order);
					orderDetailRepository.save(newOrderDetail);
				}
			}
			Optional<ShoppingCart> optionalShoppingCart = shoppingCartRepository.findByMemberId(orderDto.getMemberId());
			if (optionalShoppingCart.isPresent()) {
				ShoppingCart shoppingCart = optionalShoppingCart.get();
				shoppingCartRepository.deleteById(shoppingCart.getShoppingCartId());
			}
			return order;
		}
		return null;
	}

	// For findAllCashOnDeliverOrderDtoByMemberId
	public List<Order> findAllCashOnDeliverOrderDtoByMemberId(Integer memberId) {
		return orderRepository.findAllCashOnDeliverByMemberId(memberId);
	}

	// For findAllPaymentFlowOrderDtoByMemberId
	public List<Order> findAllPaymentFlowOrderDtoByMemberId(Integer memberId) {
		return orderRepository.findAllPaymentFlowByMemberId(memberId);
	}

	// For findAllCancelOrderByMemberId
	public List<Order> findAllCancelOrderByMemberId(Integer memberId) {
		return orderRepository.findAllCancelOrderByMemberId(memberId);
	}

	// For changeOrderStatusByOrderId
	public List<Order> changeOrderStatusByOrderId(Integer orderId, Integer memberId) {
		Optional<Order> optionalOrder = orderRepository.findById(orderId);
		if (optionalOrder.isPresent()) {
			Order order = optionalOrder.get();
			// DataLiner 的 id:1 是 已取消訂單
			Optional<OrderStatus> optionalOrderStatus = orderStatusRepository.findById(1);
			OrderStatus orderStatus = optionalOrderStatus.get();
			order.setOrderStatus(orderStatus);
			orderRepository.save(order);
		}
		return orderRepository.findAllOrderByMemberId(memberId);
	}

	// For paymentFlow
	public String ecpayCheckout(Order order) {

//		String uuId = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 20);

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String formattedDate = dateFormat.format(order.getCreateOrderTime());
		long milliseconds = order.getCreateOrderTime().getTime();

		String uuId = order.getOrderId().toString() + "D" + milliseconds;

		AllInOne all = new AllInOne("");

		AioCheckOutALL obj = new AioCheckOutALL();
		obj.setMerchantTradeNo(uuId);
		obj.setMerchantTradeDate(formattedDate);
		obj.setTotalAmount(order.getTotal().toString());
		obj.setTradeDesc("test Description");
		obj.setItemName("TestItem");
		obj.setReturnURL("http://localhost:8080/MavenNDepartmentStoreWebsite/orderSystem/order");

		obj.setOrderResultURL("http://localhost:8080/MavenNDepartmentStoreWebsite/orderSystem/order/post");

		obj.setNeedExtraPaidInfo("N");
		String form = all.aioCheckOut(obj, null);

		return form;
	}
}
