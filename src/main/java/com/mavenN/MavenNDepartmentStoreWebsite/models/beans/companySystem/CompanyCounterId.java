package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.PrePersist;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Embeddable
public class CompanyCounterId implements Serializable{

	
	private static final long serialVersionUID = 1L;

	@Column(name = "fk_company_id")
    private Integer companyId;

    @Column(name = "fk_counter_id")
    private Integer counterId;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @Column(name = "on_counter_time", columnDefinition = "datetime")
    private Date onCounterTime;
	
    @PrePersist
    public void setOnCounterTimeIfNull() {
        if (onCounterTime == null) {
            onCounterTime = new Date();
        }
    }
    
	public CompanyCounterId() {
	}

	
	
	@Override
	public int hashCode() {
		return Objects.hash(companyId, counterId, onCounterTime);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CompanyCounterId other = (CompanyCounterId) obj;
		return Objects.equals(companyId, other.companyId) && Objects.equals(counterId, other.counterId)
				&& Objects.equals(onCounterTime, other.onCounterTime);
	}

	// Constructor
	public CompanyCounterId(Integer companyId, Integer counterId, Date onCounterTime) {
		super();
		this.companyId = companyId;
		this.counterId = counterId;
		this.onCounterTime = onCounterTime;
	}
	
	// Getter And Setter
	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public Integer getCounterId() {
		return counterId;
	}

	public void setCounterId(Integer counterId) {
		this.counterId = counterId;
	}

	public Date getOnCounterTime() {
		return onCounterTime;
	}

	public void setOnCounterTime(Date onCounterTime) {
		this.onCounterTime = onCounterTime;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
