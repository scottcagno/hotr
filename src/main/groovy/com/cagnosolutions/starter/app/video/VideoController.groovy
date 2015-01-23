package com.cagnosolutions.starter.app.video

import com.cagnosolutions.starter.app.topic.TopicService
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam

@CompileStatic
@Controller
@RequestMapping(value = "/video")
class VideoController {

    @Autowired
    VideoService videoService

	@Autowired
	TopicService topicService

	// GET all videos
    @RequestMapping(value = "/{filter}", method = RequestMethod.GET)
    String viewAll(@RequestParam(required = false) String topic, @PathVariable String filter, Model model) {
		model.addAllAttributes([auth: false, topics: topicService.popTopics()])
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

	// GET video
    @RequestMapping(value = "/id/{id}", method = RequestMethod.GET)
    String view(@PathVariable Long id, Model model) {
		def video = videoService.findOne id
        model.addAllAttributes([video: video, topics : topicService.findAllByVideo(id)])
		return "video/video"
    }

	@RequestMapping(value = "/series", method = RequestMethod.GET)
	String series(Model model) {
		model.addAllAttributes([allSeries: videoService.findAllSeries(), auth : false, 
								topics: topicService.popTopics()])
		"video/series"
	}
}