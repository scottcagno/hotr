package com.cagnosolutions.starter.app.counselor

import groovy.transform.CompileStatic

import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id

@CompileStatic
@Entity
class Counselor {

	@Id
	@GeneratedValue
	Long id

	String name, contactName, phone, email, street, city, state, zip
	Float estimatedDistance
}
