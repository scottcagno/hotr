package com.cagnosolutions.starter.app.admin
import com.cagnosolutions.starter.app.intensive.Intensive
import com.cagnosolutions.starter.app.intensive.IntensiveService
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.servlet.mvc.support.RedirectAttributes

@CompileStatic
@Controller
@RequestMapping(value="/admin/intensive")
class AdminIntensiveController {

	@Autowired
	IntensiveService intensiveService

	// GET view intensive
	@RequestMapping(method=RequestMethod.GET)
	String settings(Model model) {
		model.addAllAttributes([intensive: intensiveService.findOne()])
		"admin/intensive/intensive"
	}

	// POST save intensive
	@RequestMapping(method = RequestMethod.POST)
	String saveIntensive(Intensive intensive, RedirectAttributes attr) {
		intensiveService.save(intensive)
		attr.addFlashAttribute("alertSuccess", "Successfully saved marriage intensives page")
		"redirect:/admin/intensive"
	}

}
