package com.cagnosolutions.starter.app

import com.cagnosolutions.starter.app.admin.AdminSettingsService
import com.cagnosolutions.starter.app.eventbriteAPI.EventbriteAPI
import com.cagnosolutions.starter.app.topic.TopicService
import com.cagnosolutions.starter.app.user.UserSession
import com.cagnosolutions.starter.app.video.VideoService
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.RequestMapping

import static org.springframework.web.bind.annotation.RequestMethod.GET

@CompileStatic
@Controller
class RootController {

    @Autowired
    EventbriteAPI eventbriteApiService

    @Autowired
    UserSession userSession

	@Autowired
	TopicService topicService

	@Autowired
	VideoService videoService

	@Autowired
	AdminSettingsService adminSettingsService

    @RequestMapping(value = ["/", "/home"], method = GET)
    String index(Model model) {
        model.addAllAttributes([auth : (userSession.id != null),
								topics: topicService.popTopics(),
								video: videoService.findOne(adminSettingsService.findOne().videoId)])
        "home"
    }

    @RequestMapping(value = "/terms", method = GET)
    String terms(Model model) {
        model.addAttribute("auth", (userSession.id != null))
        "terms"
    }

	@RequestMapping(value = "/about", method = GET)
	String about(Model model) {
		model.addAttribute("auth", (userSession.id != null))
		"about"
	}

	@RequestMapping(value = "/contact", method = GET)
	String contact(Model model) {
		model.addAttribute("auth", (userSession.id != null))
		"contact"
	}

	@RequestMapping(value = "/events", method = GET)
	String events(Model model) {
		model.addAllAttributes([auth: (userSession.id != null), events : eventbriteApiService.findEvents()])
		"events"
	}

    @RequestMapping(value = "/donate", method = GET)
    String donate(Model model) {
        model.addAttribute("auth", (userSession.id != null))
        "donate"
    }

    @RequestMapping(value = "/promo", method = GET)
    String promo(Model model) {
        model.addAttribute("auth", (userSession.id != null))
        "promo"
    }

    @RequestMapping(value = "/challenge", method = GET)
    String challenge(Model model) {
        model.addAttribute("auth", (userSession.id != null))
		model.addAttribute("userSession", userSession)
        "challenge"
    }

}


