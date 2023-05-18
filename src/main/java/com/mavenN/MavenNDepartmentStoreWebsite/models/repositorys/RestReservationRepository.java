package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant.Reservation;

public interface RestReservationRepository extends JpaRepository<Reservation, Integer> {
	
	public List<Reservation> findByMemberIdOrderByDateAsc(@Param("memberid") Integer memberid);
	
	@Query("SELECT r.time FROM Reservation r WHERE r.date = :date AND r.restaurantInformation.resid = :restaurantId GROUP BY r.time HAVING SUM(r.adult + r.children) > 7")
	public List<String> findTimesByPeopleCountOverTen(@Param("date") String date, @Param("restaurantId") Integer restaurantId);
}
