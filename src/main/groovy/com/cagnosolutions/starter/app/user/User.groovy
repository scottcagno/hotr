package com.cagnosolutions.starter.app.user

import groovy.transform.CompileStatic
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id

@CompileStatic
@Entity
class User {

	@Id
	@GeneratedValue
	Long id

	String firstName, lastName, spouseName, spouseEmail, username, password, role = "ROLE_USER"
	Date creation, lastSeen, lastWatched
	Boolean challenge, social
	Boolean monthly = true
	ArrayList<Long> progress
	short active = 1

}