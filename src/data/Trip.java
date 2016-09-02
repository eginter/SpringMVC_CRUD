package data;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;


public class Trip {
	private static int counter;
	private int index;
	private String city;
	private String state;
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private LocalDate startDate;
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private LocalDate endDate;
	
	public Trip(){
		this.index = ++counter;
	}
	
	public Trip(String city, String state, LocalDate startDate, LocalDate endDate) {
		this.index = ++counter;
		System.out.println("making trip objs: " + counter);
		this.city = city;
		this.state = state;
		this.setStartDate(startDate);
		this.setEndDate(endDate);
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	

	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public static int getCounter() {
		return counter;
	}
	public static void setCounter(int counter) {
		Trip.counter = counter;
	}

	public LocalDate getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}

	public LocalDate getEndDate() {
		return endDate;
	}

	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}
}
