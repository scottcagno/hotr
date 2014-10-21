package com.cagnosolutions.starter.app
import com.cagnosolutions.starter.app.user.User
import com.cagnosolutions.starter.app.user.UserService
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.ExceptionHandler
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.servlet.mvc.support.RedirectAttributes

import static org.springframework.web.bind.annotation.RequestMethod.GET
/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@CompileStatic
@Controller(value = "homeController")
class HomeController {

    @RequestMapping(value = ["/", "/home"], method = GET)
    String index() {
        "home"
    }

    @RequestMapping(value = "/login", method = GET)
    String login(Model model) {
		model.addAttribute "login", true
        "login"
    }

    @RequestMapping(value = "/terms", method = GET)
    String terms() {
        "terms"
    }

    @RequestMapping(value = "/donate", method = GET)
    String donate() {
        "donate"
    }
}

@CompileStatic
@Controller(value = "authController")
class Authentication {

    @Autowired
    UserService userService

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    String register(User user, RedirectAttributes attr) {
        if(userService.canUpdate(user.id, user.username)) {
            if(user.id == null || user.password[0] != '$')
                user.password = new BCryptPasswordEncoder().encode(user.password)
			user.challenge = false
			user.progress = new ArrayList<Long>()
            userService.save user
            attr.addFlashAttribute "alertSuccess", "${user.name} has successfully been regestered, please login"
			attr.addFlashAttribute("username", user.username)
            return "redirect:/login"
        }
        attr.addFlashAttribute "alertError", "Unable to register, ${user.username} may already be taken"
        "redirect:/login"
    }
}

@CompileStatic
@Controller(value = "errorController")
class ErrorHandler {

    @ExceptionHandler(value = [Exception.class, RuntimeException.class])
    String errors(Exception e, Model model) {
        def stack = []
        for (frame in e.getStackTrace()) {
            stack << frame.toString()
        }
        model.addAllAttributes([message: e.getLocalizedMessage(), exception: stack.join('\n')])
        "error"
    }
}
