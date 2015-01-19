package com.cagnosolutions.starter.app.eventbriteAPI

import com.fasterxml.jackson.annotation.JsonIgnoreProperties

/**
 * Created by greg on 12/12/14.
 */

@JsonIgnoreProperties(ignoreUnknown = true)
class Ticket {

	int quantity_total
	int quantity_sold


}
