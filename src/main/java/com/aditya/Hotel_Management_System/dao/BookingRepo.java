package com.aditya.Hotel_Management_System.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.aditya.Hotel_Management_System.entity.Booking;

public interface BookingRepo extends JpaRepository<Booking, Integer> {

}
