package com.cagnosolutions.starter.app.question
import groovy.transform.CompileStatic

import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id

@CompileStatic
@Entity
class Question {

	@Id
	@GeneratedValue
	Long id
	Long video_fk
	String question
	String inputType
	ArrayList<String> options
}
