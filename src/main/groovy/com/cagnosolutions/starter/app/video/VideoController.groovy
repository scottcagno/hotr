package com.cagnosolutions.starter.app.video

import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.servlet.mvc.support.RedirectAttributes
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

    @RequestMapping(method = RequestMethod.GET)
    String viewAll(Model model) {
        model.addAttribute "videos", videoService.findAll()
        "video/video"
    }

    @RequestMapping(method = RequestMethod.POST)
    String addOrEdit(Video video, RedirectAttributes attr) {
        if(video != null)
            if(video.id == "") {
                video.id = new Random().nextInt(55555) + 12345
                videoService.save video
            }
            else
                videoService.save video
        "redirect:/secure/video"
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    String view(@PathVariable Long id, Model model) {
        def video = videoService.findOne id
        model.addAllAttributes([video: video, videos: videoService.findAll()])
        "video/video"
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.POST)
    String delete(@PathVariable Long id) {
        videoService.delete id
        "redirect:/secure/video"
    }

	@RequestMapping(value = "/view/{id}")
	String viewVid(@PathVariable Long id, Model model) {
		model.addAttribute("video", videoService.findOne(id))
		"video/view"
	}
}