package com.cagnosolutions.starter.app.worksheet

import com.cagnosolutions.starter.app.email.EmailService
import com.cagnosolutions.starter.app.user.User
import com.cagnosolutions.starter.app.user.UserService
import com.cagnosolutions.starter.app.user.UserSession
import com.fasterxml.jackson.databind.ObjectMapper
import freemarker.template.Configuration
import freemarker.template.Template
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.servlet.mvc.support.RedirectAttributes

@CompileStatic
@Controller
@RequestMapping("/secure/worksheet")
class WorksheetController {

	@Autowired
	Configuration freeMarkerConfiguration

	@Autowired
	UserService userService

	@Autowired
	EmailService emailService

	@Autowired
	WorksheetService worksheetService

	@Autowired
	UserSession userSession

	// GET worksheet
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	String view(@PathVariable Long id, Model model) {
		Worksheet worksheet = worksheetService.findOne id
		model.addAllAttributes([worksheet : worksheet, userSession : userSession])
		"worksheet/worksheet"
	}

	// POST delete worksheet
	@RequestMapping(value =  "/del/{id}", method = RequestMethod.POST)
	String delete(@PathVariable Long id, RedirectAttributes attr) {
		worksheetService.delete id
		attr.addFlashAttribute("alertSuccess", "Successfully deleted worksheet")
		"redirect:/secure/user"
	}

	// POST process worksheet data
	@RequestMapping(method = RequestMethod.POST)
	String add(String answers, Worksheet worksheet, RedirectAttributes attr, Boolean save, Boolean email, Boolean send) {
		User user = userService.findOne worksheet.userId
		if (!(worksheet.videoId in user.progress) && user.challenge && user.progress.size() <= 12) {
			attr.addFlashAttribute("isChallenged", true)
			user.progress << worksheet.videoId
			userSession.progress = user.progress.size()
		}
		ObjectMapper mapper = new ObjectMapper()
		def answerMap = mapper.readValue(answers, Map.class)
		Template temp = freeMarkerConfiguration.getTemplate("worksheet/htmlData.ftl")
		Map<String, Object> map = new HashMap<>()
		map.put("answerMap", answerMap)
		worksheet.htmlData = FreeMarkerTemplateUtils.processTemplateIntoString(temp, map)
		userService.save user
		if (save) {
			worksheet.completed = new Date()
			worksheetService.save worksheet
		}
		if (email) {
			// email to user

			def name = (user.spouseName != null || user.spouseName != "") ?
					"${user.firstName} and ${user.spouseName} ${user.lastName}" :
					"${user.firstName} ${user.lastName}"
			map.put("name", name)
			map.put("worksheet", worksheet)
			emailService.send("noreply@fantheflamedates.com", user.username ,"Worksheet", "Worksheet", "email/worksheet.ftl", map)
		}
		if (send) {
			// email to ffd
		}
		attr.addFlashAttribute("worksheet", worksheet)
		"redirect:/secure/video/relatedto/${worksheet.videoId}"
	}
}
