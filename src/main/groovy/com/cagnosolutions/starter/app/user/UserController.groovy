package com.cagnosolutions.starter.app.user
import com.cagnosolutions.starter.app.video.Video
import com.cagnosolutions.starter.app.video.VideoService
import com.cagnosolutions.starter.app.worksheet.WorksheetService
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.servlet.mvc.support.RedirectAttributes
/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@CompileStatic
@Controller(value = "userController")
@RequestMapping(value = "/secure/user")
class UserController {

    @Autowired
    UserService userService

	@Autowired
	WorksheetService worksheetService

	@Autowired
	VideoService videoService

	@Autowired
	UserSession userSession

	// GET user
    @RequestMapping(method = RequestMethod.GET)
    String view(Model model) {
		User user = userService.findOne userSession.id
		def worksheets = worksheetService.findAllByUserId user.id
		List<Video> recent
		if (user.progress.size() >= 5) {
			def ids = user.progress.subList((user.progress.size() - 5), user.progress.size())
			recent = videoService.findAll(ids)
		} else {
			recent = videoService.findAll(user.progress)
		}
        model.addAllAttributes([user : user, worksheets : worksheets, recent : recent, userSession : userSession])
        "user/user"
    }

	// POST update
	@RequestMapping(method = RequestMethod.POST)
	String update(User user, RedirectAttributes attr) {
		if(userService.canUpdate(user.id, user.username)) {
			User existingUser = userService.findOne(user.id)
			user.password = (user.password == "") ? null : user.password
			userService.mergeProperties(user, existingUser)
			if (existingUser.password[0] != '$') {
				existingUser.password = new BCryptPasswordEncoder().encode(existingUser.password)
			}
			userService.save existingUser
			attr.addFlashAttribute("alertSuccess", "Updated Successfully")
			return "redirect:/secure/user"
		} else {
			attr.addFlashAttribute "alertError", "Unable to save user ${user.firstName} ${user.lastName}"
		}
		return "redirect:/secure/user"
	}

	// POST begin challenge
	@RequestMapping(value = "/challenge", method = RequestMethod.POST)
	String startChallenge(Long userId) {
		User user = userService.findOne userId
		user.challenge = true
		userService.save user
		"redirect:/secure/user"
	}

}
