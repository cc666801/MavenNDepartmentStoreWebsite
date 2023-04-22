package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.format.annotation.DateTimeFormat;



@Entity
@Table(name="CommCate")
public class CommCate {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="Cate_Id")
	private Integer Cate_Id;
	
	@Column(name="Cate_Name", columnDefinition = "nvarchar(50)",nullable = false)
	private String Cate_Name;
	
	@Column(name="Cate_Desc", columnDefinition = "nvarchar(200)",nullable = true)
	private String Cate_Desc;
	
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "Cate_CDay", columnDefinition = "datetime",nullable = true)
	private Date Cate_CDay;
	
	
	
	@UpdateTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "Cate_MDay", columnDefinition = "datetime",nullable = true)
	private Date Cate_MDay;
	
	
	
	

	public CommCate() {
		// TODO Auto-generated constructor stub
	}


	public Integer getCate_Id() {
		return Cate_Id;
	}


	public void setCate_Id(Integer cate_Id) {
		Cate_Id = cate_Id;
	}


	public String getCate_Name() {
		return Cate_Name;
	}


	public void setCate_Name(String cate_Name) {
		Cate_Name = cate_Name;
	}


	public String getCate_Desc() {
		return Cate_Desc;
	}


	public void setCate_Desc(String cate_Desc) {
		Cate_Desc = cate_Desc;
	}


	public Date getCate_CDay() {
		return Cate_CDay;
	}


	public void setCate_CDay(Date cate_CDay) {
		Cate_CDay = cate_CDay;
	}


	public Date getCate_MDay() {
		return Cate_MDay;
	}


	public void setCate_MDay(Date cate_MDay) {
		Cate_MDay = cate_MDay;
	}

	
	
	
}