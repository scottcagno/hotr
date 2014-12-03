package com.cagnosolutions.starter.app.topic
import com.cagnosolutions.starter.app.video.VideoService
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.ResponseBody

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@CompileStatic
@Controller(value = "topicController")
@RequestMapping(value = "/topic")
class TopicController {

    @Autowired
    TopicService topicService

    @Autowired
    VideoService videoService

    @RequestMapping(method = RequestMethod.GET)
    String viewAll(Model model) {
        model.addAttribute "topics", topicService.findAll()
        "video/topic"
    }

    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    String topicWatched(@RequestParam(value = "topicIds") List<String> topicIds, Long videoId) {
        topicService.topicWatched(topicIds)
        videoService.videoWatched(videoId)
        "DONE"
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    String view(@PathVariable Long id, Model model) {
        def video = topicService.findOne id
        model.addAllAttributes([video: video, videos: topicService.findAll()])
        "video/topic"
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.POST)
    String delete(@PathVariable Long id) {
        topicService.delete id
        "redirect:/secure/topic"
    }

}