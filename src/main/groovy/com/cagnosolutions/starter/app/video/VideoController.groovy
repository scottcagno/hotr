package com.cagnosolutions.starter.app.video

import com.cagnosolutions.starter.app.tag.TagService
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
@Controller(value = "videoController")
@RequestMapping(value = "/video")
class VideoController {

    @Autowired
    VideoService videoService

	@Autowired
	TagService tagService

	// GET all videos
    @RequestMapping(value = "/{filter}", method = RequestMethod.GET)
    String viewAll(@RequestParam(required = false) String tag, @PathVariable String filter, Model model) {
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

	// GET video
    @RequestMapping(value = "/id/{id}", method = RequestMethod.GET)
    String view(@PathVariable Long id, Model model) {
        model.addAllAttributes([video: videoService.findOne(id), tags : tagService.findAllByVideo(id)])
		return "video/video"
    }

	@RequestMapping(value = "/category", method = RequestMethod.GET)
	String category(Model model) {
		model.addAttribute("categories", videoService.findCategories())
		"video/category"
	}
}