package com.cagnosolutions.starter.app.admin
import com.cagnosolutions.starter.app.user.UserSession
import com.cagnosolutions.starter.app.worksheet.WorksheetService
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod

@CompileStatic
@Controller
@RequestMapping("/admin/email")
class AdminEmailController {

	@Autowired
	UserSession userSession

	@Autowired
	WorksheetService worksheetService

	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	String registrationEmail(Model model) {
		if (userSession.id != null) {
			model.addAttribute("name", userSession.firstName + " " + userSession.lastName)
		}
		"email/registration"
	}

	@RequestMapping(value = "/worksheet", method = RequestMethod.GET)
	String worksheetEmail(Model model) {
		if (userSession.id != null) {
			model.addAttribute("name", userSession.firstName + " " + userSession.lastName)
			def worksheets = worksheetService.findAllByUserId(userSession.id)
			if (worksheets.size() > 0) {
				model.addAttribute("worksheet", worksheets[0])
			}
		}
		"email/worksheet"
	}

	@RequestMapping(value = "/reminder", method = RequestMethod.GET)
	String reminderEmail(Model model) {
		if (userSession.id != null) {
			model.addAttribute("name", userSession.firstName + " " + userSession.lastName)
		}
		"email/reminder"
	}

	@RequestMapping(value = "/recommend", method = RequestMethod.GET)
	String recomendEmail(Model model) {
		if (userSession.id != null) {
			model.addAttribute("name", userSession.firstName + " " + userSession.lastName)
			model.addAttribute("first", userSession.firstName)
		}
		"email/recommend"
	}

	@RequestMapping(value = "/anonWorksheet", method = RequestMethod.GET)
	String recomendAnonWorksheet(Model model) {
		if (userSession.id != null) {
			def worksheets = worksheetService.findAllByUserId(userSession.id)
			if (worksheets.size() > 0) {
				model.addAttribute("worksheet", worksheets[0])
			}
		}
		"email/anonWorksheet"
	}

	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	String contactUsEmail(Model model) {
		"email/contact"
	}

}
