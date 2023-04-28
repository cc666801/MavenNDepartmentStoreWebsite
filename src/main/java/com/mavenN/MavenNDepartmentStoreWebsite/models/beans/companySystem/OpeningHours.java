package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="opening_hours")
public class OpeningHours {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="opening_hours_id")
	private Integer openingHoursId;
	
	@Column(name="opening_hours_name", columnDefinition = "nvarchar(200)")
	private String openingHoursName;
	
	@OneToMany(mappedBy = "openingHours", cascade = CascadeType.ALL)
	Set<Company> set = new HashSet<>();
	
	// Constructor
	public OpeningHours() {
	}
	
	public OpeningHours(Integer openingHoursId, String openingHoursName) {
		super();
		this.openingHoursId = openingHoursId;
		this.openingHoursName = openingHoursName;
	}



	// Getter and Setter
	public Integer getOpeningHoursId() {
		return openingHoursId;
	}

	public void setOpeningHoursId(Integer openingHoursId) {
		this.openingHoursId = openingHoursId;
	}

	public String getOpeningHoursName() {
		return openingHoursName;
	}

	public void setOpeningHoursName(String openingHoursName) {
		this.openingHoursName = openingHoursName;
	}

	public Set<Company> getSet() {
		return set;
	}

	public void setSet(Set<Company> set) {
		this.set = set;
	}
}
