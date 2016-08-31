package web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import data.TripFileDAO;

@Controller
public class TravelController {

	@Autowired
	private TripFileDAO tripDao;	
	
	@RequestMapping("GetTrip.do")
	public ModelAndView loadTrip(){
		ModelAndView mv = new ModelAndView("results.jsp");
		mv.addObject("trips", tripDao.getTrips());
		System.out.println("Loaded trip");
		return mv;	
	}
}
