package com.cagnosolutions.starter.app.admin

import com.cagnosolutions.starter.app.VimeoApi.VimeoAPI
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod

/**
 * Created by greg on 9/3/14.
 */

@Controller(value = "adminVideoController")
@RequestMapping(value = "/secure/video")
class VideoController {

	// GET upload
	@RequestMapping(value="/upload/video", method = RequestMethod.GET)
	public String upload(Model model) {
		try {
			VimeoAPI vimeo = new VimeoAPI();
			model.addAttribute("upload", vimeo.postInfo("https://api.vimeo.com/me/videos", "redirect_url=localhost:8080/admin/edit/video"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/video/upload";
	}

}
