package com.cagnosolutions.starter.app.user
import groovy.transform.CompileStatic

import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.Table

@CompileStatic
@Entity
@Table(name = "user")
class User {

	@Id
	@GeneratedValue
	Long id
	String firstName, lastName, spouseName, spouseEmail, username, password, role = "ROLE_USER"
	Date creation, lastSeen
	Boolean challenge, monthly
	ArrayList<Long> progress
	short active = 1

}