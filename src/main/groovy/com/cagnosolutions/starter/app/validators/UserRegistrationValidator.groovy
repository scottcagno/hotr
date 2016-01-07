package com.cagnosolutions.starter.app.validators

import groovy.transform.CompileStatic
import org.hibernate.validator.constraints.Email
import org.hibernate.validator.constraints.NotBlank

@CompileStatic
class UserRegistrationValidator {

	@NotBlank(message = "Required field")
	String firstName

	@NotBlank(message = "Required field")
	String lastName

	@NotBlank(message = "Required field")
	@Email(message = "Must be a valid email address")
	String username

	@NotBlank(message = "Required field")
	String password

}
