package data;

public class Trip {
	private int index;
	private String city;
	private String state;
	private String startDate;
	private String endDate;
	
	public Trip(){
//		this.index = ++counter;
	}
	
	public Trip(int index, String city, String state, String startDate, String endDate) {
		this.index = index;
		System.out.println("making trip objs: " + index);
		this.city = city;
		this.state = state;
		this.startDate = startDate;
		this.endDate = endDate;
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
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}

}
