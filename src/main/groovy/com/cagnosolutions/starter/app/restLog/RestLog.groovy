package com.cagnosolutions.starter.app.restLog

import groovy.transform.CompileStatic

import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id

@CompileStatic
@Entity
class RestLog {

	@Id
	@GeneratedValue
	Long id
	Integer count = 0
	String type, date

}
