package com.cagnosolutions.starter.app.util.email

import groovy.transform.CompileStatic
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod

@CompileStatic
@Controller
@RequestMapping(value = "/email")
class EmailController {

	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	String contectEmail(Model model) {
		model.addAttribute("name", "Greg Pechiro")
		model.addAttribute("email", "gregpechiro@gmail.com")
		model.addAttribute("comment", "I am interested in something.\nPlease email me about it, Greg")
		"email/contact"
	}

}
