package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="company")
public class Company {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="company_id")
	private Integer companyId;
	
	@Column(name="company_name", columnDefinition = "nvarchar(200)")
	private String companyName;
	
	@Column(name="company_phone", columnDefinition = "nvarchar(200)")
	private String companyPhone;
	
	@Column(name="company_logo", columnDefinition = "nvarchar(MAX)")
	private String companyLogo;
	

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_address_id")
	private Address address;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_industry_category_id")
	private IndustryCategory industryCategory;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_opening_hours_id")
	private OpeningHours openingHours;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_cooperation_status_id")
	private CooperationStatus cooperationStatus;
	
//	@ManyToMany
//    @JoinTable(name = "company_counter",
//        joinColumns = @JoinColumn(name = "fk_company_id"),
//        inverseJoinColumns = @JoinColumn(name = "fk_counter_id")
//    )
	
	@OneToMany(mappedBy = "company")
    private List<CompanyCounter> counters;

	// Constructor
	public Company() {
		super();
	}

	// Getter and Setter
	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyPhone() {
		return companyPhone;
	}

	public void setCompanyPhone(String companyPhone) {
		this.companyPhone = companyPhone;
	}

	public String getCompanyLogo() {
		return companyLogo;
	}

	public void setCompanyLogo(String companyLogo) {
		this.companyLogo = companyLogo;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}
	
	public IndustryCategory getIndustryCategory() {
		return industryCategory;
	}
	
	public void setIndustryCategory(IndustryCategory industryCategory) {
		this.industryCategory = industryCategory;
	}
	
}
