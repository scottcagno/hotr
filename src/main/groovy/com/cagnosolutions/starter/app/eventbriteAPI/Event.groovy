package com.cagnosolutions.starter.app.eventbriteAPI

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import groovy.transform.CompileStatic

@CompileStatic
@JsonIgnoreProperties(ignoreUnknown = true)
class Event {

	Map<String, String> name
	String venue_id
	Venue venue
	Map <String, Object> ticket_classes
	Map<String, String> start
	Map<String, String> end
	Map<String, Object> logo
	String id
	String url

}
