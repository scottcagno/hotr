package com.cagnosolutions.starter.app.admin.settings

import javax.persistence.Entity
import javax.persistence.Id

@Entity
class Settings {

	@Id
	Long id = 1L

	Long videoId
	String prim, dang, succ, warn, info, defa

}
