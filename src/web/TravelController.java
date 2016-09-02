package web;

import java.time.LocalDate;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import data.Trip;
import data.TripFileDAO;

@Controller
@SessionAttributes("triplist")
public class TravelController {

	@ModelAttribute("triplist")
	public HashMap<Integer, Trip> initList() {
		System.out.println("DEBUG: initList");
		HashMap<Integer, Trip> trips = tripDao.getTrips();
		return trips;
	}

	@Autowired
	private TripFileDAO tripDao;


	@RequestMapping("GetTrip.do")
	public ModelAndView loadTrip(@ModelAttribute("triplist") HashMap<Integer, Trip> trips) {
		ModelAndView mv = new ModelAndView("results.jsp");
		System.out.println(trips);
		mv.addObject("trips", trips);
		System.out.println("Loaded trip");
		return mv;
	}

	@RequestMapping(path = "AddTrip.do", method = RequestMethod.POST)
	public ModelAndView addTrip(@RequestParam("city") String city,
			@RequestParam("state") String state, @RequestParam("startDate") @DateTimeFormat(pattern = "MM/dd/yyyy") LocalDate startDate,
			@RequestParam("endDate") @DateTimeFormat(pattern = "MM/dd/yyyy") LocalDate endDate, @ModelAttribute("triplist") HashMap<Integer, Trip> trips) {
		System.out.println("Adding Trip");
		//tripDao.addTrip(trip);
		tripDao.addTrip(new Trip(city,state,startDate,endDate));
		trips = tripDao.getTrips();
		ModelAndView mv = new ModelAndView("results.jsp");
		return mv;
	}

	@RequestMapping(path = "EditTrip.do", method = RequestMethod.POST)
	public ModelAndView editTrip(@RequestParam("index") int index, @RequestParam("city") String city,
			@RequestParam("state") String state, @RequestParam("startDate") LocalDate startDate,
			@RequestParam("endDate") LocalDate endDate, @RequestParam(value = "delete", required = false) String delete,
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
