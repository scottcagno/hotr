package com.cagnosolutions.starter.app.blog

import groovy.transform.CompileStatic
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id

@CompileStatic
@Entity
class Blog {

	@Id
	@GeneratedValue
	Long id
	Date date
	String title
	@Column(length = 10000)
	String body

	String toString() {
		"$id, $date, $title, $body"
	}
}
