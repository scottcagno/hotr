package com.cagnosolutions.starter.app

import com.cagnosolutions.starter.app.user.UserSession
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.RequestMapping

import static org.springframework.web.bind.annotation.RequestMethod.GET

@Controller
@RequestMapping("/intensives")
class IntensivesController {

	@Autowired
	UserSession userSession

	@RequestMapping(method = GET)
	String intensives(Model model) {
		model.addAllAttributes([auth: (userSession.id != null)])
		"intensives/intensives"
	}

	@RequestMapping(value = "/divorce", method = GET)
	String divorce(Model model) {
		model.addAllAttributes([auth: (userSession.id != null)])
		"intensives/divorce"
	}

	@RequestMapping(value = "/schedule", method = GET)
	String schedule(Model model) {
		model.addAllAttributes([auth: (userSession.id != null)])
		"intensives/schedule"
	}

	@RequestMapping(value = "/testimonies", method = GET)
	String testimonies(Model model) {
		model.addAllAttributes([auth: (userSession.id != null)])
		"intensives/testimonies"
	}

	@RequestMapping(value = "/reservation", method = GET)
	String reservation(Model model) {
		model.addAllAttributes([auth: (userSession.id != null)])
		"intensives/reservation"
	}

}
