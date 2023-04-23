package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.awt.print.PrinterGraphics;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant.Reservation;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.RestReservationRepository;

@Service
public class RestrReservationService {
	@Autowired
	private RestReservationRepository reservation;
	
	public void addreservation (Reservation res) {
		reservation.save(res);
	}
	
	public Reservation findreservationbyid(Integer id){
		Optional<Reservation> option = reservation.findById(id);
		
		if(option.isEmpty()) {
			return null;
		}
		
		return option.get();
	} 
}
