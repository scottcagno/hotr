package com.cagnosolutions.starter.app.admin

import com.cagnosolutions.starter.app.VimeoAPI.VimeoAPI
import com.cagnosolutions.starter.app.question.QuestionService
import com.cagnosolutions.starter.app.topic.TopicService
import com.cagnosolutions.starter.app.validators.ValidationWrapper
import com.cagnosolutions.starter.app.validators.VideoValidator
import com.cagnosolutions.starter.app.video.VideoService
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.servlet.mvc.support.RedirectAttributes
import javax.validation.Valid

@CompileStatic
@Controller
@RequestMapping(value = "/admin/video")
class AdminVideoController {

	@Autowired
	VideoService videoService

	@Autowired
	VimeoAPI vimeoAPI

	@Autowired
	TopicService topicService

	@Autowired
	QuestionService questionService

	@Autowired
	ValidationWrapper validationWrapper

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
		if (!model.containsAttribute("video")) {
			model.addAttribute("video", videoService.findOne(id))
		}
		model.addAllAttributes([topics : topicService.findAllByVideo(id),
								allSeries : videoService.findAllSeries(),
								questions : questionService.findAllByVideo(id)])
		"admin/video/edit"
	}

	// POST add/edit
	@RequestMapping(method = RequestMethod.POST)
	String save(@Valid VideoValidator videoValidator, BindingResult bindingResult, RedirectAttributes attr, @RequestParam String topics) {
		if (bindingResult.hasErrors()) {
			attr.addFlashAttribute("alertError", "Error in the video form")
			attr.addFlashAttribute "errors", validationWrapper.bindErrors(bindingResult)
			attr.addFlashAttribute("video", videoValidator)
			attr.addFlashAttribute("topics", topics)
			return "redirect:${(videoValidator.id == null || videoValidator.id == "") ? "/admin/video/add?video_uri=/videos/${videoValidator.vimeoId}" : "/admin/video/${videoValidator.id}"}"
		}
		def video = videoService.generateFromValidator videoValidator

		if (video.id == null) {
			// new video
			video.watched = 0
			video = videoService.saveAndFlush video
			vimeoAPI.settings(video.id, video.vimeoId)
		} else {
			// existing video
			def existingVideo = videoService.findOne video.id
			videoService.mergeProperties(video, existingVideo)
			videoService.save existingVideo
		}
		// add/remove topics
		topicService.videoTopics(topics, video.id)
		attr.addFlashAttribute("alertSuccess", "Successfully updated video")
		"redirect:/admin/video"
	}

	// GET upload
	@RequestMapping(value="/upload", method = RequestMethod.GET)
	String upload(Model model) {
		//def redirect = "redirect_url=node2.cagnosolutions.com/admin/video/add"
		//def redirect = "redirect_url=localhost:9999/admin/video/add"
		def redirect = "redirect_url=fantheflamedates.com/admin/video/add"
		try {
			// TODO: change redirect_url when live
			model.addAttribute("upload", vimeoAPI.postInfo("https://api.vimeo.com/me/videos", redirect))
		} catch (all) {
			all.printStackTrace()
			model.addAttribute("alertError", "Error contacting Vimeo")
			return "Redirect:/admin/video"
		}
		"admin/video/upload"
	}

	// POST delete
	@RequestMapping(value = "/del/{id}", method = RequestMethod.POST)
	String delete(@PathVariable Long id, RedirectAttributes attr) {
		def video = videoService.findOne id
		try {
			vimeoAPI.deleteVideo video.vimeoId
		} catch(all) {
			all.printStackTrace()
			attr.addFlashAttribute("alertError", "Error contacting Vimeo")
			return "Redirect:/admin/video"
		}
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
		vimeoAPI.settings(video.id, video.vimeoId)
		attr.addFlashAttribute("alertSuccess", "Successfully sent thumbnail request. Please wait 5-10 minutes for a thumbnail response")
		"redirect:/admin/video/${id}"
	}

}
