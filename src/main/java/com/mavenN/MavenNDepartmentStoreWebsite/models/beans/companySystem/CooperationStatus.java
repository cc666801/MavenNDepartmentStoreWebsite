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
@Table(name="cooperation_status")
public class CooperationStatus {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="cooperation_status_id")
	private Integer cooperationStatusId;
	
	@Column(name="cooperation_status_name", columnDefinition = "nvarchar(200)")
	private String cooperationStatusName;
	
	@OneToMany(mappedBy = "cooperationStatus", cascade = CascadeType.ALL)
	Set<Company> set = new HashSet<>();
	
	// Constructor
	public CooperationStatus() {
	}

	// Getter and Setter
	public Integer getCooperationStatusId() {
		return cooperationStatusId;
	}

	public void setCooperationStatusId(Integer cooperationStatusId) {
		this.cooperationStatusId = cooperationStatusId;
	}

	public String getCooperationStatusName() {
		return cooperationStatusName;
	}

	public void setCooperationStatusName(String cooperationStatusName) {
		this.cooperationStatusName = cooperationStatusName;
	}

	public Set<Company> getSet() {
		return set;
	}

	public void setSet(Set<Company> set) {
		this.set = set;
	}

}
