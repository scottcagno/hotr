package com.cagnosolutions.starter.app.worksheet
import com.cagnosolutions.starter.app.user.User
import com.cagnosolutions.starter.app.user.UserService
import com.fasterxml.jackson.databind.ObjectMapper
import freemarker.template.Configuration
import freemarker.template.Template
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.servlet.mvc.support.RedirectAttributes

/**
 * Created by greg on 10/22/14.
 */

@Controller("worksheetController")
@RequestMapping("/worksheet")
class WorksheetController {

	@Autowired
	Configuration freeMarkerConfiguration

	@Autowired
	UserService userService

	@Autowired
	WorksheetService worksheetService

	@RequestMapping(method = RequestMethod.GET)
	String view() {
		"video/video_q"
	}

	@RequestMapping(method = RequestMethod.POST)
	String add(String answers, Worksheet worksheet, RedirectAttributes attr) {
		User user = userService.findOne worksheet.userId
		if (!(worksheet.videoId in user.progress && user.challenge)) {
			ObjectMapper mapper = new ObjectMapper()
			def answerMap = mapper.readValue(answers, Map.class)
			Template temp = freeMarkerConfiguration.getTemplate("worksheet/worksheet.ftl")
			Map<String, Object> map = new HashMap<>()
			map.put("answerMap", answerMap)
			worksheet.htmlData = FreeMarkerTemplateUtils.processTemplateIntoString(temp, map)
			worksheetService.save worksheet
			user.progress << worksheet.videoId
			userService.save user
			attr.addFlashAttribute("worksheet", worksheet)
		}
		"redirect:/video/${worksheet.videoId}"
	}
}
