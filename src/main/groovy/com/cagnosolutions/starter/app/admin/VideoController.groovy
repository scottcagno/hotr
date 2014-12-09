package com.cagnosolutions.starter.app.admin
import com.cagnosolutions.starter.app.VimeoApi.VimeoAPI
import com.cagnosolutions.starter.app.question.QuestionService
import com.cagnosolutions.starter.app.topic.TopicService
import com.cagnosolutions.starter.app.video.Video
import com.cagnosolutions.starter.app.video.VideoService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.servlet.mvc.support.RedirectAttributes
/**
 * Created by greg on 9/3/14.
 */

@Controller(value = "adminVideoController")
@RequestMapping(value = "/admin/video")
class VideoController {

	@Autowired
	VideoService videoService

	@Autowired
	VimeoAPI vimeoAPI

	@Autowired
	TopicService topicService

	@Autowired
	QuestionService questionService

	// GET view all
	@RequestMapping(method = RequestMethod.GET)
	String all(Model model) {
		model.addAttribute("videos", videoService.findAll())
		"admin/video/list"
	}

	// GET add
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	String add(Model model) {
		model.addAttribute("allSeries", videoService.findAllSeries())
		"admin/video/add"
	}

	// GET edit
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	String edit(@PathVariable Long id, Model model) {
		model.addAttribute("video", videoService.findOne(id))
		model.addAttribute("topics", topicService.findAllByVideo(id))
		model.addAttribute("allSeries", videoService.findAllSeries())
		model.addAttribute("questions", questionService.findAllByVideo(id))
		"admin/video/edit"
	}

	// POST add/edit
	@RequestMapping(method = RequestMethod.POST)
	String update(Video video, RedirectAttributes attr, @RequestParam String topics) {
		if (video.id == null) {
			// new video
			video = videoService.save video
			vimeoAPI.getThumb(video.id, video.vimeoId)
			try {
				vimeoAPI.addEmbedPreset(video.vimeoId)
				vimeoAPI.addPrivacy(video.vimeoId)
				video.watched = 0
				attr.addFlashAttribute("alertSuccess", "Successfully updated video")
			} catch (all) {
				all.printStackTrace()
				attr.addFlashAttribute("alertError", "Video information was saved successfully but we received a bad response when" +
						"contacting Vimeo. Please check the video on Vimeo in 30-60 minutes to ensure proper upload.")
			}
		} else {
			// existing video
			def existingVideo = videoService.findOne video.id
			videoService.mergeProperties(video, existingVideo)
			videoService.save existingVideo
			attr.addFlashAttribute("alertSuccess", "Successfully updated video")
		}
		// add/remove topics
		topicService.videoTopics(topics, video.id)
		"redirect:/admin/video"
	}

	// GET upload
	@RequestMapping(value="/upload", method = RequestMethod.GET)
	String upload(Model model) {
		def redirect = "redirect_url=node2.cagnosolutions.com/admin/video/add"
		//def redirect = "redirect_url=localhost:8080/admin/video/add"
		try {
			// TODO: change redirect_url when live
			model.addAttribute("upload", vimeoAPI.postInfo("https://api.vimeo.com/me/videos", redirect))
		} catch (all) {
			all.printStackTrace()
		}
		"admin/video/upload"
	}

	// POST delete
	@RequestMapping(value = "/del/{id}", method = RequestMethod.POST)
	String delete(@PathVariable Long id, RedirectAttributes attr) {
		def video = videoService.findOne id
		vimeoAPI.deleteVideo video.vimeoId
		videoService.delete video
		topicService.deleteAllByVideo id
		questionService.deleteAllByVideo id
		attr.addFlashAttribute("alertSuccess", "Successfully deleted video")
		"redirect:/admin/video"
	}

	// GET thumbnail request
	@RequestMapping(value = "/thumb/{id}", method = RequestMethod.POST)
	String thumb(@PathVariable Long id, RedirectAttributes attr) {
		def video = videoService.findOne id
		vimeoAPI.getThumb(video.id, video.vimeoId)
		attr.addFlashAttribute("alertSuccess", "Successfully sent thumbnail request. Please 5-10 for a thumbnail response")
		"redirect:/admin/video/${id}"
	}
}
