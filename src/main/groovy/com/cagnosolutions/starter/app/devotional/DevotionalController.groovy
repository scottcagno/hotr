package com.cagnosolutions.starter.app.devotional

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

	@RequestMapping(method = RequestMethod.GET)
	String devotional(Model model) {
		model.addAllAttributes([devotionals: devotionalService.findAll(), auth: false])
		"devotional/devotional"
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	String devotionalPost(@PathVariable Long id, Model model) {
		model.addAllAttributes([devotional: devotionalService.findOne(id), devotionals: devotionalService.findAll(), auth: false])
		"devotional/devotional-post"
	}

}
