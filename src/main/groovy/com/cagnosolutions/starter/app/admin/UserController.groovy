package com.cagnosolutions.starter.app.admin

import com.cagnosolutions.starter.app.user.User
import com.cagnosolutions.starter.app.user.UserService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.servlet.mvc.support.RedirectAttributes

/**
 * Created by greg on 9/9/14.
 */
@Controller(value = "adminUserController")
@RequestMapping(value = "/admin/user")
class UserController {

	@Autowired
	UserService userService

	@RequestMapping(method = RequestMethod.GET)
	String view(Model model) {
		model.addAttribute("users", userService.findAll())
		"admin/user/user"
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	String edit(@PathVariable Long id, Model model) {
		model.addAllAttributes([users : userService.findAll(), user : userService.findOne(id)])
		"admin/user"
	}

	@RequestMapping(method = RequestMethod.POST)
	String save(User user, RedirectAttributes attr) {
		userService.save(user)
		attr.addFlashAttribute("alertSuccess", "Successfully saved user")
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.POST)
	String delete(@PathVariable Long id, RedirectAttributes attr) {
		userService.delete(id)
		attr.addFlashAttribute("alertSuccess", "Successfully deleted user")
		"redirect:/admin/user"
	}
}
