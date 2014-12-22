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
		if (name.length() > 45)
			return name.substring(0, 44) + "..."
		//String.format("%-45s", name)
		name + "                                   "
	}
}