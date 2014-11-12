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

	@RequestMapping(method = RequestMethod.GET)
	String video(@PathVariable String hash) {
		"redirect:secure/${hash}/video/all"
	}

	// GET secure all videos
    @RequestMapping(value="/{filter}", method = RequestMethod.GET)
    String viewAll(@PathVariable String hash, @RequestParam(required = false) String tag,
                   @PathVariable String filter, Model model) {
		if (tag == null) {
			switch (filter) {
				case "all":
					model.addAttribute "videos", videoService.findAll()
					break
				case "popular":
					model.addAttribute "videos", videoService.findAll()
					break
				case "recent":
					model.addAttribute "videos", videoService.findAllRecentlyAdded()
					break
				default:
					model.addAttribute "videos", videoService.findAllByCategory(filter)
					break
			}
		} else {
			model.addAttribute("videos", videoService.findAllByTag(tag))
		}
        "video/videos"
    }

	// GET secure video
    @RequestMapping(value = "/id/{id}", method = RequestMethod.GET)
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

	@RequestMapping(value = "/category", method = RequestMethod.GET)
	String category(@PathVariable String hash, Model model) {
		model.addAttribute("categories", videoService.findCategories())
		"video/category"
	}
}