package com.cagnosolutions.starter.app.validators
import groovy.transform.CompileStatic
import org.hibernate.validator.constraints.NotBlank

@CompileStatic
class VideoValidator {

	Long id

	@NotBlank(message = "Required field")
	String name

	String thumb
	String vimeoId
	String series

	@NotBlank(message = "Required field")
	String description

	Date added
	Integer watched
}
