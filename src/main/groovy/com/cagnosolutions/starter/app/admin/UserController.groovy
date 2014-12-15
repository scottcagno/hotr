package com.cagnosolutions.starter.app.admin

import com.cagnosolutions.starter.app.user.User
import com.cagnosolutions.starter.app.user.UserService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.servlet.mvc.support.RedirectAttributes

/**
 * Created by greg on 9/9/14.
 */
@Controller(value = "adminUserController")
@RequestMapping(value = "/admin/user")
class UserController {

	@Autowired
	UserService userService

	// GET users
	@RequestMapping(method = RequestMethod.GET)
	String view(Model model) {
		model.addAttribute("users", userService.findAll())
		"admin/user/user"
	}

	// POST add/edit user
	@RequestMapping(method = RequestMethod.POST)
	String save(User user, RedirectAttributes attr) {
		if(userService.canUpdate(user.id, user.username)) {
			User existingUser = userService.findOne(user.id)
			if (existingUser != null) {
				user.password = (user.password == '') ? null : user.password
				userService.mergeProperties(user, existingUser)
				if (existingUser.password[0] != '$') {
					existingUser.password = new BCryptPasswordEncoder().encode(existingUser.password)
				}
				userService.save existingUser
			} else {
				user.progress = new ArrayList<>()
				userService.save user
			}
			attr.addFlashAttribute("alertSuccess", "Updated Successfully")
		} else {
			attr.addFlashAttribute "alertError", "Unable to save user ${user.firstName} ${user.lastName}"
		}
		"redirect:/admin/user"
	}

	// GET one user and display all users
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	String edit(@PathVariable Long id, @RequestParam(required = false) Boolean active, Model model) {
		def user = userService.findOne id
		if(active != null) {
			user.active = (active) ? 1 as short : 0 as short
			userService.save user
		}
		model.addAllAttributes([users : userService.findAll(), user : userService.findOne(id)])
		"admin/user/user"
	}

	// POST delete user
	@RequestMapping(value = "/del/{id}", method = RequestMethod.POST)
	String delete(@PathVariable Long id, RedirectAttributes attr) {
		userService.delete(id)
		attr.addFlashAttribute("alertSuccess", "Successfully deleted user")
		"redirect:/admin/user"
	}
}
