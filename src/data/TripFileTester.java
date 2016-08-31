package data;

import java.util.ArrayList;

public class TripFileTester {
	public static void main(String[] args) {
		TripFileDAO tfd = new TripFileDAO();
		tfd.init();
		ArrayList<Trip> trips = tfd.getTrips();
		System.out.println(trips);
	}
}
