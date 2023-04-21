package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="Comm_Cate")
public class Comm_Cate {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="Cate_Id")
//	@OneToMany(cascade = CascadeType.ALL)
	private Integer Cate_ID;
	
	@Column(name="Cate_Name", columnDefinition = "nvarchar(50)",nullable = false)
	private String Cate_Name;
	
	@Column(name="Cate_Desc", columnDefinition = "nvarchar(200)")
	private String Cate_Desc;
	
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "Cate_CDay", columnDefinition = "datetime",nullable = false)
	private Date Cate_CDay;
	
	
	
	@UpdateTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "Cate_MDay", columnDefinition = "datetime",nullable = false)
	private Date Cate_MDay;
	
	
//	@OneToMany(cascade=CascadeType.ALL)
//	@JoinColumn(name="Cate_id")
//	private Set<Comm_Details> Comm_Details = new LinkedHashSet<>(); 
//	
	
	public Comm_Cate() {
		// TODO Auto-generated constructor stub
	}




	public Integer getCate_ID() {
		return Cate_ID;
	}




	public void setCate_ID(Integer cate_ID) {
		Cate_ID = cate_ID;
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
