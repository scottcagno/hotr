package com.cagnosolutions.starter.app.user

import com.cagnosolutions.starter.app.worksheet.WorksheetService
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.servlet.mvc.support.RedirectAttributes

import java.security.Principal
/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@CompileStatic
@Controller(value = "userController")
@RequestMapping(value = "/user")
class UserController {

    @Autowired
    UserService userService

	@Autowired
	WorksheetService worksheetService

    @RequestMapping(method = RequestMethod.GET)
    String viewAll(Model model, Principal principal) {
		User user = userService.findOne(principal.name)
		def worksheets = worksheetService.findAllByUserId user.id
        model.addAllAttributes([user : user, worksheets : worksheets])
        "user/user"
    }

	// POST update
	@RequestMapping(method = RequestMethod.POST)
	String update(User user, String confirm, RedirectAttributes attr) {
		if(userService.canUpdate(user.id, user.username)) {
			if (user.password == confirm) {
				User existingUser = userService.findOne(user.id)
				userService.mergeProperties(user, existingUser)
				if (existingUser.password[0] != '$') {
					existingUser.password = new BCryptPasswordEncoder().encode(existingUser.password)\
				}
				userService.save existingUser
				attr.addFlashAttribute("alertSuccess", "Updated Successfully")
				return "redirect:/user"
			}
			// pass and confirm do not match
			attr.addFlashAttribute "alertError", "Password and confirm do not match"
		} else {
			attr.addFlashAttribute "alertError", "Unable to save user ${user.name}"
		}
		return "redirect:/user"
	}

	//
	@RequestMapping(value = "/challenge", method = RequestMethod.POST)
	String startChallenge(Long userId) {
		User user = userService.findOne userId
		user.challenge = true
		userService.save user
		"redirect:/user"
	}

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    String view(@PathVariable Long id, Model model, @RequestParam(required = false) Boolean active) {
        def user = userService.findOne id
        if(active != null) {
            user.active = (active) ? 1 as short : 0 as short
            userService.save user
        }
        model.addAllAttributes([user: user, users: userService.findAll()])
        "user/user"
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.POST)
    String delete(@PathVariable Long id, RedirectAttributes attr) {
        userService.delete id
		attr.addFlashAttribute("alertSuccess", "Successfully deleted your account")
        "redirect:/home"
    }

}
