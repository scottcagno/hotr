package com.cagnosolutions.starter.app

import com.cagnosolutions.starter.app.user.User
import com.cagnosolutions.starter.app.user.UserService
import com.cagnosolutions.starter.app.user.UserSession
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.servlet.mvc.support.RedirectAttributes

import java.security.Principal

/**
 * Created by greg on 12/11/14.
 */
@Controller(value = "authController")
class AuthController {

	@Autowired
	UserService userService

	@Autowired
	UserSession userSession


	@RequestMapping(value = "/login/success", method = RequestMethod.GET)
	String customLoginSuccessHandler(Principal principal, String redirect, String role, RedirectAttributes attr) {
		if (role == "admin") {
			return "redirect:${redirect}"
		}
		def user = userService.findOne principal.name
		userSession.id = user.id
		userSession.firstName = user.firstName
		userSession.lastName = user.lastName
		userSession.spouseName = (user.spouseName == null) ? "" : user.spouseName
		user.lastSeen = new Date()
		userService.save user
		attr.addFlashAttribute("alert", "Welcome ${user.firstName} ${(user.spouseName == null || user.spouseName == "") ? "" : "and ${user.spouseName} "}${user.lastName}")
		"redirect:${redirect}"
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	String login(Model model) {
		model.addAttribute "login", true
		"login"
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	String register(Model model) {
		model.addAttribute "register", true
		"login"
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	String register(User user, RedirectAttributes attr) {
		if (userService.canUpdate(user.id, user.username)) {
			if (user.id == null || user.password[0] != '$')
				user.password = new BCryptPasswordEncoder().encode(user.password)
			user.challenge = false
			user.progress = new ArrayList<Long>()
			userService.save user
			attr.addFlashAttribute "alertSuccess", "${user.firstName} ${user.lastName} has successfully been regestered, please login"
			attr.addFlashAttribute("username", user.username)
			return "redirect:/login"
		}
		attr.addFlashAttribute "alertError", "Unable to register, ${user.username} may already be taken"
		"redirect:/login"
	}
}
