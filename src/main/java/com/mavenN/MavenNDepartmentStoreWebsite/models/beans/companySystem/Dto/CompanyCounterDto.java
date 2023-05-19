package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Dto;

import java.time.LocalDateTime;
import java.util.Base64;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CompanyCounter;

public class CompanyCounterDto {

	private Integer companyId;
	
    private String companyName;
    
    private String companyPhone;
	private String base64StringCompanyLogo;
	private String industryCategoryName;
    
    private Integer counterId;
    private String counterfloor;

    private String counterName;

    private Integer contractTime;

    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "Asia/Taipei")
    private Date onCounterTime;

    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "Asia/Taipei")
    private Date offCounterTime;

    public CompanyCounterDto() {
    }

    public CompanyCounterDto(CompanyCounter companyCounter) {
        this.companyId = companyCounter.getCompany().getCompanyId();
        this.companyName = companyCounter.getCompany().getCompanyName();
        this.companyPhone = companyCounter.getCompany().getCompanyPhone();
        
        String base64CompanyLogo = Base64.getEncoder().encodeToString(companyCounter.getCompany().getCompanyLogo());
		this.base64StringCompanyLogo = base64CompanyLogo;
		
        this.industryCategoryName = companyCounter.getCompany().getIndustryCategory().getIndustryCategoryName();
        this.counterId = companyCounter.getCounter().getCounterId();
        this.counterfloor = companyCounter.getCounter().getCounterFloor();
        this.counterName = companyCounter.getCounter().getCounterName();
        this.contractTime = companyCounter.getContractTime();
        this.onCounterTime = companyCounter.getCompanyCounterId().getOnCounterTime();
        this.offCounterTime = companyCounter.getOffCounterTime();
    }


    // Getters and Setters

    public String getCompanyName() {
		return companyName;
	}

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

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCounterName() {
		return counterName;
	}

	public void setCounterName(String counterName) {
		this.counterName = counterName;
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

	public void setContractTime(Integer contractTime) {
		this.contractTime = contractTime;
	}

	public Integer getContractTime() {
        return contractTime;
    }

	public String getCompanyPhone() {
		return companyPhone;
	}

	public void setCompanyPhone(String companyPhone) {
		this.companyPhone = companyPhone;
	}

	public String getBase64StringCompanyLogo() {
		return base64StringCompanyLogo;
	}

	public void setBase64StringCompanyLogo(String base64StringCompanyLogo) {
		this.base64StringCompanyLogo = base64StringCompanyLogo;
	}

	public String getIndustryCategoryName() {
		return industryCategoryName;
	}

	public void setIndustryCategoryName(String industryCategoryName) {
		this.industryCategoryName = industryCategoryName;
	}

	public String getCounterfloor() {
		return counterfloor;
	}

	public void setCounterfloor(String counterfloor) {
		this.counterfloor = counterfloor;
	}

	
}
