package com.cagnosolutions.starter.app.admin
import com.cagnosolutions.starter.app.VimeoApi.VimeoAPI
import com.cagnosolutions.starter.app.email.EmailService
import com.cagnosolutions.starter.app.tag.TagService
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

	@Autowired
	TagService tagService

	@Autowired
	EmailService emailService

	// GET view all
	@RequestMapping(method = RequestMethod.GET)
	String all(Model model) {
		model.addAttribute("videos", videoService.findAll())
		"secure/video/list"
	}

	// GET add
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	String add() {
		"secure/video/add"
	}

	// GET edit
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	String edit(@PathVariable Long id, Model model) {
		model.addAttribute("video", videoService.findOne(id))
		model.addAttribute("tags", tagService.findAllByVideo(id))
		"secure/video/edit"
	}

	// POST add/edit
	@RequestMapping(method = RequestMethod.POST)
	String update(Video video, RedirectAttributes attr, @RequestParam String tags) {
		if (video.id == null) {
			// new video
			try {
				vimeoAPI.addEmbedPreset(video.vimeoId)
				vimeoAPI.addPrivacy(video.vimeoId)
				video = videoService.save(video)
				vimeoAPI.getThumb(video.id, video.vimeoId)
			} catch (all) {
				all.printStackTrace()
			}
		} else {
			// existing video
			videoService.save(video)
		}
		// add/remove tags
		tagService.videoTags(tags, video.id)
		attr.addFlashAttribute("alertSuccess", "Successfully updated video")
		"redirect:/secure/video"
	}

	// GET upload
	@RequestMapping(value="/upload", method = RequestMethod.GET)
	String upload(Model model) {
		try {
			// TODO: change redirect_url when live
			model.addAttribute("upload", vimeoAPI.postInfo("https://api.vimeo.com/me/videos", "redirect_url=localhost:8080/secure/video/add"))
		} catch (all) {
			all.printStackTrace()
		}
		"secure/video/upload"
	}

	// POST delete
	@RequestMapping(value = "/{id}", method = RequestMethod.POST)
	String delete(@PathVariable Long id, @RequestParam String vimeoId, RedirectAttributes attr) {
		vimeoAPI.deleteVideo(vimeoId)
		videoService.delete(id)
		tagService.deleteAllByVideo(id)
		attr.addFlashAttribute("alertSuccess", "Successfully deleted video")
		"redirect:/secure/video"
	}
}
