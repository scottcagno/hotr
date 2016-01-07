package com.cagnosolutions.starter.app.admin

import com.cagnosolutions.starter.app.admin.settings.Settings
import com.cagnosolutions.starter.app.admin.settings.SettingsService
import com.cagnosolutions.starter.app.video.VideoService
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.servlet.mvc.support.RedirectAttributes

@CompileStatic
@Controller
@RequestMapping(value="/admin/settings")
class AdminSettingsController {

	@Autowired
	SettingsService settingsService

	@Autowired
	VideoService videoService

	// GET view settings
	@RequestMapping(method=RequestMethod.GET)
	String settings(Model model) {
		model.addAllAttributes([settings: settingsService.findOne(), vids: videoService.findAll()])
		"admin/settings/settings"
	}

	// POST save settings
	@RequestMapping(method = RequestMethod.POST)
	String saveSettings(Settings settings, RedirectAttributes attr) {
		settingsService.save(settings)
		attr.addFlashAttribute("alertSuccess", "Successfully saved settings")
		"redirect:/admin"
	}

	// POST reset settings
	@RequestMapping(value = "/erase", method = RequestMethod.POST)
	String wipe() {
		def settings = new Settings()
		settings.videoId = settingsService.findOne().videoId
		settingsService.save(settings)
		"redirect:/admin/settings"
	}

}
