package data;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;

public class TripDetailsDAO {
	private static final String FILE_NAME = "/WEB-INF/testParse.csv";
	/*
	 * Use Autowired to have Spring inject an instance of a
	 * WebApplicationContext into this object after creation. We will use the
	 * WebApplicationContext to retrieve an ServletContext so we can read from a
	 * file.
	 */
	@Autowired
	private WebApplicationContext wac;

	/*
	 * The @PostConstruct method is called by Spring after object creation and
	 * dependency injection
	 */
	@PostConstruct
	public void init() {
		// Retrieve an input stream from the servlet context
		// rather than directly from the file system
		System.out.println("In the DETAILS init");
		try (InputStream is = wac.getServletContext().getResourceAsStream(FILE_NAME);
				BufferedReader buf = new BufferedReader(new InputStreamReader(is));) {
			String line = buf.readLine();
			while ((line = buf.readLine()) != null) {
				String[] tokens = line.split("}");
				System.out.println("In the splitter");
				System.out.println(tokens);

			}
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
			System.out.println("in catch");
		}
	}
}
