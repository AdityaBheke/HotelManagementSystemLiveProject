package com.aditya.Hotel_Management_System.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aditya.Hotel_Management_System.dao.BookingRepo;
import com.aditya.Hotel_Management_System.entity.Booking;
import com.aditya.Hotel_Management_System.exception.BookingNotFound;
import com.aditya.Hotel_Management_System.exception.InvalidBookingId;

@Service
public class BookingService {
	@Autowired
	private BookingRepo brepo;
	
	public String checkIn(int bid,String cname,String cmobile,int guests,int nroom,String troom,int ndays,double advance) 
	{
		 Double rooms = Double.valueOf(nroom);
		 Double days = Double.valueOf(ndays);
		double totalAmount = 2000.0*rooms*days;						//calculating total amount
		if(troom.equals("AC")) 										
		{
			 totalAmount = 2.0*totalAmount;							//Increasing total cost for "AC" rooms
		}
		Booking b = new Booking(bid, cname, cmobile, guests, nroom, troom, ndays, advance, totalAmount);
		brepo.save(b);
		return "Added";
	}
	
	public String updateBooking(int bid,String cname,String cmobile,int guests,int nroom,String troom,int ndays,double advance)
	{
		 Double rooms = Double.valueOf(nroom);
		 Double days = Double.valueOf(ndays);
		double totalAmount = 2000.0*rooms*days;						//calculating total amount
		if(troom.equals("AC")) 
		{
			 totalAmount = 2.0*totalAmount;							//Increasing total cost for "AC" rooms
		}
		Booking b1 = new Booking(bid, cname, cmobile, guests, nroom, troom, ndays, advance, totalAmount);
		Booking b = brepo.findById(bid).orElse(null);				//Checking if booking for given booking id is available or not
		if(b!=null)
		{
			brepo.delete(b);										//If available deleting the previously saved bookings for given booking id
		}
		brepo.save(b1);												//Saving new booking data
		return "Updated";
	}
	
	public Booking viewBooking(int bid) throws BookingNotFound {
		Booking b = brepo.findById(bid).orElse(null);				//Checking if booking for given booking id is available or not
		
		if(b!=null) {
		return b;													//If available returning the booking object
		}else {
			throw new BookingNotFound();							//Throwing Booking Not Found exception if booking is not available
		}
	}

	public ArrayList<Booking> viewAllBookings()
	{
		return (ArrayList<Booking>) brepo.findAll();				//finding all the available bookings present in repository
	}
	
	public Booking checkOut(int bid) throws InvalidBookingId
	{
		Booking b = brepo.findById(bid).orElse(null);				//Checking if booking for given booking id is available or not
		if(b!=null) {
			return b;												//If available returning the booking object
		}else {
			throw new InvalidBookingId();							//Throwing Invalid Booking Id exception if booking is not available
		}
	}
	
	public String deleteBooking(int bid) throws InvalidBookingId
	{
		Booking b = brepo.findById(bid).orElse(null);				//Checking if booking for given booking id is available or not
		if(b!=null)
		{
			brepo.delete(b);										//If available deleting the previously saved bookings for given booking id
			return "Deleted";
		}else {
			throw new InvalidBookingId();							//Throwing Invalid Booking Id exception if booking is not available
		}	
		
	}
}
