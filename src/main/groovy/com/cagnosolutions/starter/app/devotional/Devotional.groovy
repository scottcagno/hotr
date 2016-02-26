package com.cagnosolutions.starter.app.devotional

import groovy.transform.CompileStatic
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id

@CompileStatic
@Entity
class Devotional {

	@Id
	@GeneratedValue
	Long id
	Date date
	String title
	@Column(length = 100000)
	String body
	String thumb
	String slug

	def createSlug() {
		slug = title.replaceAll("[;/?:@&=+\\\$,\\{\\}\\|\\\\^\\[\\]`]", "").trim().replace(' ', '_').toLowerCase()
	}
}

