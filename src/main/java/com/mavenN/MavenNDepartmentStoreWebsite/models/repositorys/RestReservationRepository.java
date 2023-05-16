package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant.Reservation;

public interface RestReservationRepository extends JpaRepository<Reservation, Integer> {
	
	public List<Reservation> findByMemberIdOrderByDateAsc(@Param("memberid") Integer memberid);
	
}
