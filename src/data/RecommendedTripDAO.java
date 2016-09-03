package data;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;

public class RecommendedTripDAO {
	private static final String FILE_NAME = "/WEB-INF/recommendations.csv";
	private HashMap<Integer, RecommendedTrip> recommendations = new HashMap<>();
	
	@Autowired
	private WebApplicationContext wac;
	
	@PostConstruct
	public void init() {
		System.out.println("In recommend init");
		try (InputStream is = wac.getServletContext().getResourceAsStream(FILE_NAME);
				BufferedReader buf = new BufferedReader(new InputStreamReader(is));
				) {
			String line = buf.readLine();
			int index = 1;
			while ((line = buf.readLine()) != null) {
				String[] tokens = line.split(",");
				String city = tokens[0];
				String state = tokens[1];
				String imgUrl = tokens[2];
				recommendations.put(index++, new RecommendedTrip(city, state, imgUrl));
				System.out.println(recommendations);
			}
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
			System.out.println("in catch");
		}
	}

	public HashMap<Integer, RecommendedTrip> getRecommendations() {
		return recommendations;
	}

	public void setRecommendations(HashMap<Integer, RecommendedTrip> recommendations) {
		this.recommendations = recommendations;
	}
	
	public RecommendedTrip[] getRandomTrips() {
		int random = (int) (Math.random() * getRecommendations().size() + 1);
		int random2;
		do {
			random2 = (int) (Math.random() * getRecommendations().size() + 1);
		} while (random == random2);
		RecommendedTrip[] trips = new RecommendedTrip[2];
		trips[0] = getRecommendations().get(random);
		trips[1] = getRecommendations().get(random2);
		return trips;
	
	}

}

