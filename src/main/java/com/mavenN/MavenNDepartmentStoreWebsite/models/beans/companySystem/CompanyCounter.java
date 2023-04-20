package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "company_counter")
public class CompanyCounter {

	@EmbeddedId
    private CompanyCounterId id;

    @ManyToOne
    @MapsId("companyId")
    @JoinColumn(name = "fk_company_id")
    private Company company;

    @ManyToOne
    @MapsId("counterId")
    @JoinColumn(name = "fk_counter_id")
    private Counter counter;

    @Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @Column(name = "on_counter_time", columnDefinition = "datetime")
    private Date onCounterTime;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @Column(name = "off_counter_time", columnDefinition = "datetime")
    private Date offCounterTime;

    
    public CompanyCounter() {
	}

	// Getters and Setters
	public CompanyCounterId getId() {
		return id;
	}

	public void setId(CompanyCounterId id) {
		this.id = id;
	}

	public Date getOnCounterTime() {
		return onCounterTime;
	}

	public void setOnCounterTime(Date onCounterTime) {
		this.onCounterTime = onCounterTime;
	}

	public Date getOffCounterTime() {
		return offCounterTime;
	}

	public void setOffCounterTime(Date offCounterTime) {
		this.offCounterTime = offCounterTime;
	}
    
}
