package com.cagnosolutions.starter.app.passwordReset

import com.cagnosolutions.starter.app.email.EmailService
import com.cagnosolutions.starter.app.user.UserService
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.servlet.mvc.support.RedirectAttributes

@CompileStatic
@Controller
@RequestMapping(value = "/reset/password")
class PasswordResetController {

	@Autowired
	UserService userService

	@Autowired
	EmailService emailService

	@RequestMapping(method = RequestMethod.GET)
	String resetPassword() {
		"password"
	}

	@RequestMapping(method = RequestMethod.POST)
	String resetPasswordAction(@RequestParam String username, RedirectAttributes attr) {
		def user = userService.findOne username
		if (user == null || user.id == null) {
			attr.addFlashAttribute "alertError", "Unable to find user ${username}!"
			return "redirect:/reset/password"
		}
		def pass = newPasswordHash()
		user.password = new BCryptPasswordEncoder().encode(pass)
		userService.save user
		emailService.send("Password Reset <reset@example.com>", username, "Reset Password Request",
				"A password reset has been requested for this account. You may now login using the temporary password " +
						"listed below:\n\n\t${pass}\n\n" +
						"After logging in, please make sure you reset your password.")
		attr.addFlashAttribute "alert", "An email has been sent to ${username} with a new temporary password"
		"redirect:/reset/password"
	}

	String newPasswordHash() {
		def pool = ['a'..'z','A'..'Z',0..9].flatten()
		Random rand = new Random(System.currentTimeMillis())
		def passChars = (0..10).collect { pool[rand.nextInt(pool.size())] }
		passChars.join('')
	}
}