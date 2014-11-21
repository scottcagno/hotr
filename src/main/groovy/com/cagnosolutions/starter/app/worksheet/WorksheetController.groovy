package com.cagnosolutions.starter.app.worksheet

import com.cagnosolutions.starter.app.email.Email
import com.cagnosolutions.starter.app.email.EmailService
import com.cagnosolutions.starter.app.user.User
import com.cagnosolutions.starter.app.user.UserService
import com.cagnosolutions.starter.app.user.UserSession
import com.fasterxml.jackson.databind.ObjectMapper
import freemarker.template.Configuration
import freemarker.template.Template
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.servlet.mvc.support.RedirectAttributes

/**
 * Created by greg on 10/22/14.
 */

@Controller("worksheetController")
@RequestMapping("/secure/worksheet")
class WorksheetController {

	@Autowired
	Configuration freeMarkerConfiguration

	@Autowired
	UserService userService

	@Autowired
	WorksheetService worksheetService

	@Autowired
	EmailService emailService

	@Autowired
	UserSession userSession

	// GET worksheet
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	String view(@PathVariable Long id, Model model) {
		Worksheet worksheet = worksheetService.findOne id
		model.addAttribute("worksheet", worksheet)
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
		println user.challenge
		if (!(worksheet.videoId in user.progress) && user.challenge && user.progress.size() <= 12) {
			user.progress << worksheet.videoId
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
			map.put("name", user.name)
			map.put("worksheet", worksheet)
			Email mail = emailService.CreateEmail("email/email.ftl", map)
			mail.setAll("noreply@fantheflamedates.com", "Worksheet for video ${worksheet.videoName}", user.username)
			println mail.to
			emailService.sendEmailThreaded(mail)
		}
		if (send) {
			// email to ffd
		}
		attr.addFlashAttribute("worksheet", worksheet)
		"redirect:/secure/video/id/${worksheet.videoId}"
	}
}
