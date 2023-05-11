//package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem;
//
//import java.io.Serializable;
//import java.text.DateFormatSymbols;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//import java.util.Locale;
//import java.util.Objects;
//
//import javax.persistence.Column;
//import javax.persistence.Embeddable;
//import javax.persistence.PrePersist;
//import javax.persistence.Temporal;
//import javax.persistence.TemporalType;
//
//import org.springframework.format.annotation.DateTimeFormat;
//
//@Embeddable
//public class OrderId implements Serializable{
//	
//	private static final long serialVersionUID = 1L;
//
//	@Column(name = "fk_member_id")
//    private Integer memberId;
//
//	@Temporal(TemporalType.TIMESTAMP)
//    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
//    @Column(name = "create_order_time", columnDefinition = "datetime")
//    private Date createOrderTime;
//	
//	@PrePersist
//    public void setCreateOrderTimeIfNull() {
//        if (createOrderTime == null) {
//        	createOrderTime = new Date();
//        }
//        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss.SSS", Locale.US);
//        dateFormat.setLenient(false);  // 禁用毫秒數格式化
//        dateFormat.setDateFormatSymbols(new DateFormatSymbols(Locale.US) {
//
//       	/**
//       	 * 
//       	 */
//       	private static final long serialVersionUID = 1L;
//			@Override
//            public String[] getMonths() {
//                return new String[]{"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
//            }
//        });  // 避免月份被縮寫
//        createOrderTime.setTime((createOrderTime.getTime() / 1000) * 1000);  // 將毫秒數設為0
//        String formattedDate = dateFormat.format(createOrderTime);
//        System.out.println("Formatted date: " + formattedDate);
//    }
//
//	public OrderId(Integer memberId, Date createOrderTime) {
//		super();
//		this.memberId = memberId;
//		this.createOrderTime = createOrderTime;
//	}
//
//	public Integer getMemberId() {
//		return memberId;
//	}
//
//	public void setMemberId(Integer memberId) {
//		this.memberId = memberId;
//	}
//
//	public Date getCreateOrderTime() {
//		return createOrderTime;
//	}
//
//	public void setCreateOrderTime(Date createOrderTime) {
//		this.createOrderTime = createOrderTime;
//	}
//
//	public OrderId() {
//		super();
//	}
//
//	@Override
//	public int hashCode() {
//		return Objects.hash(createOrderTime, memberId);
//	}
//
//	@Override
//	public boolean equals(Object obj) {
//		if (this == obj)
//			return true;
//		if (obj == null)
//			return false;
//		if (getClass() != obj.getClass())
//			return false;
//		OrderId other = (OrderId) obj;
//		return Objects.equals(createOrderTime, other.createOrderTime) && Objects.equals(memberId, other.memberId);
//	}
//
//	
//	
//	
//}
