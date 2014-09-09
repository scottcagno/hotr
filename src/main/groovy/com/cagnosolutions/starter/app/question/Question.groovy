package com.cagnosolutions.starter.app.question

import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.Table

/**
 * Created by greg on 9/9/14.
 */

@Entity
@Table(name = "question")
class Question {

	@Id
	@GeneratedValue
	Long id
	Long video_fk
	String question
	String inputType
	ArrayList<String> options
}
