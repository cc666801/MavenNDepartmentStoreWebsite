package com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant.Reservation;

public interface RestReservationRepository extends JpaRepository<Reservation, Integer> {

}
