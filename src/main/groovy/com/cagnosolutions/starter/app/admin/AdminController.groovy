package com.cagnosolutions.starter.app.admin

import com.cagnosolutions.starter.app.admin.settings.SettingsService
import com.cagnosolutions.starter.app.user.UserService
import com.cagnosolutions.starter.app.video.VideoService
import com.cagnosolutions.starter.app.worksheet.WorksheetService
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod

@CompileStatic
@Controller
@RequestMapping("/admin")
class AdminController {

	@Autowired
	UserService userService

	@Autowired
	VideoService videoService

	@Autowired
	WorksheetService worksheetService

	@Autowired
	SettingsService settingsService

	// GET landing page
	@RequestMapping(method = RequestMethod.GET)
	String landing(Model model) {
		model.addAllAttributes([
				users : userService.numberOfUsers(),
				challenge : userService.numberOrChallenge(),
				videos : videoService.numberOfVideos(),
				watched : videoService.numberOfVideosWatched(),
				worksheets : worksheetService.numberOfWorksheets(),
				settings : settingsService.findOne(),
				vids : videoService.findAll()
		])
		"admin/landing"
	}

}
