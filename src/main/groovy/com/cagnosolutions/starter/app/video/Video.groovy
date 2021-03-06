package com.cagnosolutions.starter.app.video

import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.Table

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@Entity
@Table(name = "video")
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
		// &nbsp; HTML space

		//def dif = 45 - name.length()
		//def  spaces = new ArrayList(Collections.nCopies((dif -1), "&#160;"))
		//spaces.add(0, name)
		//spaces.add("X")

		//return spaces.join("")
		name
	}
}