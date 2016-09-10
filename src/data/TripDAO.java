package data;

import java.util.HashMap;

public interface TripDAO {

	
	public HashMap<Integer, Trip> getTrips();
	public Trip getTripByIndex(int index);
	public void init();
	public void addTrip(Trip trip);
	public void editTrip(int index, String city, String state, String startDate, String endDate);
	void deleteTrip(int index);
}
