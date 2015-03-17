package com.cagnosolutions.starter.app.admin

import javax.persistence.Entity
import javax.persistence.Id

@Entity
class AdminSettings {

	@Id
	Long id = 1L

	Long videoId
}
