package com.cagnosolutions.starter.app.eventbriteAPI

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import groovy.transform.CompileStatic

@CompileStatic
@JsonIgnoreProperties(ignoreUnknown = true)
class Event {

	Map<String, String> name
	Map <String, Object> venue
	Map<String, String> start
	Map<String, String> end
	List<Ticket> ticket_classes
	int capacity
	String url

}
