package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant.Reservation;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.RestReservationRepository;

@Service
public class RestReservationService {
	@Autowired
	private RestReservationRepository resRepository;
	
	public void addreservation (Reservation res) {
		resRepository.save(res);
	}
	
	public List<Reservation> findAllReservation() {
		List<Reservation> findAllReservation = resRepository.findAll();
		return findAllReservation;
		
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
											 String email, String remark, Date date,
											 String time_interval, String time,
											 Integer adult, Integer children) {
		Optional<Reservation> option = resRepository.findById(r_id);
		if(option.isPresent()) {
			Reservation res = option.get();
			res.setName(name);
			res.setTelephone(telephone);
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
