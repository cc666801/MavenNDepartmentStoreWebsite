package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem;

import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;

@Entity
@Table(name = "order_table")
public class Order {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id")
    private Integer orderId;
	
	@ManyToOne
    @JoinColumn(name = "fk_member_id")
    @NotNull
    private Member member;
	
	@Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @Column(name = "last_updated_time", columnDefinition = "datetime")
    private Date lastUpdatedTime;
	
	@Column(name = "coupon_code", columnDefinition = "nvarchar(40)")
	private String couponCode;
	
	@PrePersist
    public void setLastUpdatedTimeIfNull() {
        if (lastUpdatedTime == null) {
        	lastUpdatedTime = new Date();
        }
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss.SSS", Locale.US);
        dateFormat.setLenient(false);  // 禁用毫秒數格式化
        dateFormat.setDateFormatSymbols(new DateFormatSymbols(Locale.US) {

       	/**
       	 * 
       	 */
       	private static final long serialVersionUID = 1L;
			@Override
            public String[] getMonths() {
                return new String[]{"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
            }
        });  // 避免月份被縮寫
        lastUpdatedTime.setTime((lastUpdatedTime.getTime() / 1000) * 1000);  // 將毫秒數設為0
        String formattedDate = dateFormat.format(lastUpdatedTime);
        System.out.println("Formatted date: " + formattedDate);
    }

	public Order(Integer orderId, @NotNull Member member) {
		super();
		this.orderId = orderId;
		this.member = member;
	}

	public Order() {
		super();
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Date getLastUpdatedTime() {
		return lastUpdatedTime;
	}

	public void setLastUpdatedTime(Date lastUpdatedTime) {
		this.lastUpdatedTime = lastUpdatedTime;
	}

	public String getCouponCode() {
		return couponCode;
	}

	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}
	
	
}
