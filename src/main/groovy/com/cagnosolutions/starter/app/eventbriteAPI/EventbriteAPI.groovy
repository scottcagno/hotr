package com.cagnosolutions.starter.app.eventbriteAPI
import groovy.transform.CompileStatic
import org.springframework.stereotype.Service
import org.springframework.web.client.RestTemplate

/**
 * Created by greg on 12/12/14.
 */

@CompileStatic
@Service(value = "eventbriteApiService")
class EventbriteAPI {


	/*HttpURLConnection makeApiCall(String method, String url, String... param) throws Exception {
		HttpURLConnection con = (HttpURLConnection) new URL(url).openConnection()
		con.setRequestMethod(method)
		con.setRequestProperty("User-Agent", "Mozilla/5.0")
		con.setRequestProperty("Content-Type", "application/json")
		con.setRequestProperty("Accept", "application/json")
		if (param.length > 0) {
			con.setRequestProperty("Accept-Language", "en-US,en;q=0.5")
			con.setDoOutput(true)
			DataOutputStream wr = new DataOutputStream(con.getOutputStream())
			wr.writeBytes(param[0])
			wr.flush()
			wr.close()
		}
		con.getResponseCode()
		con
	}

	Object getEvents() {
		//ObjectMapper mapper = new ObjectMapper()
		//mapper.readValue(makeApiCall("GET", "https://www.eventbriteapi.com/v3/users/8985290817/owned_events/?status=all&order_by=start_desc&token=552J7G7UP6ECQQQD4DF7").getInputStream(), Map.class)
		def inStream = makeApiCall("GET", "https://www.eventbriteapi.com/v3/users/8985290817/owned_events/?status=all&order_by=start_desc&token=552J7G7UP6ECQQQD4DF7").getInputStream()
		inStream.getText()
	}*/

	List<Event> findEvents() {
		def template = new RestTemplate()
		def eventbrite = template.getForObject("https://www.eventbriteapi.com/v3/users/8985290817/owned_events/?status=live&order_by=start_desc&token=552J7G7UP6ECQQQD4DF7", EventBrite.class) as EventBrite
		eventbrite.events
	}

}
