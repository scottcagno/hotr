package com.cagnosolutions.starter.app.worksheet

import groovy.transform.CompileStatic

import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id

@CompileStatic
@Entity
class Worksheet {

	@Id
	@GeneratedValue
	Long Id
	Long userId, videoId
	@Column(length=1000)
	String htmlData
	@Column(length = 1000)
	String videoName
	Date completed

}
