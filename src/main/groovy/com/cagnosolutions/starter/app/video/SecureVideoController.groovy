package com.cagnosolutions.starter.app.video

import com.cagnosolutions.starter.app.question.QuestionService
import com.cagnosolutions.starter.app.tag.TagService
import com.cagnosolutions.starter.app.user.User
import com.cagnosolutions.starter.app.user.UserService
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam

import java.security.Principal

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@CompileStatic
@Controller(value = "secureVideoController")
@RequestMapping(value = "/secure/{hash}/video")
class SecureVideoController {

    @Autowired
    VideoService videoService

	@Autowired
	TagService tagService

	@Autowired
	QuestionService questionService

	@Autowired
	UserService userService

	// GET secure all videos
    @RequestMapping(method = RequestMethod.GET)
    String viewAll(@PathVariable String hash, @RequestParam(required = false) String tag, @RequestParam(required = false) String filter, Model model) {
		if (tag == null) {
			switch (filter) {
				case "popular":
					model.addAttribute "videos", videoService.findAll()
					break
				case "recent":
					model.addAttribute "videos", videoService.findAllRecentlyAdded()
					break
				case "category":
					model.addAttribute "videos", videoService.findAll()
					break
			}
		} else {
			model.addAttribute("videos", videoService.findAllByTag(tag))
		}
        "video/videos"
    }

	// GET secure video
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    String view(@PathVariable Long id, @PathVariable String hash, Model model) {
        model.addAllAttributes([video: videoService.findOne(id), tags : tagService.findAllByVideo(id)])
		User user = userService.findOneByHashedUsername hash
		if (id in user.progress) {
			model.addAttribute("alertWarning", "You have already watched this video. You can watch it " +
					"again but it will not count towards your challenge progress")
		}
		model.addAllAttributes([questions : questionService.findAllByVideo(id), user : user])
		"video/video_q"
    }
}