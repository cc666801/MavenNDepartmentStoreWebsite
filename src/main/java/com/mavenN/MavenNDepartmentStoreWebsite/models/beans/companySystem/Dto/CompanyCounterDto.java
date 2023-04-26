package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Dto;

import java.time.LocalDateTime;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CompanyCounter;

public class CompanyCounterDto {

	private Integer companyId;
	
    private String companyName;
    
    private Integer counterId;

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
        this.counterId = companyCounter.getCounter().getCounterId();
        this.counterName = companyCounter.getCounter().getCounterName();
        this.contractTime = companyCounter.getContractTime();
        this.onCounterTime = companyCounter.getCompanyCounterId().getOnCounterTime();
        this.offCounterTime = companyCounter.getOffCounterTime();
    }

//    public static CompanyCounterDto fromEntity(com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CompanyCounter entity) {
//        return new CompanyCounterDto(entity.getCompanyCounterId().getCompanyId(), entity.getCompanyCounterId().getCounterId(),
//                entity.getCompany(), entity.getCounter(), entity.getContractTime(), entity.getCompanyCounterId().getOnCounterTime(),
//                entity.getOffCounterTime());
//    }
//
//    public com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CompanyCounter toEntity() {
//        CompanyCounterId companyCounterId = new CompanyCounterId(companyId, counterId, onCounterTime);
//        com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CompanyCounter entity =
//                new com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CompanyCounter(companyCounterId, company, counter, contractTime, offCounterTime);
//        return entity;
//    }
//
//    public void setOffCounterTimeIfNull() {
//        if (offCounterTime == null) {
//            Calendar cal = Calendar.getInstance();
//            cal.setTime(onCounterTime);
//            cal.add(Calendar.YEAR, contractTime);
//            offCounterTime = cal.getTime();
//            cal.set(Calendar.MONTH, cal.get(Calendar.MONTH));
//            cal.set(Calendar.DAY_OF_MONTH, cal.get(Calendar.DAY_OF_MONTH));
//            cal.set(Calendar.HOUR_OF_DAY, cal.get(Calendar.HOUR_OF_DAY));
//            cal.set(Calendar.MINUTE, cal.get(Calendar.MINUTE));
//            cal.set(Calendar.SECOND, cal.get(Calendar.SECOND));
//        }
//    }

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

	
}
