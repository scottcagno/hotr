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
@Controller(value = "videoController")
@RequestMapping(value = "/video")
class VideoController {

    @Autowired
    VideoService videoService

	@Autowired
	TagService tagService

	@Autowired
	QuestionService questionService

	@Autowired
	UserService userService

	// GET all videos
    @RequestMapping(method = RequestMethod.GET)
    String viewAll(@RequestParam(required = false) String tag, @RequestParam(required = false) String filter, Model model) {
		switch (filter) {
			case "popular":
				model.addAttribute "videos", videoService.findAll()
				break
			case "recent":
				model.addAttribute "videos", videoService.findAll()
				break
			case "category":
				model.addAttribute "videos", videoService.findAll()
				break
		}
		if (tag == null) {
	        model.addAttribute "videos", videoService.findAll()
		} else {
			model.addAttribute("videos", videoService.findAllByTag(tag))
		}
        "video/videos"
    }

	// GET video
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    String view(@PathVariable Long id, Model model) {
        model.addAllAttributes([video: videoService.findOne(id), tags : tagService.findAllByVideo(id)])
		return "video/video"
    }
}