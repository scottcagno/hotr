package com.cagnosolutions.starter.app

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

	// GET view marriage intensives main
	@RequestMapping(method = RequestMethod.GET)
	String intensives(Model model) {
		model.addAllAttributes([auth: (userSession.id != null)])
		"intensives/intensives"
	}
	/*
	// GET view marriage intensives divorce
	@RequestMapping(value = "/divorce", method = RequestMethod.GET)
	String divorce(Model model) {
		model.addAllAttributes([auth: (userSession.id != null)])
		"intensives/divorce"
	}

	// GET view marriage intensives schedule
	@RequestMapping(value = "/schedule", method = RequestMethod.GET)
	String schedule(Model model) {
		model.addAllAttributes([auth: (userSession.id != null)])
		"intensives/schedule"
	}

	// GET view marriage intensives testimonies
	@RequestMapping(value = "/testimonies", method = RequestMethod.GET)
	String testimonies(Model model) {
		model.addAllAttributes([auth: (userSession.id != null)])
		"intensives/testimonies"
	}

	// GET view marriage intensives reservation
	@RequestMapping(value = "/reservation", method = RequestMethod.GET)
	String reservation(Model model) {
		model.addAllAttributes([auth: (userSession.id != null)])
		"intensives/reservation"
	}
	*/
}
