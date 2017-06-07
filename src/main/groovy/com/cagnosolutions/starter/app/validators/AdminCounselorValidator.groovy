package com.cagnosolutions.starter.app.validators

import org.hibernate.validator.constraints.NotBlank

class AdminCounselorValidator {

	Long id

	String name, contactName, phone, email, street, city, state

	@NotBlank(message = "Required field")
	String zip

}
