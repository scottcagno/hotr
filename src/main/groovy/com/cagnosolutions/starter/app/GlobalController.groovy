package com.cagnosolutions.starter.app
import com.cagnosolutions.starter.app.user.User
import com.cagnosolutions.starter.app.user.UserService
import com.cagnosolutions.starter.app.user.UserSession
import com.cagnosolutions.starter.app.video.VideoService
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.ExceptionHandler
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.servlet.mvc.support.RedirectAttributes

import java.security.Principal

import static org.springframework.web.bind.annotation.RequestMethod.GET
/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@CompileStatic
@Controller(value = "homeController")
class HomeController {

    @Autowired
    VideoService videoService

    @RequestMapping(value = ["/", "/home"], method = GET)
    String index(Model model) {
        model.addAttribute("auth", false)
        "home"
    }

	@RequestMapping(value = "/secure/home", method = GET)
	String indexSecure(Model model) {
        model.addAttribute("auth", true)
		"home"
	}

    @RequestMapping(value = "/terms", method = GET)
    String terms(Model model) {
        model.addAttribute("auth", false)
        "terms"
    }

	@RequestMapping(value = "/secure/terms", method = GET)
	String termsSecure(Model model) {
        model.addAttribute("auth", true)
		"terms"
	}

    @RequestMapping(value = "/donate", method = GET)
    String donate(Model model) {
        model.addAttribute("auth", false)
        "donate"
    }

	@RequestMapping(value = "/secure/donate", method = GET)
	String donateSecure(Model model) {
        model.addAttribute("auth", true)
		"donate"
	}

    @RequestMapping(value = "/promo", method = GET)
    String promo(Model model) {
        model.addAttribute("auth", false)
        "promo"
    }

    @RequestMapping(value = "/secure/promo", method = GET)
    String promoSecure(Model model) {
        model.addAttribute("auth", true)
        "promo"
    }

    @RequestMapping(value = "/challenge", method = GET)
    String challenge(Model model) {
        model.addAttribute("auth", false)
        "challenge"
    }

    @RequestMapping(value = "/secure/challenge", method = GET)
    String challengeSecure(Model model) {
        model.addAttribute("auth", true)
        "challenge"
    }

    @RequestMapping(value = "/social/{id}", method = GET)
    String social(Model model, @PathVariable Long id) {
        model.addAttribute("video", videoService.findOne(id))
        "social"
    }

}

@Controller(value = "authController")
class Authentication {

    @Autowired
    UserService userService

    @Autowired
    UserSession userSession


    @RequestMapping(value = "/login/success", method = RequestMethod.GET)
    String customLoginSuccessHandler(Principal principal, String redirect, String role, RedirectAttributes attr) {
        if (role == "admin") {
           return  "redirect:${redirect}"
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

    @RequestMapping(value = "/login", method = GET)
    String login(Model model) {
        model.addAttribute "login", true
        "login"
    }

    @RequestMapping(value = "/register", method = GET)
    String register(Model model) {
        model.addAttribute "register", true
        "login"
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    String register(User user, RedirectAttributes attr) {
        if(userService.canUpdate(user.id, user.username)) {
            if(user.id == null || user.password[0] != '$')
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
