package com.cagnosolutions.starter.app.eventbriteAPI

import com.fasterxml.jackson.annotation.JsonIgnoreProperties

/**
 * Created by greg on 12/12/14.
 */

@JsonIgnoreProperties(ignoreUnknown = true)
class EventBrite {

	List<Event> events

}
