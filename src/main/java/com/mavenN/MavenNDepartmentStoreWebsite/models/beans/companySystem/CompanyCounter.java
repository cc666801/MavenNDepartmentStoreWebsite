package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem;

import java.util.Date;
import java.util.Objects;

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
    
    @Column(name = "contract_time", columnDefinition = "datetime")
    private Integer contractTime;

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

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public Counter getCounter() {
		return counter;
	}

	public void setCounter(Counter counter) {
		this.counter = counter;
	}

	public Integer getContractTime() {
		return contractTime;
	}

	public void setContractTime(Integer contractTime) {
		this.contractTime = contractTime;
	}

	public Date getOffCounterTime() {
		return offCounterTime;
	}

	public void setOffCounterTime(Date offCounterTime) {
		this.offCounterTime = offCounterTime;
	}
    
}
