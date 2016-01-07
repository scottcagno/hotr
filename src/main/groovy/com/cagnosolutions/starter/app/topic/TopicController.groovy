package com.cagnosolutions.starter.app.topic

import com.cagnosolutions.starter.app.video.VideoService
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.ResponseBody

@CompileStatic
@Controller
@RequestMapping(value = "/topic")
class TopicController {

    @Autowired
    TopicService topicService

    @Autowired
    VideoService videoService

    // POST mark topics and video watched
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    String topicWatched(@RequestParam(value = "topicIds") List<String> topicIds, Long videoId) {
        topicService.topicWatched topicIds
        videoService.videoWatched videoId
        "DONE"
    }

}