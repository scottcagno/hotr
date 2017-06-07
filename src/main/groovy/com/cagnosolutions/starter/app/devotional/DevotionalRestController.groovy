package com.cagnosolutions.starter.app.devotional

import com.cagnosolutions.starter.app.restLog.RestLogService
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.*

@CompileStatic
@RestController
@RequestMapping("/devotional/rest")
@CrossOrigin(methods = [RequestMethod.OPTIONS, RequestMethod.POST, RequestMethod.GET])
class DevotionalRestController {

	@Autowired
	DevotionalService devotionalService

	@Autowired
	RestLogService restLogService

	@RequestMapping(method = RequestMethod.GET)
	List<Devotional> devotionalAll(Integer page, Integer count) {
		restLogService.save("devotional-many")
		devotionalService.findAll((page? page-1 : 0), (count? count : 20))
	}

	@RequestMapping(value="/{id}", method = RequestMethod.GET)
	Devotional devotional(@PathVariable Long id) {
		restLogService.save("devotional-one")
		devotionalService.findOne id
	}

}
