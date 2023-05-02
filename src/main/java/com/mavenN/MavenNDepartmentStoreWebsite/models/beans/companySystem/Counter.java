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
	
	@Column(name="counter_name", columnDefinition = "nvarchar(10)")
	private String counterName;
	
	@Column(name="counter_rent", columnDefinition = "int")
	private Integer counterRent;
	
	@Column(name="counter_square_meters", columnDefinition = "DECIMAL(7,2)")
	private Double counterSquareMeters;
	
	@Column(name="counter_floor", columnDefinition = "nvarchar(10)")
	private String counterFloor;
	
//	@ManyToMany
//    @JoinTable(name = "company_counter",
//        joinColumns = @JoinColumn(name = "fk_counter_id"),
//        inverseJoinColumns = @JoinColumn(name = "fk_company_id"))
	
	@OneToMany(mappedBy = "counter")
    private List<CompanyCounter> companies;
	
	// Constructor
	public Counter() {
	}
	
	

	public Counter(Integer counterId, String counterName, Integer counterRent, Double counterSquareMeters,
			String counterFloor) {
		super();
		this.counterId = counterId;
		this.counterName = counterName;
		this.counterRent = counterRent;
		this.counterSquareMeters = counterSquareMeters;
		this.counterFloor = counterFloor;
	}



	// Getter and Setter
	public Integer getCounterId() {
		return counterId;
	}

	public void setCounterId(Integer counterId) {
		this.counterId = counterId;
	}

	public String getCounterName() {
		return counterName;
	}

	public void setCounterName(String counterName) {
		this.counterName = counterName;
	}

	public Integer getCounterRent() {
		return counterRent;
	}

	public void setCounterRent(Integer counterRent) {
		this.counterRent = counterRent;
	}

	public Double getCounterSquareMeters() {
		return counterSquareMeters;
	}

	public void setCounterSquareMeters(Double counterSquareMeters) {
		this.counterSquareMeters = counterSquareMeters;
	}

	public String getCounterFloor() {
		return counterFloor;
	}

	public void setCounterFloor(String counterFloor) {
		this.counterFloor = counterFloor;
	}

	public List<CompanyCounter> getCompanies() {
		return companies;
	}

	public void setCompanies(List<CompanyCounter> companies) {
		this.companies = companies;
	}



	@Override
	public String toString() {
		return "Counter [counterId=" + counterId + ", counterName=" + counterName + ", counterRent=" + counterRent
				+ ", counterSquareMeters=" + counterSquareMeters + ", counterFloor=" + counterFloor + "]";
	}

}