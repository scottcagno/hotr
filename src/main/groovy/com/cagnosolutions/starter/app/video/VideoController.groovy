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

    @RequestMapping(method = RequestMethod.GET)
    String viewAll(@RequestParam(required = false) String tag, Model model) {
		if (tag == null) {
	        model.addAttribute "videos", videoService.findAll()
		} else {
			model.addAttribute("videos", videoService.findAllByTag(tag))
		}
        "video/video"
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    String view(@PathVariable Long id, Model model) {
        def video = videoService.findOne id
		def tags = tagService.findAllByVideo(id)
        model.addAllAttributes([video: video, tags : tags])
        "video/view"
    }
}