package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
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
	private Integer cateId;
	
	@Column(name="cate_Name", columnDefinition = "nvarchar(50)",nullable = false)
	private String cateName;
	
	@Column(name="cate_Desc", columnDefinition = "nvarchar(200)",nullable = true)
	private String cateDesc;

	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "cate_CDay", columnDefinition = "datetime",nullable = true)
	private Date cateCDay;
	
	

	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "cate_MDay", columnDefinition = "datetime",nullable = true)
	private Date cateMDay;

//	@OneToMany(mappedBy = "commCate")
//	private List<Commodity> commDetailsList;
	
	@PrePersist
	@PreUpdate
	public void onCreateOrUpdate() {
	    if (cateCDay == null) {
	        cateCDay = new Date();
	    }
	    if (cateMDay == null) {
	        cateMDay = new Date();
	    } else {
	        cateMDay = new Date();
	    }
	}
	

	
	

//	public List<Commodity> getCommDetailsList() {
//		return commDetailsList;
//	}
//
//
//
//	public void setCommDetailsList(List<Commodity> commDetailsList) {
//		this.commDetailsList = commDetailsList;
//	}



	public Integer getCateId() {
		return cateId;
	}





	public void setCateId(Integer cateId) {
		this.cateId = cateId;
	}





	public String getCateName() {
		return cateName;
	}





	public void setCateName(String cateName) {
		this.cateName = cateName;
	}





	public String getCateDesc() {
		return cateDesc;
	}





	public void setCateDesc(String cateDesc) {
		this.cateDesc = cateDesc;
	}





	public Date getCateCDay() {
		return cateCDay;
	}





	public void setCateCDay(Date cateCDay) {
		this.cateCDay = cateCDay;
	}





	public Date getCateMDay() {
		return cateMDay;
	}





	public void setCateMDay(Date cateMDay) {
		this.cateMDay = cateMDay;
	}





	public CommCate() {
		
		// TODO Auto-generated constructor stub
	}


	
	
}