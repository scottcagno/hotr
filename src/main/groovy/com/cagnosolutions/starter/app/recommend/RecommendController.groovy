package com.cagnosolutions.starter.app.recommend

import com.cagnosolutions.starter.app.util.email.EmailService
import com.cagnosolutions.starter.app.user.UserService
import com.cagnosolutions.starter.app.user.UserSession
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.servlet.mvc.support.RedirectAttributes

@CompileStatic
@Controller
@RequestMapping("/secure/recommend")
class RecommendController {

	@Autowired
	UserService userService

	@Autowired
	UserSession userSession

	@Autowired
	EmailService emailService

	// GET recommend
	@RequestMapping(method = RequestMethod.GET)
	String recommend(Model model) {
		model.addAllAttributes([auth: true])
		"recommend"
	}

	// POST recommend fan the flame dates
	@RequestMapping(method =RequestMethod.POST)
	String sendRecommend(@RequestParam(value = "emails") List<String> emails, RedirectAttributes attr) {
		def user = userService.findOne userSession.id
		def map = [:]
		def name = (user.spouseName != null && user.spouseName != "") ?
				"${user.firstName} and ${user.spouseName} ${user.lastName}" :
				"${user.firstName} ${user.lastName}"
		map.put("name", name)
		def first = (user.spouseName != null && user.spouseName != "") ?
				"${user.firstName} and ${user.spouseName} have" :
				"${user.firstName} has"
		map.put("first", first)
		emailService.send("noreply@fantheflamedates.com", user.username, emails, "Try Fan the Flame Dates", "Try Fan The Flame Dates", "email/recommend.ftl", map, ["hotr", "ftfd"])
		attr.addFlashAttribute("alertSuccess", "Thanks for recommending us!")
		"redirect:/home"
	}

}
