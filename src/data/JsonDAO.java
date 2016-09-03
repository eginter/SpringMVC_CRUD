package data;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import data.YelpAPI.YelpAPICLI;

public class JsonDAO {

	public Yelp parseYelp(String location) {
		YelpAPI.setDEFAULT_LOCATION(location);
		YelpAPI.YelpAPICLI yelpApiCli = new YelpAPICLI();

		YelpAPI yelpApi = new YelpAPI("sF2kY12N-TMqvet0kKv8QA", "Hol3KlgbKozzsNvbHk9OUTJYARM",
				"5fVlH6zvGE_McmvBqki2-DllBykAWA6X", "xN7ZF-NipbV0axN_uCd03mT6YPE");

		JSONParser parser = new JSONParser();
		JSONObject json = null;
		try {
			json = (JSONObject) parser.parse(YelpAPI.queryAPI(yelpApi, yelpApiCli));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String id = (String) json.get("id");
		id = id.replace("-", " ");
		String url = (String) json.get("url");
		String image = (String) json.get("image_url");

		return new Yelp(id, url, image);
	}

}