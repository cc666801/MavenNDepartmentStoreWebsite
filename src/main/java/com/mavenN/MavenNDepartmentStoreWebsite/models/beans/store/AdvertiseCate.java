package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.store;

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
@Table(name = "AdvertiseCate")
public class AdvertiseCate {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "advertiseCate_Id")
	private Integer advertiseCateId;

	@Column(name = "advertiseCate_Name", columnDefinition = "nvarchar(50)", nullable = false)
	private String advertiseCateName;

	@Column(name = "advertiseCate_Desc", columnDefinition = "nvarchar(200)", nullable = false)
	private String advertiseCateDesc;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "advertiseCate_CDay", columnDefinition = "datetime", nullable = true)
	private Date advertiseCateCDay;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "advertiseCate_MDay", columnDefinition = "datetime", nullable = true)
	private Date advertiseCateMDay;

//	嘗試設定一對多關係
//	@OneToMany(mappedBy = "advertiseCate", cascade = CascadeType.ALL)
//	Set<Advertise> set = new HashSet<>();

//	   @OneToMany(mappedBy = "advertiseCate")
//	    private List<Advertise> advertise;
//	
	
	@PrePersist
	@PreUpdate
	public void onCreateOrUpdate() {
		if (advertiseCateCDay == null) {
			advertiseCateCDay = new Date();
		}
		if (advertiseCateMDay == null) {
			advertiseCateMDay = new Date();
		} else {
			advertiseCateMDay = new Date();
		}
	}

	public Integer getAdvertiseCateId() {
		return advertiseCateId;
	}

	public void setAdvertiseCateId(Integer advertiseCateId) {
		this.advertiseCateId = advertiseCateId;
	}

	public String getAdvertiseCateName() {
		return advertiseCateName;
	}

	public void setAdvertiseCateName(String advertiseCateName) {
		this.advertiseCateName = advertiseCateName;
	}

	public String getAdvertiseCateDesc() {
		return advertiseCateDesc;
	}

	public void setAdvertiseCateDesc(String advertiseCateDesc) {
		this.advertiseCateDesc = advertiseCateDesc;
	}

	public Date getAdvertiseCateCDay() {
		return advertiseCateCDay;
	}

	public void setAdvertiseCateCDay(Date advertiseCateCDay) {
		this.advertiseCateCDay = advertiseCateCDay;
	}

	public Date getAdvertiseCateMDay() {
		return advertiseCateMDay;
	}

	public void setAdvertiseCateMDay(Date advertiseCateMDay) {
		this.advertiseCateMDay = advertiseCateMDay;
	}

}
