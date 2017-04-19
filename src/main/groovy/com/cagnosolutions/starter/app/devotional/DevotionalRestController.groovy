package com.cagnosolutions.starter.app.devotional

import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RestController

@CompileStatic
@RestController
@RequestMapping("/devotional/rest")
@CrossOrigin(methods = [RequestMethod.OPTIONS, RequestMethod.POST, RequestMethod.GET])
class DevotionalRestController {

	@Autowired
	DevotionalService devotionalService

	@RequestMapping(method = RequestMethod.GET)

}
