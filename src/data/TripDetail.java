package data;

public class TripDetail {
	String title;
	String imageURL;
	String category;
	
	public TripDetail(){
	}
	
	public TripDetail(String title, String imageURL, String category) {
		super();
		this.title = title;
		this.imageURL = imageURL;
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImageURL() {
		return imageURL;
	}
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
}
