package web;

import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import data.JsonDAO;
import data.RecommendedTrip;
import data.RecommendedTripDAO;
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
	public HashMap<Integer, RecommendedTrip> initRecList() {
		System.out.println("DEBUG: initRecList");
		HashMap<Integer, RecommendedTrip> recTrips = recTripDao.getRecommendations();
		System.out.println(recTrips);
		return recTrips;
	}

	@Autowired
	private TripFileDAO tripDao;
	@Autowired
	private RecommendedTripDAO recTripDao;

	@RequestMapping("GetTrip.do")
	public ModelAndView loadTrip(@ModelAttribute("rectriplist") HashMap<Integer, Trip> recTrips,
			@ModelAttribute("triplist") HashMap<Integer, Trip> trips) {
		ModelAndView mv = new ModelAndView("results.jsp");
		System.out.println(trips);
		RecommendedTrip[] rt = recTripDao.getRandomTrips();
		mv.addObject("randomRecTrips", rt[0]);
		mv.addObject("randomRecTrips2", rt[1]);
		mv.addObject("trips", trips);
		mv.addObject("snippet", "list.jsp");
		System.out.println("Loaded trip");
		return mv;
	}

	@RequestMapping(path = "AddTrip.do", method = RequestMethod.POST)
	public ModelAndView addTrip(Trip trip, @ModelAttribute("rectriplist") HashMap<Integer, Trip> recTrips,
			@ModelAttribute("triplist") HashMap<Integer, Trip> trips) {
		loadTrip(recTrips, trips);
		tripDao.addTrip(trip);
		trips = tripDao.getTrips();
		System.out.println("Adding Trip");
		ModelAndView mv = new ModelAndView("results.jsp");
		RecommendedTrip[] rt = recTripDao.getRandomTrips();
		mv.addObject("randomRecTrips", rt[0]);
		mv.addObject("randomRecTrips2", rt[1]);
		mv.addObject("snippet", "list.jsp");
		return mv;
	}

	@RequestMapping(path = "EditTrip.do", method = RequestMethod.POST)
	public ModelAndView editTrip(@RequestParam("index") int index, @RequestParam("city") String city,
			@RequestParam("state") String state, @RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate, @RequestParam(value = "delete", required = false) String delete,
			@ModelAttribute("triplist") HashMap<Integer, Trip> trips,
			@ModelAttribute("rectriplist") HashMap<Integer, Trip> recTrips) {
		loadTrip(recTrips, trips);
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
		ModelAndView mv = new ModelAndView("results.jsp");
		RecommendedTrip[] rt = recTripDao.getRandomTrips();
		mv.addObject("randomRecTrips", rt[0]);
		mv.addObject("randomRecTrips2", rt[1]);
		mv.addObject("snippet", "list.jsp");
		return mv;
	}

	@RequestMapping(path = "GeneratePage.do", method = RequestMethod.GET)
	public ModelAndView makePage(@RequestParam(value = "edit", required = false) boolean edit,
			@RequestParam(value = "editview", required = false) boolean editview,
			@RequestParam(value = "add", required = false) boolean add,
			@RequestParam(value = "list", required = false) boolean list,
			@RequestParam(value = "details", required = false) boolean details,
			@RequestParam(value = "city", required = false) String city,
			@RequestParam(value = "state", required = false) String state,
			@ModelAttribute("triplist") HashMap<Integer, Trip> trips) {
		ModelAndView mv = new ModelAndView("results.jsp");
		String snippet = "";

		if (edit) {
			snippet = "edit.jsp";
		}
		if (editview) {
			snippet = "editview.jsp";
		}
		if (add) {
			if (city != null) {
				
				mv.addObject("yelp", new JsonDAO().parseYelp(city));
			} else {
				city = state = "";
			}
			snippet = "add.jsp?city=" + city + "&state=" + state;
		}
		if (list) {
			snippet = "list.jsp";
		}
		if (details) {
			snippet = "details.jsp";
			mv.addObject("yelp", new JsonDAO().parseYelp(city));
		}

		RecommendedTrip[] rt = recTripDao.getRandomTrips();
		mv.addObject("randomRecTrips", rt[0]);
		mv.addObject("randomRecTrips2", rt[1]);
		mv.addObject("triplist", trips);
		mv.addObject("snippet", snippet);
		return mv;
	}
}
