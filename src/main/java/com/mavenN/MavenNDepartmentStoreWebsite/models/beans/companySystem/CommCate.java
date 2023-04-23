package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;



@Entity
@Table(name="CommCate")
public class CommCate {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="cate_Id")
	private Integer cate_Id;
	
	@Column(name="cate_Name", columnDefinition = "nvarchar(50)",nullable = false)
	private String cate_Name;
	
	@Column(name="cate_Desc", columnDefinition = "nvarchar(200)",nullable = true)
	private String cate_Desc;

	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "cate_CDay", columnDefinition = "datetime",nullable = true)
	private Date cate_CDay;
	
	

	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "cate_MDay", columnDefinition = "datetime",nullable = true)
	private Date cate_MDay;

	
	
	@PrePersist
	@PreUpdate
	public void onCreateOrUpdate() {
	    if(cate_CDay == null) {
	        cate_CDay = new Date();
	    }
	    if(cate_MDay == null) {
	        cate_MDay = new Date();
	    }
	}
	
	public Integer getCate_Id() {
		return cate_Id;
	}



	public void setCate_Id(Integer cate_Id) {
		this.cate_Id = cate_Id;
	}



	public String getCate_Name() {
		return cate_Name;
	}



	public void setCate_Name(String cate_Name) {
		this.cate_Name = cate_Name;
	}



	public String getCate_Desc() {
		return cate_Desc;
	}



	public void setCate_Desc(String cate_Desc) {
		this.cate_Desc = cate_Desc;
	}


	
	

	
	public Date getCate_CDay() {
		return cate_CDay;
	}



	public void setCate_CDay(Date cate_CDay) {
		this.cate_CDay = cate_CDay;
	}



	public Date getCate_MDay() {
		return cate_MDay;
	}



	public void setCate_MDay(Date cate_MDay) {
		this.cate_MDay = cate_MDay;
	}



	public CommCate() {
		
		// TODO Auto-generated constructor stub
	}


	
	
}