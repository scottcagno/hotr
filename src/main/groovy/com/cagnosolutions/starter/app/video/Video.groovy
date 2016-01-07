package com.cagnosolutions.starter.app.video

import groovy.transform.CompileStatic
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id

@CompileStatic
@Entity
class Video {

	@Id
	@GeneratedValue
	Long id
    String name, thumb, vimeoId, series
	@Column(length = 1000)
	String description
	Date added
	Integer watched

	String toString() {
		if (name.length() > 15)
			return name.substring(0, 14) + "..."
		name
	}

}