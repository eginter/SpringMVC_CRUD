package data;

public class RecommendedTrip {
	String city;
	String state;
	String imgUrl;
	
	public RecommendedTrip() {
		System.out.println("In rec constructor");
	}
	
	public RecommendedTrip(String city, String state, String imgUrl) {
		System.out.println("In rec constructor");
		this.city = city;
		this.state = state;
		this.imgUrl = imgUrl;
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
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
}
