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
@Table(name="address")
public class Address {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="address_id")
	private Integer addressId;
	
	@Column(name="address_name", columnDefinition = "nvarchar(200)")
	private String addressName;
	
	@OneToMany(mappedBy = "address", cascade = CascadeType.ALL)
	Set<Company> set = new HashSet<>();
	
	// Constructor
	public Address() {
	}
	
	

	public Address(Integer addressId, String addressName) {
		super();
		this.addressId = addressId;
		this.addressName = addressName;
	}



	// Getter and Setter
	public Integer getAddressId() {
		return addressId;
	}

	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}

	public String getAddressName() {
		return addressName;
	}

	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}

	public Set<Company> getSet() {
		return set;
	}

	public void setSet(Set<Company> set) {
		this.set = set;
	}
}
