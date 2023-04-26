package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.awt.print.PrinterGraphics;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant.Reservation;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.RestReservationRepository;

@Service
public class RestReservationService {
	@Autowired
	private RestReservationRepository resRepository;
	
	public void addreservation (Reservation res) {
		resRepository.save(res);
	}
	
	public Reservation findreservationbyid(Integer id){
		Optional<Reservation> option = resRepository.findById(id);
		
		if(option.isEmpty()) {
			return null;
		}
		
		return option.get();
	} 
	
	public List<Reservation> findAllReservation() {
		List<Reservation> findAllReservation = resRepository.findAll();
		return findAllReservation;
		
	}
	
	
}
