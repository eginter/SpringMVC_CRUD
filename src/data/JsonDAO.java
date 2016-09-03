package data;

import java.io.IOException;
import java.io.Reader;
import org.json.JSONException;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.beust.jcommander.JCommander;

import data.YelpAPI.YelpAPICLI;

public class JsonDAO {

	@SuppressWarnings("static-access")
	public static void main(String[] args) throws IOException, JSONException {
		YelpAPI.YelpAPICLI yelpApiCli = new YelpAPICLI();
		new JCommander(yelpApiCli, args);

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
		System.out.println("Working");
		System.out.println(json.toString());
		System.out.println("ID");
		System.out.println(json.get("snippet_text"));

	}
}