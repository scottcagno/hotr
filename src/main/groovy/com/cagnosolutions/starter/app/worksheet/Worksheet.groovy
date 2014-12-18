package com.cagnosolutions.starter.app.worksheet
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
/**
 * Created by greg on 10/22/14.
 */

@Entity
class Worksheet {

	@Id
	@GeneratedValue
	Long Id
	Long userId, videoId
	@Column(columnDefinition="VARCHAR(1000)")
	String htmlData
	@Column(length = 1000)
	String videoName
	Date completed

}
