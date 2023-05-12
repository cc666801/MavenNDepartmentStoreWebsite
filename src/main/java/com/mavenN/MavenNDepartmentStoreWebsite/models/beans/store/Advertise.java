package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.store;

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

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;

@Entity
@Table(name="advertise")
public class Advertise {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="advertise_Id")
	private Integer advertiseId;
	
	
	
	@Column(name="advertise_Name", columnDefinition = "nvarchar(100)")
	private  String advertiseName;

	@Column(name="advertise_Picture", columnDefinition = "varbinary(MAX)")
	private  byte[] advertisePicture;

	@Transient
	private MultipartFile transferToByteArray;

	@Transient
	private String base64StringadvertisePicture;
	
	
	@Column(name="advertise_Desc", columnDefinition = "nvarchar(300)")
	private String advertiseDesc;

	
	@Column(name="advertise_URL", columnDefinition = "nvarchar(800)")
	private String advertiseURL;

	
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "advertise_CDay", columnDefinition = "datetime")
		private Date advertiseCDay;
//	廣告創立日期
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "advertise_MDay", columnDefinition = "datetime")
	private Date advertiseMDay;
//	廣告修改日期
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	@Column(name = "advertise_StartDay", columnDefinition = "datetime")
	private Date advertiseStartDay;
//	廣告上架日期
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	@Column(name = "advertise_RemoveDay", columnDefinition = "datetime")
	private Date advertiseRemoveDay;
//	廣告下架日期
	
//	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")   這個跟上面的 創立日期或修改日期不同 ，若讓使用者自行新增 這邊要改 不然存不進資料庫之中

	
	
	
	@Column(name="advertise_Shelve", columnDefinition = "BIT")
	private Boolean advertiseShelve;
//	廣告上下架
	
	@Column(name="advertise_Fee")
	private Double advertiseFee;
//	廣告費用
	
	@Column(name="advertise_Discount")
	private Double advertiseDiscount;
//	廣告折扣
	
	@Column(name="advertise_Frequency")
	private Integer advertiseFrequency;
//	紀錄廣告點擊次數
	
	@Column(name="advertise_Click")
	private Integer advertiseClick;
//	紀錄廣告點擊次數
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "fk_advertiseCateId")
	private AdvertiseCate advertiseCate;
//	串接 多對一  對廣告分類表
	
	
	
	
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "fk_companyId")
	private Company company;
//  串接 多對一   對廠商分類表 
	
	
	
	@PrePersist
	@PreUpdate
	public void onCreateOrUpdate() {
	    if (advertiseCDay == null) {
	    	advertiseCDay = new Date();
	    }
	    if (advertiseMDay == null) {
	    	advertiseMDay = new Date();
	    } else {
	    	advertiseMDay = new Date();
	    }
	}
	
	
	
	
	
	
	public Integer getAdvertiseId() {
		return advertiseId;
	}






	public void setAdvertiseId(Integer advertiseId) {
		this.advertiseId = advertiseId;
	}






	public String getAdvertiseName() {
		return advertiseName;
	}






	public void setAdvertiseName(String advertiseName) {
		this.advertiseName = advertiseName;
	}






	public byte[] getAdvertisePicture() {
		return advertisePicture;
	}






	public void setAdvertisePicture(byte[] advertisePicture) {
		this.advertisePicture = advertisePicture;
	}






	public MultipartFile getTransferToByteArray() {
		return transferToByteArray;
	}






	public void setTransferToByteArray(MultipartFile transferToByteArray) {
		this.transferToByteArray = transferToByteArray;
	}






	public String getBase64StringadvertisePicture() {
		return base64StringadvertisePicture;
	}






	public void setBase64StringadvertisePicture(String base64StringadvertisePicture) {
		this.base64StringadvertisePicture = base64StringadvertisePicture;
	}






	public String getAdvertiseDesc() {
		return advertiseDesc;
	}






	public void setAdvertiseDesc(String advertiseDesc) {
		this.advertiseDesc = advertiseDesc;
	}






	public String getAdvertiseURL() {
		return advertiseURL;
	}






	public void setAdvertiseURL(String advertiseURL) {
		this.advertiseURL = advertiseURL;
	}






	public Date getAdvertiseCDay() {
		return advertiseCDay;
	}






	public void setAdvertiseCDay(Date advertiseCDay) {
		this.advertiseCDay = advertiseCDay;
	}






	public Date getAdvertiseMDay() {
		return advertiseMDay;
	}






	public void setAdvertiseMDay(Date advertiseMDay) {
		this.advertiseMDay = advertiseMDay;
	}






	public Date getAdvertiseStartDay() {
		return advertiseStartDay;
	}






	public void setAdvertiseStartDay(Date advertiseStartDay) {
		this.advertiseStartDay = advertiseStartDay;
	}






	public Date getAdvertiseRemoveDay() {
		return advertiseRemoveDay;
	}






	public void setAdvertiseRemoveDay(Date advertiseRemoveDay) {
		this.advertiseRemoveDay = advertiseRemoveDay;
	}






	public Boolean getAdvertiseShelve() {
		return advertiseShelve;
	}






	public void setAdvertiseShelve(Boolean advertiseShelve) {
		this.advertiseShelve = advertiseShelve;
	}






	public Double getAdvertiseFee() {
		return advertiseFee;
	}






	public void setAdvertiseFee(Double advertiseFee) {
		this.advertiseFee = advertiseFee;
	}






	public Double getAdvertiseDiscount() {
		return advertiseDiscount;
	}






	public void setAdvertiseDiscount(Double advertiseDiscount) {
		this.advertiseDiscount = advertiseDiscount;
	}






	public Integer getAdvertiseFrequency() {
		return advertiseFrequency;
	}






	public void setAdvertiseFrequency(Integer advertiseFrequency) {
		this.advertiseFrequency = advertiseFrequency;
	}






	public AdvertiseCate getAdvertiseCate() {
		return advertiseCate;
	}






	public void setAdvertiseCate(AdvertiseCate advertiseCate) {
		this.advertiseCate = advertiseCate;
	}






	public Company getCompany() {
		return company;
	}






	public void setCompany(Company company) {
		this.company = company;
	}






	public Integer getAdvertiseClick() {
		return advertiseClick;
	}






	public void setAdvertiseClick(Integer advertiseClick) {
		this.advertiseClick = advertiseClick;
	}






	public Advertise() {
		// TODO Auto-generated constructor stub
	}

}
