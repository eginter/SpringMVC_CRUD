package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import javax.annotation.PostConstruct;

public class TripDbDAO implements TripDAO {
	private static final String url = "jdbc:mysql://localhost:3306/traveldb";
	private static final String user = "application";
	private static final String pass = "application";
	private HashMap<Integer, Trip> trips = null;

	public TripDbDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace(System.err);
		}
		// TODO Auto-generated constructor stub
	}

	@PostConstruct
	public void init() {
		System.out.println("In init DB block");
		try {
			trips = new HashMap<>();
			Connection conn;
			conn = DriverManager.getConnection(url, user, pass);
			String sqltxt;
			sqltxt = "SELECT  t.id, l.city, l.state, t.start_date, t.end_date " + "FROM trip t " + "JOIN location l "
					+ "ON t.location_id = l.id";
			PreparedStatement stmt = conn.prepareStatement(sqltxt);
			ResultSet rs = stmt.executeQuery();
			int index = 1;
			while (rs.next()) {
				this.trips.put(index++,
						new Trip(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
			}
			System.out.println(trips);
			rs.close();
			stmt.close();
			conn.close();

		} catch (SQLException sqle) {
			// TODO Auto-generated catch block
			sqle.printStackTrace();
		}

	}

	@Override
	public void addTrip(Trip trip) {

		try {
			Connection conn;
			conn = DriverManager.getConnection(url, user, pass);
			int newLocationId = 0;
			try {
				String sqltxt;
				sqltxt = "INSERT INTO location (state, city) VALUES (?, ?)";
				PreparedStatement stmt = conn.prepareStatement(sqltxt, Statement.RETURN_GENERATED_KEYS);
				stmt.setString(1, trip.getState());
				stmt.setString(2, trip.getCity());
				int uc = stmt.executeUpdate();
				if (uc == 1) {
					ResultSet keys = stmt.getGeneratedKeys();
					if (keys.next()) {
						newLocationId = keys.getInt(1);
						System.out.println("Location added: " + newLocationId);
					}
				}
			} catch (SQLException se) {
				System.out.println("ignoring duplicates...");
			}

			String sqltxt;
			sqltxt = "INSERT INTO trip (location_id, start_date, end_date) VALUES (?, ?, ?)";
			PreparedStatement stmt = conn.prepareStatement(sqltxt);
			stmt.setInt(1, newLocationId);
			stmt.setString(2, trip.getStartDate());
			stmt.setString(3, trip.getEndDate());
			int uc = stmt.executeUpdate();
			if (uc > 0) {
				System.out.println("" + uc + " updates made.");
			}
			init();
			stmt.close();
			conn.close();

		} catch (SQLException sqle) {
			// TODO Auto-generated catch block
			sqle.printStackTrace();
		}

	}

	@Override
	public void deleteTrip(int index) {

		try {
			Connection conn;
			conn = DriverManager.getConnection(url, user, pass);
			String sqltxt;
			sqltxt = "DELETE FROM trip WHERE id = ?";
			PreparedStatement stmt = conn.prepareStatement(sqltxt);
			stmt.setInt(1, index);
			stmt.executeUpdate();
			stmt.close();
			conn.close();
			init();
		} catch (SQLException se) {
			System.out.println(se);
		}
	}

	@Override
	public void editTrip(int index, String city, String state, String startDate, String endDate) {

		try {
			Connection conn;
			conn = DriverManager.getConnection(url, user, pass);
			System.out.println("Getting location_id...");

			String sqltxt = "SELECT location_id FROM trip WHERE id = ?";
			PreparedStatement stmt = conn.prepareStatement(sqltxt);
			stmt.setInt(1, index);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {

				System.out.println("Got location Id : " + rs.getInt(1));

				sqltxt = "UPDATE location SET state = ?, city = ? WHERE id = ?";
				stmt = conn.prepareStatement(sqltxt);
				stmt.setString(1, state);
				stmt.setString(2, city);
				stmt.setInt(3, rs.getInt(1));
				stmt.executeUpdate();

				System.out.println("Updated location");

			}
			sqltxt = "UPDATE trip SET start_date = ? , end_date = ? WHERE id = ?";
			stmt = conn.prepareStatement(sqltxt);
			stmt.setString(1, startDate);
			stmt.setString(2, endDate);
			stmt.setInt(3, index);
			int uc = stmt.executeUpdate();
			if (uc > 0) {
				System.out.println("" + uc + " updates made.");
			}

			System.out.println("Updated trip");
			init();
			stmt.close();
			conn.close();

		} catch (SQLException sqle) {
			// TODO Auto-generated catch block
			sqle.printStackTrace();
		}

	}

	@Override
	public HashMap<Integer, Trip> getTrips() {
		init();
		return trips;
	}

	public void setTrips(HashMap<Integer, Trip> trips) {
		this.trips = trips;
	}

	@Override
	public Trip getTripByIndex(int index) {

		for (int key : trips.keySet()) {
			if (trips.get(key).getIndex() == index) {
				return trips.get(key);
			}
		}
		return null;
	}

}
