package com.cagnosolutions.starter.app.intensive

import com.cagnosolutions.starter.app.user.UserSession
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod

@Controller
@RequestMapping("/intensives")
class IntensivesController {

	@Autowired
	UserSession userSession

	@Autowired
	IntensiveService intensiveService

	// GET view marriage intensives main
	@RequestMapping(method = RequestMethod.GET)
	String intensives(Model model) {
		"redirect:https://www.themarriagehub.com/"
	}

}
