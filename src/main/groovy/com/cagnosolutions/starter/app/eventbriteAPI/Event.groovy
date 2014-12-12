package com.cagnosolutions.starter.app.eventbriteAPI

import com.fasterxml.jackson.annotation.JsonIgnoreProperties

/**
 * Created by greg on 12/12/14.
 */

@JsonIgnoreProperties(ignoreUnknown = true)
class Event {

	Map<String, String> name
	Map <String, Object> venue
	Map<String, String> start
	Map<String, String> end
	int capacity
	String url

}
