package web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import data.ReccomendedTrip;
import data.ReccomendedTripDAO;
import data.Trip;
import data.TripFileDAO;

@Controller
@SessionAttributes({ "triplist", "rectriplist" })
public class TravelController {

	@ModelAttribute("triplist")
	public HashMap<Integer, Trip> initList() {
		System.out.println("DEBUG: initList");
		HashMap<Integer, Trip> trips = tripDao.getTrips();
		return trips;
	}

	@ModelAttribute("rectriplist")
	public HashMap<Integer, ReccomendedTrip> initRecList() {
		System.out.println("DEBUG: initRecList");
		HashMap<Integer, ReccomendedTrip> recTrips = recTripDao.getRecommendations();
		System.out.println(recTrips);
		return recTrips;
	}

	@Autowired
	private TripFileDAO tripDao;
	@Autowired
	private ReccomendedTripDAO recTripDao;

	@RequestMapping("GetTrip.do")
	public ModelAndView loadTrip(@ModelAttribute("rectriplist") HashMap<Integer, Trip> recTrips,
			@ModelAttribute("triplist") HashMap<Integer, Trip> trips) {
		ModelAndView mv = new ModelAndView("results.jsp");
		System.out.println(trips);
		int random = (int) (Math.random() * recTrips.size() + 1);
		int random2;
		do {
			random2 = (int) (Math.random() * recTrips.size() + 1);
		} while (random == random2);
		System.out.println("random: " + random);
		mv.addObject("randomRecTrips", recTrips.get(random));
		mv.addObject("randomRecTrips2", recTrips.get(random2));
		mv.addObject("trips", trips);
		System.out.println("Loaded trip");
		return mv;
	}

	@RequestMapping(path = "AddTrip.do", method = RequestMethod.POST)
	public ModelAndView addTrip(Trip trip, @ModelAttribute("triplist") HashMap<Integer, Trip> trips) {
		tripDao.addTrip(trip);
		trips = tripDao.getTrips();
		System.out.println("Adding Trip");
		ModelAndView mv = new ModelAndView("results.jsp");
		return mv;
	}

	@RequestMapping(path = "EditTrip.do", method = RequestMethod.POST)
	public ModelAndView editTrip(@RequestParam("index") int index, @RequestParam("city") String city,
			@RequestParam("state") String state, @RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate, @RequestParam(value = "delete", required = false) String delete,
			@ModelAttribute("triplist") HashMap<Integer, Trip> trips) {
		System.out.println("Index is : " + index);
		Trip temp = tripDao.getTripByIndex(index);
		if (delete != null) {
			trips.remove(index);
		} else {
			System.out.println("In else block");
			temp.setCity(city);
			temp.setState(state);
			temp.setStartDate(startDate);
			temp.setEndDate(endDate);
		}
		System.out.println("Editing Trip");
		System.out.println("delete = " + delete);

		ModelAndView mv = new ModelAndView("results.jsp");
		return mv;
	}

}
