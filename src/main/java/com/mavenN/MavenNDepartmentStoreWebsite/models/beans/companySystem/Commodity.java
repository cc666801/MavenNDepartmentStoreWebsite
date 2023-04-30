package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem;

import java.io.IOException;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table (name="Commodity")
public class Commodity {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="comm_Id")
	private Integer comm_Id;
	
	@Column(name="comm_Name", columnDefinition = "nvarchar(50)",nullable = false)
	private  String comm_Name;

	@Column(name="comm_Picture", columnDefinition = "varbinary(MAX)",nullable = true)
	private byte[] comm_Picture;
	
	@Transient
	private MultipartFile transferToByteArray;

	@Transient
	private String base64Stringcomm_Picture;
	


	
	@Column(name="comm_Desc", columnDefinition = "nvarchar(300)",nullable = true)
	private String comm_Desc;
	
	@Column(name="comm_Price", columnDefinition = "nvarchar(10)",nullable = true)
	private Double comm_Price;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "comm_CDay", columnDefinition = "datetime",nullable = true)
	private Date comm_CDay;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "comm_MDay", columnDefinition = "datetime",nullable = true)
	private Date comm_MDay;
	
	@Column(name="comm_Shelve", columnDefinition = "BIT",nullable = true)
	private Boolean comm_Shelve;
	
	@Column(name="comm_Discount", columnDefinition = "nvarchar(15)",nullable = true)
	private String comm_Discount;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "fk_cate_Id")
	private CommCate cate_Id;
	
	
	@PrePersist
	@PreUpdate
	public void onCreateOrUpdate() {
	    if (comm_CDay == null) {
	    	comm_CDay = new Date();
	    }
	    if (comm_MDay == null) {
	    	comm_MDay = new Date();
	    } else {
	    	comm_MDay = new Date();
	    }
	}
	

	
	
	
	public Integer getComm_Id() {
		return comm_Id;
	}





	public void setComm_Id(Integer comm_Id) {
		this.comm_Id = comm_Id;
	}





	public String getComm_Name() {
		return comm_Name;
	}





	public void setComm_Name(String comm_Name) {
		this.comm_Name = comm_Name;
	}





	public byte[] getComm_Picture() {
		return comm_Picture;
	}





	public void setComm_Picture(byte[] comm_Picture) {
		this.comm_Picture = comm_Picture;
	}





	public String getComm_Desc() {
		return comm_Desc;
	}





	public void setComm_Desc(String comm_Desc) {
		this.comm_Desc = comm_Desc;
	}





	public Double getComm_Price() {
		return comm_Price;
	}





	public void setComm_Price(Double comm_Price) {
		this.comm_Price = comm_Price;
	}





	public Date getComm_CDay() {
		return comm_CDay;
	}





	public void setComm_CDay(Date comm_CDay) {
		this.comm_CDay = comm_CDay;
	}





	public Date getComm_MDay() {
		return comm_MDay;
	}





	public void setComm_MDay(Date comm_MDay) {
		this.comm_MDay = comm_MDay;
	}





	public Boolean getComm_Shelve() {
		return comm_Shelve;
	}





	public void setComm_Shelve(Boolean comm_Shelve) {
		this.comm_Shelve = comm_Shelve;
	}





	public CommCate getCate_Id() {
		return cate_Id;
	}





	public void setCate_Id(CommCate cate_Id) {
		this.cate_Id = cate_Id;
	}





	public String getComm_Discount() {
		return comm_Discount;
	}





	public void setComm_Discount(String comm_Discount) {
		this.comm_Discount = comm_Discount;
	}





	public MultipartFile getTransferToByteArray() {
		return transferToByteArray;
	}





	public void setTransferToByteArray(MultipartFile transferToByteArray) {
		this.transferToByteArray = transferToByteArray;
	}





	public String getBase64Stringcomm_Picture() {
		return base64Stringcomm_Picture;
	}





	public void setBase64Stringcomm_Picture(String base64Stringcomm_Picture) {
		this.base64Stringcomm_Picture = base64Stringcomm_Picture;
	}





	public Commodity() {
		// TODO Auto-generated constructor stub
	}

}
