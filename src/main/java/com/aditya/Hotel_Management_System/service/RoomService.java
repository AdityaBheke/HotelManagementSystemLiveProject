package com.aditya.Hotel_Management_System.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aditya.Hotel_Management_System.dao.RoomRepo;
import com.aditya.Hotel_Management_System.entity.Room;
import com.aditya.Hotel_Management_System.exception.BookingNotFound;
import com.aditya.Hotel_Management_System.exception.InvalidBookingId;

@Service
public class RoomService {
	@Autowired
	private RoomRepo rrepo;

	public String checkIn(String troom, String cname, int bid, String cidate, int ndays, int nroom)
			throws ParseException {
		Calendar cal = Calendar.getInstance();
		String sDate = cidate;
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(sDate);					//Converting given date which is in string format into Date format to perform operations on it.
		cal.setTime(date);
		cal.add(Calendar.DATE, ndays);													//Adding number of days to check in date to get check out date.
		Date newDate = cal.getTime();
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");						//Converting date in simple date format i.e. dd/MM/yyyy.
		String codate = dateFormat.format(newDate);										//Converting obtained dates into string.
		String cidate1 = dateFormat.format(date);
		
		List<Room> r1 = rrepo.findAll();												//Checking if any room entry is available or not.
		if(r1.size()==0) {
			for(int i=101;i<=120;i++) {
				Room r = new Room(i, null, null, 0, null, null);						//if not available then create 20 new entries for rooms with default values.
				rrepo.save(r);
			}
			List<Room> r2 = rrepo.findAll();											//Getting list of all rooms.
			for(int i=0;i<nroom;i++) {
				Room r = r2.get(i);														//Setting new values for each field
				r.setBid(bid);
				r.setCname(cname);
				r.setTroom(troom);
				r.setCidate(cidate1);
				r.setCodate(codate);													//Note:- This step will executed only once, i.e. when we run our program for the first time.
			}
		}else {
			List<Room> r2 = rrepo.findAll();											//Getting list of all rooms.
			int nr = 0;																	//Creating temporary variable to keep track on how many entries for rooms got added.
			for(int i=0;i<20;i++) {
				Room r = r2.get(i);
				if(r.getBid()==0) {														//Checking if room has default value or not.
				r.setBid(bid);
				r.setCname(cname);
				r.setTroom(troom);
				r.setCidate(cidate1);
				r.setCodate(codate);
				nr++;
				if(nr==nroom) {															//If no. of added rooms are equal to req. no. of rooms then stop adding more entries.
					break;
				}
				}
			}
		}
		return "Added";
	}

	public String updateRoom(String troom, String cname, int bid, String cidate, int ndays, int nroom)
			throws ParseException {
		
		Calendar cal = Calendar.getInstance();
		String sDate = cidate;
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(sDate);					//Converting given date which is in string format into Date format to perform operations on it.
		cal.setTime(date);
		cal.add(Calendar.DATE, ndays);													//Adding number of days to check in date to get check out date.
		Date newDate = cal.getTime();
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");						//Converting date in simple date format i.e. dd/MM/yyyy.
		String codate = dateFormat.format(newDate);										//Converting obtained dates into string.
		String cidate1 = dateFormat.format(date);
		
		List<Room> croom = rrepo.roombyBid(bid);										//Getting list of all rooms having Booking id "bid".
		if(croom.size()<nroom) {														//If available no. of rooms is less than updated no. of rooms then add more rooms.
			for(int i=0;i<croom.size();i++) {
				Room r = croom.get(i);
				r.setBid(bid);
				r.setCname(cname);
				r.setTroom(troom);
				r.setCidate(cidate1);
				r.setCodate(codate);													//First update all available rooms with new attributes.
			}
			List<Room> r2 = rrepo.findAll();
			int nr = 0;
			for(int i=0;i<20;i++) {
				Room r = r2.get(i);
				if(r.getBid()==0) {
				r.setBid(bid);
				r.setCname(cname);
				r.setTroom(troom);
				r.setCidate(cidate1);
				r.setCodate(codate);													//Then add more rooms with new attributes.
				nr++;
				if(nr==nroom-croom.size()) {
					break;
				}
				}
			}
		}else if(croom.size()>nroom) {													//If available no. of rooms is more than updated no. of rooms then remove room entries by setting their values to default values.
			int rr=croom.size();
			int kk=croom.size()-nroom;
			for(int i=0;i<kk;i++) {
				rr--;
				Room r = croom.get(rr);
				r.setBid(0);
				r.setCname(null);
				r.setTroom(null);
				r.setCidate(null);
				r.setCodate(null);
			}
		}else {
			for(int i=0;i<nroom;i++) {													//If available no. of rooms is equal to updated no. of rooms then just update the values of each field.
				Room r = croom.get(i);
				r.setBid(bid);
				r.setCname(cname);
				r.setTroom(troom);
				r.setCidate(cidate1);
				r.setCodate(codate);
			}
			
		}
		return "Updated";
	}

	public List<Room> viewRoom(int bid) throws BookingNotFound {
		List<Room> rlist = rrepo.roombyBid(bid);										//Getting list of all rooms having Booking id "bid".
		if (rlist.size() > 0) {
			return rlist;																//If available return the list.
		} else {
			throw new BookingNotFound();												//If not available then throw Booking Not Found exception.
		}
	}

	public ArrayList<Room> viewAllRooms() {
		ArrayList<Room> r1 = (ArrayList<Room>) rrepo.findAll();							//Getting list of all rooms. 
		ArrayList<Room> r2 = new ArrayList<Room>();
		for(int i=0;i<20;i++) {
			Room r = r1.get(i);
			if(r.getBid()!=0) {
				r2.add(r);																//Adding Rooms in new list which is not having default values.		
			}
		}
		return r2;
	}

	public String deleteRoom(int bid) throws InvalidBookingId  {
		List<Room> droom = rrepo.roombyBid(bid);										//Getting list of all rooms having Booking id "bid".
		if(droom.size()>0) {
		for(int i=0;i<droom.size();i++) {
			Room rno = droom.get(i);
			int roomno = rno.getRno();
			Room r = new Room(roomno, null, null, 0, null, null);						//Setting default values to given rooms.
			rrepo.save(r);
		}
		return "Deleted";
		}else {
			throw new InvalidBookingId();
		}
	}

}
