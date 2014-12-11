package com.cagnosolutions.starter.app
import com.cagnosolutions.starter.app.video.VideoService
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping

import static org.springframework.web.bind.annotation.RequestMethod.GET
/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@CompileStatic
@Controller(value = "homeController")
class RootController {

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


