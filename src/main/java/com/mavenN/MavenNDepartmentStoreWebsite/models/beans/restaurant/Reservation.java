package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.data.annotation.Id;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="restaurant_Reservation")
public class Reservation {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer r_id;
	
	@Column(columnDefinition = "nvarchar(50) NOT NULL")
	private String name; 
	
	private String telephone;
	
	private String email;
	
	private String remark;

	@DateTimeFormat(pattern = "yyyy/MM/dd")
	@Temporal(TemporalType.DATE)
	private Date date;
	
	private String time_interval;
	
	private String time;
	
	private Integer adult;
	
	private Integer children;
	
	
}
