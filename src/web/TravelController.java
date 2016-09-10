package web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.JsonDAO;
import data.RecommendedTrip;
import data.RecommendedTripDbDAO;
import data.Trip;
import data.TripDAO;

@Controller
public class TravelController {

	@Autowired
	private TripDAO tripDao;
	@Autowired
	private RecommendedTripDbDAO recTripDao;

	@RequestMapping("GetTrip.do")
	public ModelAndView loadTrip() {
		ModelAndView mv = new ModelAndView("results.jsp");
		RecommendedTrip[] rt = recTripDao.getRandomTrips();
		mv.addObject("triplist", tripDao.getTrips());
		mv.addObject("randomRecTrips", rt[0]);
		mv.addObject("randomRecTrips2", rt[1]);
		mv.addObject("snippet", "list.jsp");
		System.out.println("Loaded trip");
		return mv;
	}

	@RequestMapping(path = "AddTrip.do", method = RequestMethod.POST)
	public ModelAndView addTrip(Trip trip) {
		tripDao.addTrip(trip);
		System.out.println("Adding Trip");
		ModelAndView mv = new ModelAndView("results.jsp");
		RecommendedTrip[] rt = recTripDao.getRandomTrips();
		mv.addObject("triplist", tripDao.getTrips());
		mv.addObject("randomRecTrips", rt[0]);
		mv.addObject("randomRecTrips2", rt[1]);
		mv.addObject("snippet", "list.jsp");
		return mv;
	}

	@RequestMapping(path = "EditTrip.do", method = RequestMethod.POST)
	public ModelAndView editTrip(@RequestParam("index") int index, @RequestParam("city") String city,
			@RequestParam("state") String state, @RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate, @RequestParam(value = "delete", required = false) String delete) {

		if (delete != null) {
			tripDao.deleteTrip(index);
		} else {
			tripDao.editTrip(index, city, state, startDate, endDate);
		}

		ModelAndView mv = new ModelAndView("results.jsp");
		RecommendedTrip[] rt = recTripDao.getRandomTrips();
		mv.addObject("triplist", tripDao.getTrips());
		mv.addObject("randomRecTrips", rt[0]);
		mv.addObject("randomRecTrips2", rt[1]);
		mv.addObject("snippet", "list.jsp");
		return mv;
	}

	@RequestMapping(path = "GeneratePage.do", method = RequestMethod.GET)
	public ModelAndView makePage(@RequestParam(value = "action") String action,
			@RequestParam(value = "city", required = false) String city,
			@RequestParam(value = "state", required = false) String state) {
		ModelAndView mv = new ModelAndView("results.jsp");
		String snippet = "";
		switch (action) {
		case "edit":
			snippet = "edit.jsp";
			break;
		case "editview":
			snippet = "editview.jsp";
			break;
		case "add":
			if (city != null) {
			} else {
				city = state = "";
			}
			snippet = "add.jsp?city=" + city + "&state=" + state;
			break;
		case "list":
			snippet = "list.jsp";
			break;
		case "details":
			snippet = "details.jsp";
			mv.addObject("yelp", new JsonDAO().parseYelp(city));
			break;
		}
		RecommendedTrip[] rt = recTripDao.getRandomTrips();
		mv.addObject("randomRecTrips", rt[0]);
		mv.addObject("randomRecTrips2", rt[1]);
		mv.addObject("triplist", tripDao.getTrips());
		mv.addObject("snippet", snippet);
		return mv;
	}
}
