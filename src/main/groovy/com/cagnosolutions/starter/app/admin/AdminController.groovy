package com.cagnosolutions.starter.app.admin
import com.cagnosolutions.starter.app.user.UserService
import com.cagnosolutions.starter.app.video.VideoService
import com.cagnosolutions.starter.app.worksheet.WorksheetService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
/**
 * Created by greg on 10/21/14.
 */

@Controller("adminController")
@RequestMapping("/admin")
class AdminController {

	@Autowired
	UserService userService

	@Autowired
	VideoService videoService

	@Autowired
	WorksheetService worksheetService

	// GET landing page
	@RequestMapping(method = RequestMethod.GET)
	String landing(Model model) {
		model.addAllAttributes([
				users : userService.numberOfUsers(),
				challenge : userService.numberOrChallenge(),
				videos : videoService.numberOfVideos(),
				watched : videoService.numberOfVideosWatched(),
				worksheets : worksheetService.numberOfWorksheets()
		])
		"admin/landing"
	}
}
