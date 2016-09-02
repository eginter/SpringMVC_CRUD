package data;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;


import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;

public class TripFileDAO {
	private static final String FILE_NAME = "/WEB-INF/travel.csv";
	private HashMap<Integer, Trip> trips = new HashMap<>();
	/*
	 * Use Autowired to have Spring inject an instance of a
	 * WebApplicationContext into this object after creation. We will use the
	 * WebApplicationContext to retrieve an ServletContext so we can read from a
	 * file.
	 */
	@Autowired
	private WebApplicationContext wac;

	/*
	 * The @PostConstruct method is called by Spring after object creation and
	 * dependency injection
	 */
	@PostConstruct
	public void init() {
		// Retrieve an input stream from the servlet context
		// rather than directly from the file system
		try (InputStream is = wac.getServletContext().getResourceAsStream(FILE_NAME);
				BufferedReader buf = new BufferedReader(new InputStreamReader(is));
				) {
			String line = buf.readLine();
			int index = 1;
			while ((line = buf.readLine()) != null) {
				String[] tokens = line.split(",");
				String city = tokens[1];
				String state = tokens[2];
				String startDate = tokens[3];
				String endDate = tokens[4];
				System.out.println("" + city + state + startDate + endDate);
				trips.put(index++, new Trip(city, state, startDate, endDate));
			}
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
			System.out.println("in catch");
		}
	}

	

	public void addTrip(Trip trip) {
		trips.put(trip.getIndex(), trip);
	}
	
	public Trip getTripByIndex(int index) {
		System.out.println("DEBUG: in getTripByIndex index: " + index);
		
		for (int key : trips.keySet()) {
			if (trips.get(key).getIndex() == index){
				return trips.get(key);
			}
		}
		return null;
	
	}

	public HashMap<Integer, Trip> getTrips() {
		return trips;
	}



	public void setTrips(HashMap<Integer, Trip> trips) {
		this.trips = trips;
	}

	

}