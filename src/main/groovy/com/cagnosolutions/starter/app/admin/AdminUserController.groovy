package com.cagnosolutions.starter.app.admin

import com.cagnosolutions.starter.app.user.User
import com.cagnosolutions.starter.app.user.UserService
import com.cagnosolutions.starter.app.validators.AdminAddUserValidator
import com.cagnosolutions.starter.app.validators.AdminEditUserValidator
import com.cagnosolutions.starter.app.validators.ValidationWrapper
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.servlet.mvc.support.RedirectAttributes

import javax.validation.Valid

@CompileStatic
@Controller
@RequestMapping(value = "/admin/user")
class AdminUserController {

	@Autowired
	UserService userService

	@Autowired
	ValidationWrapper validationWrapper

	// GET users
	@RequestMapping(method = RequestMethod.GET)
	String view(Model model) {
		model.addAttribute("users", userService.findAll())
		"admin/user/user"
	}

	// POST add user
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	String add(@Valid AdminAddUserValidator adminAddUserValidator, BindingResult bindingResult, RedirectAttributes attr) {
		if (bindingResult.hasErrors()) {
			attr.addFlashAttribute("alertError", "Error in the user form")
			attr.addFlashAttribute "errors", validationWrapper.bindErrors(bindingResult)
			return "redirect:/admin/user"
		}
		def user = userService.generateFromValidator adminAddUserValidator
		if(userService.canUpdate(user.id, user.username)) {
			user.password = new BCryptPasswordEncoder().encode(user.password)
			user.challenge = false
			user.monthly = false
			user.progress = new ArrayList<Long>()
			user.progress = new ArrayList<>()
			userService.save user
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

	// POST add/edit user
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	String edit(@Valid AdminEditUserValidator adminEditUserValidator, BindingResult bindingResult, RedirectAttributes attr) {
		if (bindingResult.hasErrors()) {
			attr.addFlashAttribute("alertError", "Error in the user form")
			attr.addFlashAttribute "errors", validationWrapper.bindErrors(bindingResult)
			return "redirect:/admin/user/${adminEditUserValidator.id}"
		}
		def user = userService.generateFromValidator adminEditUserValidator
		if(userService.canUpdate(user.id, user.username)) {
			User existingUser = userService.findOne(user.id)
			user.password = (user.password == '') ? null : user.password
			user.monthly = (user.monthly == null) ? false : user.monthly
			userService.mergeProperties(user, existingUser)
			if (existingUser.password[0] != '$') {
				existingUser.password = new BCryptPasswordEncoder().encode(existingUser.password)
			}
			userService.save existingUser
			attr.addFlashAttribute("alertSuccess", "Updated Successfully")
		} else {
			attr.addFlashAttribute "alertError", "Unable to save user ${user.firstName} ${user.lastName}"
		}
		"redirect:/admin/user"
	}


	// POST delete user
	@RequestMapping(value = "/del/{id}", method = RequestMethod.POST)
	String delete(@PathVariable Long id, RedirectAttributes attr) {
		userService.delete(id)
		attr.addFlashAttribute("alertSuccess", "Successfully deleted user")
		"redirect:/admin/user"
	}
}
