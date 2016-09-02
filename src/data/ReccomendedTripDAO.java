package data;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;

public class ReccomendedTripDAO {
	private static final String FILE_NAME = "/WEB-INF/recommendations.csv";
	private HashMap<Integer, ReccomendedTrip> recommendations = new HashMap<>();
	
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
				recommendations.put(index++, new ReccomendedTrip(city, state, imgUrl));
				System.out.println(recommendations);
			}
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
			System.out.println("in catch");
		}
	}

	public HashMap<Integer, ReccomendedTrip> getRecommendations() {
		return recommendations;
	}

	public void setRecommendations(HashMap<Integer, ReccomendedTrip> recommendations) {
		this.recommendations = recommendations;
	}
	

}

