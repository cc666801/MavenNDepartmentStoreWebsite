package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem;

import java.io.Serializable;
import java.util.Objects;

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

	@Override
	public int hashCode() {
	    final int prime = 31;
	    int result = 1;
	    result = prime * result + ((companyId == null) ? 0 : companyId.hashCode());
	    result = prime * result + ((counterId == null) ? 0 : counterId.hashCode());
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
	    return Objects.equals(companyId, other.companyId) && Objects.equals(counterId, other.counterId);
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
