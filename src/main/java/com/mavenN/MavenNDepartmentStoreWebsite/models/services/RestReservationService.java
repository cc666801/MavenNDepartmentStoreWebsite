package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant.Reservation;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.RestReservationRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CompanyRepository;

@Service
public class RestReservationService {
	@Autowired
	private RestReservationRepository resRepository;
	
	@Autowired
	private CompanyRepository companyRepository;
	
	public void addreservation (Reservation res) {
		resRepository.save(res);
	}
	
	public Page<Company> findByUserQueryCompany(String companyname, Integer pageNumber){
		PageRequest pg = PageRequest.of(pageNumber, 9);
		Page<Company> findByCompanyNameContaining = companyRepository.findByCompanyNameContaining(companyname, pg);
		return findByCompanyNameContaining;
	}
	
	public Page<Company> findAllReservationByPage(Integer pageNumber) {
		PageRequest pg = PageRequest.of(pageNumber-1, 9, Sort.Direction.DESC, "companyId");
		Page<Company> page = companyRepository.findAll(pg);
		return page;
	}
	
	public List<Reservation> findAllReservation() {
		List<Reservation> findAllReservation = resRepository.findAll();
		return findAllReservation;
	}
	
	public List<Company> findAllCompany(){
		List<Company> findAllcomp = companyRepository.findAll();
		return findAllcomp;
	}
	
	public Reservation findreservationbyid(Integer r_id){
		Optional<Reservation> option = resRepository.findById(r_id);
		
		if(option.isEmpty()) {
			return null;
		}
		
		return option.get();
	} 
	
	@Transactional
	public Reservation upDateReservationbyid(Integer r_id, String name, String telephone, 
											 Company company,String email, String remark, 
											 Date date,String time_interval, String time,
											 Integer adult, Integer children) {
		Optional<Reservation> option = resRepository.findById(r_id);
		if(option.isPresent()) {
			Reservation res = option.get();
			System.out.println(res);
			res.setName(name);
			res.setTelephone(telephone);
			res.setCompany(company);
			res.setEmail(email);
			res.setRemark(remark);
			res.setDate(date);
			res.setTime_interval(time_interval);
			res.setTime(time);
			res.setAdult(adult);
			res.setChildren(children);		
			return res;
			
		}		
		return null;
	}
	
	public void deletebyid(Integer id) {
		resRepository.deleteById(id);
	}
	
	
	
	
}
