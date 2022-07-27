package com.aditya.Hotel_Management_System.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.aditya.Hotel_Management_System.entity.Room;

public interface RoomRepo extends JpaRepository<Room, Integer> {
	@Query("FROM Room WHERE bid=:BID")
	List<Room> roombyBid(@Param("BID") int bid);			//Getting list of all rooms of a customer having booking id = bid

}
