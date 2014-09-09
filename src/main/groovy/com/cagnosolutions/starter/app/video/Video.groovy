package com.cagnosolutions.starter.app.video

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
    String name, description, thumb, vimeoId

	String toString() {
		if (name.length() > 20)
			return name.substring(0, 19) + "..."
		name
	}
}