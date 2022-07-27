package com.aditya.Hotel_Management_System;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.text.ParseException;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.aditya.Hotel_Management_System.exception.BookingNotFound;
import com.aditya.Hotel_Management_System.exception.InvalidBookingId;
import com.aditya.Hotel_Management_System.service.BookingService;
import com.aditya.Hotel_Management_System.service.RoomService;

@SpringBootTest
class HotelManagementSystemApplicationTests {
	@Autowired
	BookingService bservice;
	@Autowired
	RoomService rservice;

	@Test
	public void checkInTest() {
		assertEquals("Added",bservice.checkIn(101, "Bheke", "99999999999", 2, 2, "AC", 3, 3000.0));
	}
	
	@Test
	public void checkInRoomTest() {
		Exception e = assertThrows(ParseException.class, ()->{
			rservice.checkIn("AC", "Bheke", 101, "202212-07", 2, 2);
		});
		String expmsg = "xyz";
		String actmsg = e.getMessage();
		assertFalse(actmsg.contains(expmsg));
	}
	
	@Test
	public void UpdateBookingTest() {
		assertEquals("Updated",bservice.updateBooking(101, "Bheke", "99999999999", 2, 2, "AC", 3, 3000.0));
	}
	
	@Test
	public void updateRoomTest() {
		Exception e = assertThrows(ParseException.class, ()->{
			rservice.updateRoom("AC", "Bheke", 101, "202212-07", 2, 2);
		});
		String expmsg = "xyz";
		String actmsg = e.getMessage();
		assertFalse(actmsg.contains(expmsg));
	}
	
	@Test
	public void viewBookingTest() {
		Exception e = assertThrows(BookingNotFound.class, ()->{
			bservice.viewBooking(105);
		});
		String expmsg = "Booking Data Not Found";
		String actmsg = e.getMessage();
		assertTrue(actmsg.contains(expmsg));
	}
	
	@Test
	public void viewRoomTest() {

		Exception e = assertThrows(BookingNotFound.class, ()->{
			rservice.viewRoom(105);
		});
		String expmsg = "Booking Data Not Found";
		String actmsg = e.getMessage();
		assertTrue(actmsg.contains(expmsg));
	}
	
	@Test
	public void viewAllBookingTest() {
		assertNotNull(bservice.viewAllBookings());
	}
	
	@Test
	public void viewAllRoomsTest() {
		assertNotNull(rservice.viewAllRooms());
	}
	
	@Test
	public void checkOutTest() {
		Exception e = assertThrows(InvalidBookingId.class, ()->{
			bservice.checkOut(106);
		});
		String expmsg = "Invalid Booking Id";
		String actmsg = e.getMessage();
		assertTrue(actmsg.contains(expmsg));
	}
	
	@Test
	public void deleteBookingTest() {
		Exception e = assertThrows(InvalidBookingId.class, ()->{
			bservice.deleteBooking(105);
		});
		String expmsg = "Invalid Booking Id";
		String actmsg = e.getMessage();
		assertTrue(actmsg.contains(expmsg));
	}
	
	@Test
	public void deleteRoomTest() {
		Exception e = assertThrows(InvalidBookingId.class, ()->{
			rservice.deleteRoom(105);
		});
		String expmsg = "Invalid Booking Id";
		String actmsg = e.getMessage();
		assertTrue(actmsg.contains(expmsg));
	}
}
