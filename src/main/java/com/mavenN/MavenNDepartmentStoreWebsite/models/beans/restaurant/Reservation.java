package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;

@Entity
@Table(name="restaurant_Reservation")
public class Reservation {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer r_id;	
	
	@Column(columnDefinition = "nvarchar(50) NOT NULL")
	private String name; 
	
	@Column(columnDefinition = "nvarchar(50) NOT NULL")
	private String telephone;
	
	@Column(columnDefinition = "nvarchar(50)")
	private String email;
	
	@Column(columnDefinition = "nvarchar(100)")
	private String remark;
	
	
	@ManyToOne
	@JoinColumn(name="restaurantInformation_id", nullable = false)
	private RestaurantInformation restaurantInformation;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	@Column(columnDefinition = "date", nullable = false)
	private Date date;
	
	@Column(columnDefinition = "nvarchar(50) NOT NULL")
	private String timeInterval;
	
	@Column(columnDefinition = "nvarchar(50) NOT NULL")
	private String time;
	
	@Column(columnDefinition = "int NOT NULL")
	private Integer adult;
	
	@Column(columnDefinition = "int NOT NULL")
	private Integer children;
	
	@ManyToOne
	@JoinColumn(name="member_id")
	private Member member;

	// Constructor
	public Reservation() {
		super();
	}
	
	// getter & setter
		
	public RestaurantInformation getRestaurantInformation() {
		return restaurantInformation;
	}
	
	public void setRestaurantInformation(RestaurantInformation restaurantInformation) {
		this.restaurantInformation = restaurantInformation;
	}
	
	public Member getMember() {
		return member;
	}
	
	public void setMember(Member member) {
		this.member = member;
	}

	
	public Integer getR_id() {
		return r_id;
	}

	public void setR_id(Integer r_id) {
		this.r_id = r_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getTimeInterval() {
		return timeInterval;
	}

	public void setTimeInterval(String timeInterval) {
		this.timeInterval = timeInterval;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Integer getAdult() {
		return adult;
	}

	public void setAdult(Integer adult) {
		this.adult = adult;
	}

	public Integer getChildren() {
		return children;
	}

	public void setChildren(Integer children) {
		this.children = children;
	}
	
	
	
	
	
}
