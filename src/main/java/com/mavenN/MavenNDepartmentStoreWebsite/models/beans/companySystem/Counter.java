package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="counter")
public class Counter {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="counter_id")
	private Integer counterId;
	
	@Column(name="counter_name", columnDefinition = "nvarchar(200)")
	private String counterName;
	
	@Column(name="counter_rent", columnDefinition = "int")
	private Integer counterRent;
	
	@Column(name="counter_square_meters", columnDefinition = "DECIMAL(7,2)")
	private Double counterSquareMeters;
	
	@Column(name="counter_floor", columnDefinition = "int")
	private Double counterFloor;
	
//	@ManyToMany
//    @JoinTable(name = "company_counter",
//        joinColumns = @JoinColumn(name = "fk_counter_id"),
//        inverseJoinColumns = @JoinColumn(name = "fk_company_id"))
	
	@OneToMany(mappedBy = "counter")
    private List<CompanyCounter> companies;
	
	// Constructor
	public Counter() {
	}

	// Getter and Setter
	
}
