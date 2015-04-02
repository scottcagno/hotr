package com.cagnosolutions.starter.app.series

import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id

@Entity
class Series {

	@Id
	@GeneratedValue
	Long id

	String name, thumb
	ArrayList<Long> videoIds
}
