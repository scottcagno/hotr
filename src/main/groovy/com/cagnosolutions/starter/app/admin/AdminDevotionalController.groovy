package com.cagnosolutions.starter.app.admin
import com.cagnosolutions.starter.app.devotional.Devotional
import com.cagnosolutions.starter.app.devotional.DevotionalService
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.servlet.mvc.support.RedirectAttributes

@CompileStatic
@Controller
@RequestMapping(value = "/admin/devotional")
class AdminDevotionalController {

	@Autowired
	DevotionalService devotionalService

	@RequestMapping(method = RequestMethod.GET)
	String viewAllDevotionalEntries(Model model) {
		model.addAttribute "devotionals", devotionalService.findAll()
		model.addAttribute("images", getImages("devotional_"))
		"admin/devotional/devotional"
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	String saveDevotionalEntry(Devotional devotional, RedirectAttributes attr) {
		def errors = new HashMap<String,String>()
		if (devotional.title == null || devotional.title == "") errors.put "title", "Required field"
		if (devotional.body == null || devotional.body == "") errors.put "body", "Required field"
		if (devotional.thumb == null || devotional.thumb == "") errors.put "thumb", "Required field"
		if (errors.size() > 0) {
			attr.addFlashAttribute "errors", errors
			attr.addFlashAttribute("devotional", devotional)
			return "redirect:/admin/devotional"
		}
		if(devotional.id == null) devotional.date = new Date()
		devotionalService.save devotional
		attr.addFlashAttribute("alertSuccess", "Successfully saved devotional entry")
		"redirect:/admin/devotional"
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	String findDevotionalEntry(@PathVariable Long id, Model model) {
		model.addAllAttributes([devotionals : devotionalService.findAll(), devotional : devotionalService.findOne(id)])
		model.addAttribute("images", getImages("devotional_"))
		"admin/devotional/devotional"
	}

	@RequestMapping(value = "/del/{id}", method = RequestMethod.POST)
	String delete(@PathVariable Long id, RedirectAttributes attr) {
		devotionalService.delete id
		attr.addFlashAttribute("alertSuccess", "Successfully deleted devotional entry")
		"redirect:/admin/devotional"
	}

	List<String> getImages(String prefix) {
		def names = []
		File fd = new File("opt/images")
		for (File file : fd.listFiles()) {
			if (!file.isHidden() && file.canRead()) {
				if (file.name.startsWith(prefix)) {
					names.add(file.name)
				}
			}
		}
		return names
	}

}
