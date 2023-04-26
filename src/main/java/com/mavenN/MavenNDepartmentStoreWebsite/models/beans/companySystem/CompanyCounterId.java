package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.ZoneId;
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
            onCounterTime = Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant());
        }
    }
    
	public CompanyCounterId() {
	}
	
	

	public CompanyCounterId(Integer companyId, Integer counterId, Date onCounterTime) {
		super();
		this.companyId = companyId;
		this.counterId = counterId;
		this.onCounterTime = onCounterTime;
	}

	@Override
	public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((companyId == null) ? 0 : companyId.hashCode());
	result = prime * result + ((counterId == null) ? 0 : counterId.hashCode());
	result = prime * result + ((onCounterTime == null) ? 0 : onCounterTime.hashCode());
	return result;
	}
	
	@Override
	public boolean equals(Object obj) {
	    if (this == obj) {
	        return true;
	    }
	    if (!(obj instanceof CompanyCounterId)) {
	        return false;
	    }
	    CompanyCounterId other = (CompanyCounterId) obj;
	    return Objects.equals(companyId, other.companyId) && Objects.equals(counterId, other.counterId) && Objects.equals(onCounterTime, other.onCounterTime);
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

	@Override
	public String toString() {
		return "CompanyCounterId [companyId=" + companyId + ", counterId=" + counterId + ", onCounterTime="
				+ onCounterTime + "]";
	}
	
	
}
