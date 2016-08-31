package web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import data.Trip;
import data.TripFileDAO;

@Controller
@SessionAttributes("triplist")
public class TravelController {

	@ModelAttribute("triplist")
	public List<Trip> initList() {
		System.out.println("DEBUG: initList");
		List<Trip> trips = tripDao.getTrips();
		return trips;
	}

	@Autowired
	private TripFileDAO tripDao;

	@RequestMapping("GetTrip.do")
	public ModelAndView loadTrip(@ModelAttribute("triplist") ArrayList<Trip> trips) {
		ModelAndView mv = new ModelAndView("results.jsp");
		System.out.println(trips);
		mv.addObject("trips", trips);
		System.out.println("Loaded trip");
		return mv;
	}
	
	@RequestMapping("AddTrip.do")
	public ModelAndView addTrip(Trip trip, @ModelAttribute("triplist") ArrayList<Trip> trips){
		tripDao.addTrip(trip);
		trips = tripDao.getTrips();
		System.out.println("Adding Trip");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("results.jsp");
		return mv;
	}
}
