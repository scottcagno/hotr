package com.cagnosolutions.starter.app

import com.cagnosolutions.starter.app.admin.settings.SettingsService
import com.cagnosolutions.starter.app.devotional.DevotionalService
import com.cagnosolutions.starter.app.eventbriteAPI.EventbriteAPI
import com.cagnosolutions.starter.app.topic.TopicService
import com.cagnosolutions.starter.app.user.UserSession
import com.cagnosolutions.starter.app.util.email.EmailService
import com.cagnosolutions.starter.app.video.VideoService
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.core.io.FileSystemResource
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.servlet.mvc.support.RedirectAttributes

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
	SettingsService adminSettingsService

	@Autowired
	DevotionalService devotionalService

	@Autowired
	EmailService emailService

	// GET home
    @RequestMapping(value = ["/", "/home"], method = RequestMethod.GET)
    String index(Model model) {
		def settings = adminSettingsService.findOne()
		def vidId = (settings != null) ? settings.videoId : 0L
        model.addAllAttributes([auth : (userSession.id != null),
								topics: topicService.popTopics(),
								video: videoService.findOne(vidId),
								recentVideos: videoService.findAllRecentlyAdded(),
								recentDevotionals: devotionalService.findAllRecentlyAdded()])
        "home"
    }

	// GET terms
    @RequestMapping(value = "/terms", method = RequestMethod.GET)
    String terms(Model model) {
        model.addAttribute("auth", (userSession.id != null))
        "terms"
    }

	// GET about
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	String about(Model model) {
		model.addAttribute("auth", (userSession.id != null))
		"about"
	}

	// GET contact
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	String contact(Model model) {
		model.addAttribute("auth", (userSession.id != null))
		"contact"
	}

	// POST contect
	@RequestMapping(value = "/contact", method = RequestMethod.POST)
	String sendContact(String name, String email, String comment, RedirectAttributes attr) {
		def dat = new HashMap<String, Object>(){{
			put("email", email)
			put("name", name)
			put("comment", comment)
		}}
		emailService.send("contact@fantheflamedates.com", "jeffreykime@gmail.com", "Contact Us Page", comment, "email/contact.ftl", dat)
		attr.addFlashAttribute("alertSuccess", "Thank you for reaching out to us.")
		"redirect:/contact"
	}

	// GET events
	@RequestMapping(value = "/events", method = RequestMethod.GET)
	String events(Model model) {
		model.addAllAttributes([auth: (userSession.id != null), events : eventbriteApiService.findEvents()])
		"events"
	}

	// GET donate
    @RequestMapping(value = "/donate", method = RequestMethod.GET)
    String donate(Model model) {
        model.addAttribute("auth", (userSession.id != null))
        "donate"
    }

	// GET promo
    @RequestMapping(value = "/promo", method = RequestMethod.GET)
    String promo(Model model) {
        model.addAttribute("auth", (userSession.id != null))
        "promo"
    }

	// GET challenge
    @RequestMapping(value = "/challenge", method = RequestMethod.GET)
    String challenge(Model model) {
        model.addAttribute("auth", (userSession.id != null))
		model.addAttribute("userSession", userSession)
        "challenge"
    }

	// GET uploaded images
	@RequestMapping(value = "/image/{filename}.{type}", method = RequestMethod.GET, produces = "image/*")
	@ResponseBody
	FileSystemResource file(@PathVariable String filename, @PathVariable String type) {
		new FileSystemResource(new File("opt/images/${filename}.${type}"))
	}

}


