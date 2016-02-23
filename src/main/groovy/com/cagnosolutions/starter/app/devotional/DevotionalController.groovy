package com.cagnosolutions.starter.app.devotional

import com.cagnosolutions.starter.app.user.UserSession
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod

@CompileStatic
@Controller
@RequestMapping(value = "/devotional")
class DevotionalController {

	@Autowired
	DevotionalService devotionalService

	@Autowired
	UserSession userSession

	// GET view all devotionals
	@RequestMapping(method = RequestMethod.GET)
	String devotional(Model model) {
		model.addAllAttributes([devotionals: devotionalService.findAll(), auth: (userSession.id != null)])
		"devotional/devotional"
	}

	// GET view one devotional
	@RequestMapping(value = "/{slug}", method = RequestMethod.GET)
	String devotionalPost(@PathVariable String slug, Model model) {
		model.addAllAttributes([devotional: devotionalService.findOneBySlug(slug), devotionals: devotionalService.findAll(), auth: (userSession.id != null)])
		"devotional/devotional-post"
	}

}
