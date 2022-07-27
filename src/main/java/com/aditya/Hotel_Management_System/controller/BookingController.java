package com.aditya.Hotel_Management_System.controller;

import java.text.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.aditya.Hotel_Management_System.exception.BookingNotFound;
import com.aditya.Hotel_Management_System.exception.InvalidBookingId;
import com.aditya.Hotel_Management_System.service.BookingService;
import com.aditya.Hotel_Management_System.service.RoomService;

@Controller
public class BookingController {
	@Autowired
	BookingService bservice;
	@Autowired
	RoomService rservice;

	@RequestMapping("hotelHome")
	public String hotelHome() {
		return "home.jsp";
	}

	@RequestMapping("Home")
	public ModelAndView home(int opt) {
		ModelAndView mvc = new ModelAndView();
		if (opt == 1) {
			mvc.setViewName("checkIn.jsp");
			mvc.addObject("var", rservice.viewAllRooms());						//Getting list of all rooms and sending it to checkIn.jsp
			return mvc;
		} else if (opt == 2) {
			mvc.setViewName("updateBooking.jsp");
			mvc.addObject("var", rservice.viewAllRooms());						//Getting list of all rooms and sending it to updateBooking.jsp
			return mvc;
		} else if (opt == 3) {
			mvc.setViewName("viewBookings.jsp");
			return mvc;
		} else if (opt == 4) {
			mvc.setViewName("checkOut.jsp");
			return mvc;
		} else
			return null;
	}

	@RequestMapping("checkin")
	public String checkIn(int bid, String cname, String cmobile, int guests, int nroom, String troom, String cidate,
			int ndays, double advance, int avlRooms) throws ParseException {
		if (nroom <= avlRooms) {
			rservice.checkIn(troom, cname, bid, cidate, ndays, nroom);						//If no. of rooms is less than or equal to available rooms then adding entries in both tables.
			bservice.checkIn(bid, cname, cmobile, guests, nroom, troom, ndays, advance);
		}
		return "home.jsp";

	}

	@RequestMapping("updateBooking")
	public String updateBooking(int bid, String cname, String cmobile, int guests, int nroom, String troom,
			String cidate, int ndays, double advance, int avlRooms) throws ParseException {
		if (nroom <= avlRooms) {
			rservice.updateRoom(troom, cname, bid, cidate, ndays, nroom);					//If no. of rooms is less than or equal to available rooms then adding entries in both tables.
			bservice.updateBooking(bid, cname, cmobile, guests, nroom, troom, ndays, advance);
		}
		return "home.jsp";
	}

	@RequestMapping("viewRoom")
	public ModelAndView viewRoom(int bid) {
		ModelAndView mvc = new ModelAndView();
		mvc.setViewName("viewBookings.jsp");
		try {
			mvc.addObject("viewRoom", rservice.viewRoom(bid));
		} catch (BookingNotFound bnf) {
			System.out.println(bnf.getMessage());
		}
		return mvc;
	}

	@RequestMapping("viewAllRooms")
	public ModelAndView viewAllRooms() {
		ModelAndView mvc = new ModelAndView();
		mvc.setViewName("viewBookings.jsp");
		mvc.addObject("allRooms", rservice.viewAllRooms());
		return mvc;
	}

	@RequestMapping("allRecords")
	public ModelAndView viewAllRecords() {
		ModelAndView mvc = new ModelAndView();
		mvc.setViewName("viewBookings.jsp");
		mvc.addObject("allRecofRooms", rservice.viewAllRooms());
		mvc.addObject("allRecofBookings", bservice.viewAllBookings());
		return mvc;
	}

	@RequestMapping("viewBooking")
	public ModelAndView viewBooking(int bid) {
		ModelAndView mvc = new ModelAndView();
		mvc.setViewName("viewBookings.jsp");
		try {
			mvc.addObject("viewBooking", bservice.viewBooking(bid));
		} catch (BookingNotFound bnf) {
			System.out.println(bnf.getMessage());
		}
		return mvc;
	}

	@RequestMapping("viewAllBookings")
	public ModelAndView viewAllBookings() {
		ModelAndView mvc = new ModelAndView();
		mvc.setViewName("viewBookings.jsp");
		mvc.addObject("allBookings", bservice.viewAllBookings());
		return mvc;
	}

	@RequestMapping("checkout")
	public ModelAndView checkOut(int bid) {
		ModelAndView mvc = new ModelAndView();
		mvc.setViewName("checkOut.jsp");
		try {
			mvc.addObject("cout", bservice.checkOut(bid));
		} catch (InvalidBookingId ibi) {
			System.out.println(ibi.getMessage());
		}

		return mvc;
	}

	@RequestMapping("deletebooking")
	public String checkpayment(int bid, double pamount, double ramount) {
		if (pamount == ramount) {
			try {
				bservice.deleteBooking(bid);
			} catch (InvalidBookingId ibi) {
				System.out.println(ibi.getMessage());
			}
			try {
				rservice.deleteRoom(bid);
			} catch (InvalidBookingId e) {
				e.printStackTrace();
			}
			return "home.jsp";
		}
		return "checkOut.jsp";
	}
}
