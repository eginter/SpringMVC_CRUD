package data;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;

public class TripFileDAO {
	private static final String FILE_NAME = "/WEB-INF/travel.csv";
	private ArrayList<Trip> trips = new ArrayList<>();
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
			while ((line = buf.readLine()) != null) {
				String[] tokens = line.split(",");
				String city = tokens[1];
				String state = tokens[2];
				String startDate = tokens[3];
				String endDate = tokens[4];
				System.out.println("" + city + state + startDate + endDate);
				trips.add(new Trip(city, state, startDate, endDate));
			}
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
			System.out.println("in catch");
		}
	}

	public ArrayList<Trip> getTrips() {
		return trips;
	}

	public void setTrips(ArrayList<Trip> trips) {
		this.trips = trips;
	}

	public void addTrip(Trip trip) {
		trips.add(trip);
	}


}