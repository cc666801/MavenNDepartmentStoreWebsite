package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem;

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
	private Integer commId;
	
	@Column(name="comm_Name", columnDefinition = "nvarchar(50)",nullable = false)
	private  String commName;

	@Column(name="comm_Picture", columnDefinition = "varbinary(MAX)",nullable = true)
	private byte[] commPicture;
	
	@Transient
	private MultipartFile transferToByteArray;

	@Transient
	private String base64StringcommPicture;
	


	
	@Column(name="comm_Desc", columnDefinition = "nvarchar(300)",nullable = true)
	private String commDesc;
	
	@Column(name="comm_Price", columnDefinition = "nvarchar(10)",nullable = true)
	private Double commPrice;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "comm_CDay", columnDefinition = "datetime",nullable = true)
	private Date commCDay;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "comm_MDay", columnDefinition = "datetime",nullable = true)
	private Date commMDay;
	
	@Column(name="comm_Shelve", columnDefinition = "BIT",nullable = true)
	private Boolean commShelve;
	
	@Column(name="comm_Discount", columnDefinition = "nvarchar(15)",nullable = true)
	private String commDiscount;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "fk_cateId")
	private CommCate cateId;
	
	
	@PrePersist
	@PreUpdate
	public void onCreateOrUpdate() {
	    if (commCDay == null) {
	    	commCDay = new Date();
	    }
	    if (commMDay == null) {
	    	commMDay = new Date();
	    } else {
	    	commMDay = new Date();
	    }
	}
	




	public Integer getCommId() {
		return commId;
	}





	public void setCommId(Integer commId) {
		this.commId = commId;
	}





	public String getCommName() {
		return commName;
	}





	public void setCommName(String commName) {
		this.commName = commName;
	}





	public byte[] getCommPicture() {
		return commPicture;
	}





	public void setCommPicture(byte[] commPicture) {
		this.commPicture = commPicture;
	}





	public MultipartFile getTransferToByteArray() {
		return transferToByteArray;
	}





	public void setTransferToByteArray(MultipartFile transferToByteArray) {
		this.transferToByteArray = transferToByteArray;
	}





	public String getBase64StringcommPicture() {
		return base64StringcommPicture;
	}





	public void setBase64StringcommPicture(String base64StringcommPicture) {
		this.base64StringcommPicture = base64StringcommPicture;
	}





	public String getCommDesc() {
		return commDesc;
	}





	public void setCommDesc(String commDesc) {
		this.commDesc = commDesc;
	}





	public Double getCommPrice() {
		return commPrice;
	}





	public void setCommPrice(Double commPrice) {
		this.commPrice = commPrice;
	}





	public Date getCommCDay() {
		return commCDay;
	}





	public void setCommCDay(Date commCDay) {
		this.commCDay = commCDay;
	}





	public Date getCommMDay() {
		return commMDay;
	}





	public void setCommMDay(Date commMDay) {
		this.commMDay = commMDay;
	}





	public Boolean getCommShelve() {
		return commShelve;
	}





	public void setCommShelve(Boolean commShelve) {
		this.commShelve = commShelve;
	}





	public String getCommDiscount() {
		return commDiscount;
	}





	public void setCommDiscount(String commDiscount) {
		this.commDiscount = commDiscount;
	}





	public CommCate getCateId() {
		return cateId;
	}





	public void setCateId(CommCate cateId) {
		this.cateId = cateId;
	}





	public Commodity() {
		// TODO Auto-generated constructor stub
	}

}
