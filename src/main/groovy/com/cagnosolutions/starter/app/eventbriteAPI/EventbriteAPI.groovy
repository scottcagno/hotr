package com.cagnosolutions.starter.app.eventbriteAPI
import groovy.transform.CompileStatic
import org.springframework.stereotype.Service
import org.springframework.web.client.RestTemplate

@CompileStatic
@Service
class EventbriteAPI {

	List<Event> findEvents() {
		def template = new RestTemplate()
		def eventbrite = template.getForObject("https://www.eventbriteapi.com/v3/users/8985290817/owned_events/?status=live&order_by=start_desc&token=552J7G7UP6ECQQQD4DF7", EventBrite.class) as EventBrite
		eventbrite.events
	}

}
