package web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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

	@RequestMapping(path = "AddTrip.do", method = RequestMethod.POST)
	public ModelAndView addTrip(Trip trip, @ModelAttribute("triplist") ArrayList<Trip> trips) {
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
			@ModelAttribute("triplist") ArrayList<Trip> trips) {
		System.out.println("Index is : " + index);
		Trip temp = tripDao.getTripByIndex(index);
		if (delete != null) {
			trips.remove(temp);
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
