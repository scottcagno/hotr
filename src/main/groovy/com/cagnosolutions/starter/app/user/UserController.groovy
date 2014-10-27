package com.cagnosolutions.starter.app.user

import com.cagnosolutions.starter.app.video.Video
import com.cagnosolutions.starter.app.video.VideoService
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
@RequestMapping(value = "/secure/{hash}/user")
class UserController {

    @Autowired
    UserService userService

	@Autowired
	WorksheetService worksheetService

	@Autowired
	VideoService videoService

    @RequestMapping(method = RequestMethod.GET)
    String view(Model model, @PathVariable String hash) {
		User user = userService.findOneByHashedUsername hash
		def worksheets = worksheetService.findAllByUserId user.id
		List<Video> recent
		if (user.progress.size() >= 5) {
			def ids = user.progress.subList((user.progress.size() - 5), user.progress.size())
			recent = videoService.findAll(ids)
		} else {
			recent = videoService.findAll(user.progress)
		}
        model.addAllAttributes([user : user, worksheets : worksheets, recent : recent])
        "user/user"
    }

	// POST update
	@RequestMapping(method = RequestMethod.POST)
	String update(@PathVariable String hash, User user, String confirm, RedirectAttributes attr) {
		if(userService.canUpdate(user.id, user.username)) {
			if (user.password == confirm) {
				User existingUser = userService.findOne(user.id)
				userService.mergeProperties(user, existingUser)
				if (existingUser.password[0] != '$') {
					existingUser.password = new BCryptPasswordEncoder().encode(existingUser.password)\
				}
				userService.save existingUser
				attr.addFlashAttribute("alertSuccess", "Updated Successfully")
				return "redirect:/secure/${hash}/user"
			}
			// pass and confirm do not match
			attr.addFlashAttribute "alertError", "Password and confirm do not match"
		} else {
			attr.addFlashAttribute "alertError", "Unable to save user ${user.name}"
		}
		return "redirect:/secure/${hash}/user"
	}

	//
	@RequestMapping(value = "/challenge", method = RequestMethod.POST)
	String startChallenge(@PathVariable String hash, Long userId) {
		User user = userService.findOne userId
		user.challenge = true
		userService.save user
		"redirect:/secure/${hash}/user"
	}

}
