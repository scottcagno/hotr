package com.cagnosolutions.starter.app.validators
import groovy.transform.CompileStatic
import org.hibernate.validator.constraints.Email
import org.hibernate.validator.constraints.NotBlank

@CompileStatic
class AdminEditUserValidator {

	Long id

	Short active

	Boolean monthly

	@NotBlank(message = "Required field")
	String firstName

	@NotBlank(message = "Required field")
	String lastName

	@NotBlank(message = "Required field")
	@Email(message = "Must be a valid email address")
	String username

	String password

	String role

	String spouseName

	String spouseEmail
}
