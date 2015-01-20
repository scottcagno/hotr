package com.cagnosolutions.starter.app
import com.cagnosolutions.starter.app.email.EmailService
import com.cagnosolutions.starter.app.user.User
import com.cagnosolutions.starter.app.user.UserService
import com.cagnosolutions.starter.app.user.UserSession
import com.cagnosolutions.starter.app.validators.UserRegistrationValidator
import com.cagnosolutions.starter.app.validators.ValidationWrapper
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.servlet.mvc.support.RedirectAttributes

import javax.validation.Valid
import java.security.Principal
/**
 * Created by greg on 12/11/14.
 */

@CompileStatic
@Controller(value = "authController")
class AuthController {

	@Autowired
	UserService userService

	@Autowired
	UserSession userSession

	@Autowired
	EmailService emailService

	@Autowired
	ValidationWrapper validationWrapper

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
		userSession.progress = user.progress.size()
		attr.addFlashAttribute("alert", "Welcome ${user.firstName} ${(user.spouseName == null || user.spouseName == "") ? "" : "and ${user.spouseName} "}${user.lastName}")
		"redirect:${(redirect == null || redirect == "") ? "/secure/user" : redirect}"
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
	String register(@Valid UserRegistrationValidator userRegistrationValidator, BindingResult bindingResult, RedirectAttributes attr) {
		if (bindingResult.hasErrors()) {
			attr.addFlashAttribute("alertError", "Error in the registration form")
			attr.addFlashAttribute "errors", validationWrapper.bindErrors(bindingResult)
			attr.addFlashAttribute "user", userRegistrationValidator
			return "redirect:/register"
		}
		def user = userService.generateFromValidator userRegistrationValidator
		if (userService.canUpdate(user.id, user.username)) {
			if (user.id == null || user.password[0] != '$')
				user.password = new BCryptPasswordEncoder().encode(user.password)
			user.challenge = false
			user.monthly = false
			user.progress = new ArrayList<Long>()
			userService.save user
			def map = [:]
			map.put("name", "${user.firstName} ${user.lastName}")
			emailService.send("noreply@fantheflamedates.com", user.username, "Registration", "Registration", "email/registration.ftl", map)
			attr.addFlashAttribute "alertSuccess", "${user.firstName} ${user.lastName} has successfully been regestered, please login"
			attr.addFlashAttribute("username", user.username)
			return "redirect:/login"
		}
		attr.addFlashAttribute "alertError", "Unable to register, ${user.username} may already be taken"
		"redirect:/login"
	}

	@RequestMapping(value = "/socialisregistered", method = RequestMethod.POST)
	@ResponseBody
	Boolean socialMedia(User user) {
		if (userService.canUpdate(user.id, user.username)) {
			return false
		} else {
			return true
		}
	}

	@RequestMapping(value = "/social/register", method = RequestMethod.POST)
	@ResponseBody
	Boolean socialRegister(User user) {
		if (userService.canUpdate(user.id, user.username)) {
			user.password = new BCryptPasswordEncoder().encode("social")
			user.challenge = false
			user.monthly = false
			user.progress = new ArrayList<Long>()
			userService.save user
			def map = [:]
			map.put("name", "${user.firstName} ${user.lastName}")
			emailService.send("noreply@fantheflamedates.com", user.username, "Registration", "Registration", "email/registration.ftl", map)
			return true
		} else {
			return false
		}
	}
}
