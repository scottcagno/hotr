package com.cagnosolutions.starter.app.video
import com.cagnosolutions.starter.app.question.QuestionService
import com.cagnosolutions.starter.app.topic.TopicService
import com.cagnosolutions.starter.app.user.User
import com.cagnosolutions.starter.app.user.UserService
import com.cagnosolutions.starter.app.user.UserSession
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@CompileStatic
@Controller(value = "secureVideoController")
@RequestMapping(value = "/secure/video")
class SecureVideoController {

    @Autowired
    VideoService videoService

	@Autowired
	TopicService topicService

	@Autowired
	QuestionService questionService

	@Autowired
	UserService userService

	@Autowired
	UserSession userSession

	@RequestMapping(method = RequestMethod.GET)
	String video() {
		"redirect:/secure/video/all"
	}

	// GET secure all videos
    @RequestMapping(value="/{filter}", method = RequestMethod.GET)
    String viewAll(@RequestParam(required = false) String topic,
                   @PathVariable String filter, Model model) {
		model.addAllAttributes([auth: true, topics: topicService.popTopics()])
		if (topic == null) {
			switch (filter) {
				case "all":
					model.addAttribute "videos", videoService.findAll()
					break
				case "popular":
					model.addAttribute "videos", videoService.findAllPopular()
					break
				case "recent":
					model.addAttribute "videos", videoService.findAllRecentlyAdded()
					break
				default:
					model.addAttribute "videos", videoService.findAllBySeries(filter)
					break
			}
		} else {
			model.addAttribute("videos", videoService.findAllByTopic(topic))
		}
        "video/videos"
    }

	// GET secure video
    @RequestMapping(value = "/id/{id}", method = RequestMethod.GET)
    String view(@PathVariable Long id,Model model) {
		User user = userService.findOne userSession.id
		if (id in user.progress) {
			model.addAttribute("alertWarning", "You have already watched this video. You can watch it " +
					"again but it will not count towards your challenge progress")
		}
		def video = videoService.findOne id
		video.watched++
		video = videoService.save video
		if (!user.challenge) {
			model.addAttribute("notChallenge", true)
		}
        model.addAllAttributes([video: video, topics : topicService.findAllByVideo(id),
								questions : questionService.findAllByVideo(id), user : user])
		"video/video_q"
    }

	@RequestMapping(value = "/series", method = RequestMethod.GET)
	String series(Model model) {
		model.addAllAttributes([allSeries: videoService.findAllSeries(), auth : true, topics: topicService.popTopics()])
		"video/series"
	}
}