package com.cagnosolutions.starter.app.intensive

import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.Id

@Entity
class Intensive {

	@Id
	Long id = 1L

	@Column(length=100000)
	String htmlData

}
