package data;

public class Yelp {
	private String id;
	private String url;
	private String imageUrl;
	
	public Yelp(){
	}
	
	public Yelp(String id, String url, String imageUrl) {
		this.id = id;
		this.url = url;
		this.imageUrl = imageUrl;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	

}
