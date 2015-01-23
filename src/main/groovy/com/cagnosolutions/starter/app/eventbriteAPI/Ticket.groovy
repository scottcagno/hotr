package com.cagnosolutions.starter.app.eventbriteAPI

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import groovy.transform.CompileStatic

@CompileStatic
@JsonIgnoreProperties(ignoreUnknown = true)
class Ticket {

	int quantity_total
	int quantity_sold

}
