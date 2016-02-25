package com.cagnosolutions.starter.app.eventbriteAPI;

import groovy.transform.CompileStatic;
import org.codehaus.groovy.runtime.DefaultGroovyMethods;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import java.util.ArrayList;
import java.util.List;

@CompileStatic
@Service
public class EventbriteAPI {

	public List<Event> findEvents() {
		RestTemplate template = new RestTemplate();
		EventBrite eventbrite = DefaultGroovyMethods.asType(template.getForObject("https://www.eventbriteapi.com/v3/users/8985290817/owned_events/?status=live&order_by=start_desc&token=552J7G7UP6ECQQQD4DF7", EventBrite.class), EventBrite.class);
		List<Event> eventsSorted = new ArrayList<>(eventbrite.getEvents().size());
		eventbrite.getEvents().stream().sorted((e1, e2) -> e1.getStart().get("local").compareTo(e2.getStart().get("local"))).forEach(eventsSorted::add);
		/*for (Event event: eventsSorted) {
			event.setVenue(findVenue(event.getVenue_id()));
		}*/

		return eventsSorted;
	}

	public Venue findVenue(String venueId) {
		if ("".equals(venueId)) {
			return null;
		}
		RestTemplate template = new RestTemplate();
		Venue venue = DefaultGroovyMethods.asType(template.getForObject("https://www.eventbriteapi.com/v3/venues/3213275/?token=552J7G7UP6ECQQQD4DF7", Venue.class), Venue.class);
		return venue;
	}

}
