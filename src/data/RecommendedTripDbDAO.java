package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import javax.annotation.PostConstruct;

public class RecommendedTripDbDAO {
	private static final String url = "jdbc:mysql://localhost:3306/traveldb";
	private static final String user = "application";
	private static final String pass = "application";

	public RecommendedTripDbDAO() {
		// TODO Auto-generated constructor stub
	}

	private HashMap<Integer, RecommendedTrip> recommendations = new HashMap<>();

	@PostConstruct
	public void init() {
		try {

			Connection conn;
			conn = DriverManager.getConnection(url, user, pass);
			String sqltxt;
			sqltxt = "SELECT l.city, l.state r.img_url," + "FROM recommendation r " + "JOIN location l "
					+ "ON r.location_id = l.id";
			PreparedStatement stmt = conn.prepareStatement(sqltxt);
			ResultSet rs = stmt.executeQuery();
			int index = 1;
			while (rs.next()) {
				recommendations.put(index++, new RecommendedTrip(rs.getString(1), rs.getString(2), rs.getString(3)));
			}
			System.out.println(recommendations);
			rs.close();
			stmt.close();
			conn.close();

		} catch (SQLException sqle) {
			// TODO Auto-generated catch block
			sqle.printStackTrace();
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
