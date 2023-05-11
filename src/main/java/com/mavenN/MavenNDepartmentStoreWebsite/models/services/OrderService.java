package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Commodity;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.Order;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.OrderDetail;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.OrderDetailId;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.OrderStatus;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.ShoppingCart;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.ShoppingCartCommodity;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.dto.OrderDetailDto;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.dto.OrderDto;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CommodityRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.memberSystem.MemberRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem.OrderDetailRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem.OrderRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem.OrderStatusRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem.ShoppingCartRepository;

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

	// Api
	// For saveShoppingCart()
	@Transactional
	public void saveOrderByDto(OrderDto orderDto) {
		Optional<Member> optionalMember = memberRepository.findById(orderDto.getMemberId());
		if (optionalMember.isPresent()) {
			Member member = optionalMember.get();
			Order newOrder = new Order(null, member);
			newOrder.setCreateOrderTimeIfNull();
			newOrder.setTotal(orderDto.getTotal());
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
					OrderDetail newOrderDetail = new OrderDetail(id, orderDetailDto.getQuantity(), orderDetailDto.getCommodityPrice(), commodity, order);
					orderDetailRepository.save(newOrderDetail);
				}
			}
			Optional<ShoppingCart> optionalShoppingCart = shoppingCartRepository.findByMemberId(orderDto.getMemberId());
			if (optionalShoppingCart.isPresent()) {
				ShoppingCart shoppingCart = optionalShoppingCart.get();
				shoppingCartRepository.deleteById(shoppingCart.getShoppingCartId());
			}
		}
	}
	
	// For findByMemberId
	public List<Order> findByMemberId(Integer memberId){
		return orderRepository.findByMemberId(memberId);
	}
	
	// For changeOrderStatusByOrderId
	public List<Order> changeOrderStatusByOrderId(Integer orderId, Integer memberId){
		Optional<Order> optionalOrder = orderRepository.findById(orderId);
		if(optionalOrder.isPresent()) {
			Order order = optionalOrder.get();
			// DataLiner 的 id:1 是 已取消訂單
			Optional<OrderStatus> optionalOrderStatus = orderStatusRepository.findById(1);
			OrderStatus orderStatus = optionalOrderStatus.get();
			order.setOrderStatus(orderStatus);
			orderRepository.save(order);
		}
		return orderRepository.findByMemberId(memberId);
	}
}
