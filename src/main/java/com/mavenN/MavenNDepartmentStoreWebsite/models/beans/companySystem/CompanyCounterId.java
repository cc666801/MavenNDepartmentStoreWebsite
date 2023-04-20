package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class CompanyCounterId implements Serializable{

	
	private static final long serialVersionUID = 1L;

	@Column(name = "fk_company_id")
    private Integer companyId;

    @Column(name = "fk_counter_id")
    private Integer counterId;
	
    
	public CompanyCounterId() {
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
}
