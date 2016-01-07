package com.cagnosolutions.starter.app.video

import com.cagnosolutions.starter.app.question.QuestionService
import com.cagnosolutions.starter.app.series.SeriesService
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

@CompileStatic
@Controller
@RequestMapping(value = "/video")
class VideoController {

    @Autowired
    VideoService videoService

	@Autowired
	TopicService topicService
	
	@Autowired
	UserSession userSession
	
	@Autowired
	UserService userService
	
	@Autowired
	QuestionService questionService

	@Autowired
	SeriesService seriesService

	@RequestMapping(method = RequestMethod.GET)
	String video() {
		"redirect:/video/all"
	}

	// GET view all videos
    @RequestMapping(value = "/{filter}", method = RequestMethod.GET)
    String viewAll(@RequestParam(required = false) String topic, @PathVariable String filter, Model model) {
		model.addAllAttributes([auth: (userSession.id != null), topics: topicService.popTopics()])
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
					return "redirect:/video/all"
					break
			}
		} else {
			model.addAttribute("videos", videoService.findAllByTopic(topic))
		}
        "video/videos"
    }

	// GET view one video
    @RequestMapping(value = "/id/{id}", method = RequestMethod.GET)
    String view(@PathVariable Long id, Model model) {
        model.addAllAttributes([video: videoService.findOne(id), topics : topicService.findAllByVideo(id)])
		if (userSession.id == null) {
			model.addAttribute("auth", false)
			return "video/video"
		} else {
			User user = userService.findOne userSession.id
			if (id in user.progress) {
				model.addAttribute("alertWarning", "You have already watched this video. You can watch it " +
						"again but it will not count towards your challenge progress")
			}
			if (!user.challenge) {
				model.addAttribute("notChallenge", true)
			}
			model.addAllAttributes([questions : questionService.findAllByVideo(id), user : user, auth : true])
			"video/video_q"
		}
    }

	// GET view all series
	@RequestMapping(value = "/series", method = RequestMethod.GET)
	String allSeries(Model model) {
		model.addAllAttributes([allSeries: seriesService.findAll(), auth : (userSession.id != null),
								topics: topicService.popTopics()])
		"video/series"
	}

	// GET view one series
	@RequestMapping(value = "/series/{id}", method = RequestMethod.GET)
	String series(@PathVariable Long id, Model model) {
		def series = seriesService.findOne(id)
		def videos = videoService.findAll(series.videoIds)
		model.addAllAttributes([videos: videos,
								auth : (userSession.id != null),
								topics: topicService.popTopics(),
								filter: "", seriesName: series.name])
		"video/videos"
	}

	// GET view all videos related to the one just watched
	@RequestMapping(value = "/relatedto/{id}", method = RequestMethod.GET)
	String relatedTo(@PathVariable Long id, Model model) {
		def topics = topicService.findAllByVideo id
		def videoIds = topicService.videoIdsByTopics topics
		def relatedMap = [:]
		videoIds.each { vidId ->
			relatedMap[vidId] = (relatedMap[vidId] == null)? 1 : (relatedMap[vidId] as Integer) +1
		}
		relatedMap.remove id
		// sort related map by value (most related - least related)
		// create comparator
		Comparator sortByValue = new Comparator<Map.Entry<Long, Integer>>() {
			int compare(Map.Entry<Long, Integer> left, Map.Entry<Long, Integer> right) {
				return left.getValue().compareTo(right.getValue())
			}
		}
		// new list to compare from relatedMap
		def relatedList = new ArrayList<Map.Entry<Long, Integer>>()
		relatedList.addAll(relatedMap.entrySet())
		// compare
		Collections.sort(relatedList, sortByValue)
		// empty related map and repopulate with with sorted list
		relatedMap = [:]
		relatedMap.putAll(relatedList)
		// empty videIds List and repopulate with sorted map keys
		videoIds = null
		videoIds = relatedMap.keySet() as ArrayList<Long>
		videoIds = (videoIds.size() > 11)? videoIds.subList(0, 10) : videoIds
		model.addAllAttributes([videos : videoService.findAll(videoIds), auth : true, topics : topics,
								video : videoService.findOne(id), userSession : userSession])
		"video/related"
	}

}