package com.cagnosolutions.starter.app.admin

import com.cagnosolutions.starter.app.VimeoApi.VimeoAPI
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
@RequestMapping(value = "/secure/video")
class VideoController {

	@Autowired
	VideoService videoService

	@Autowired
	VimeoAPI vimeoAPI

	// GET view all
	@RequestMapping(method = RequestMethod.GET)
	String all(Model model) {
		model.addAttribute("videos", videoService.findAll())
		"secure/video/list"
	}

	// GET add
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	String add(@RequestParam String video_uri, Model model) {
		try {
			model.addAttribute("vimeo", VimeoAPI.getInfo( "https://api.vimeo.com" + video_uri))
		} catch (Exception e) {

			e.printStackTrace()
		}
		"secure/video/add"
	}

	// POST add edit
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	String update(Video video, RedirectAttributes attr) {
		if (video.id == null) {
			vimeoAPI.addEmbedPreset(video.uri);
		}
		videoService.save(video)
		attr.addFlashAttribute("alertSuccess", "Successfully updated video")
		// TODO: change redirect
		"redirect:/secure/video"
	}

	// GET upload
	@RequestMapping(value="/upload", method = RequestMethod.GET)
	String upload(Model model) {
		try {
			model.addAttribute("upload", vimeoAPI.postInfo("https://api.vimeo.com/me/videos", "redirect_url=localhost:8080/secure/video/add"))
		} catch (all) {
			all.printStackTrace()
		}
		"secure/video/upload"
	}

	// POST delete
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
	String delete(@PathVariable Long id, @RequestParam String uri, RedirectAttributes attr) {
		vimeoAPI.deleteVideo(uri)
		videoService.delete(id)
		attr.addFlashAttribute("alertSuccess", "Successfully deleted video")
		"redirect:/secure/video"
	}

}
