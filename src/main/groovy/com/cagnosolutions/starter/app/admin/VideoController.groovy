package com.cagnosolutions.starter.app.admin

import com.cagnosolutions.starter.app.VimeoApi.VimeoAPI
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam

/**
 * Created by greg on 9/3/14.
 */

@Controller(value = "adminVideoController")
@RequestMapping(value = "/secure/video")
class VideoController {

	// GET add
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	String add(@RequestParam String video_uri, Model model) {
		try {
			VimeoAPI vimeo = new VimeoAPI();
			model.addAttribute("video", vimeo.getInfo( "https://api.vimeo.com" + video_uri));
		} catch (Exception e) {
			e.printStackTrace();
		}
		"secure/video/add"
	}

	// GET upload
	@RequestMapping(value="/upload", method = RequestMethod.GET)
	String upload(Model model) {
		try {
			VimeoAPI vimeo = new VimeoAPI();
			model.addAttribute("upload", vimeo.postInfo("https://api.vimeo.com/me/videos", "redirect_url=localhost:8080/secure/video/add"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "secure/video/upload";
	}

}
