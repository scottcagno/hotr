package com.cagnosolutions.starter.app.admin

import com.cagnosolutions.starter.app.counselor.CounselorService
import com.cagnosolutions.starter.app.validators.AdminCounselorValidator
import com.cagnosolutions.starter.app.validators.ValidationWrapper
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.servlet.mvc.support.RedirectAttributes

import javax.validation.Valid

@CompileStatic
@Controller
@RequestMapping(value = "/admin/counselor")
class AdminCounselorController {

	@Autowired
	CounselorService counselorService

	@Autowired
	ValidationWrapper validationWrapper

	@RequestMapping(method = RequestMethod.GET)
	String view(Model model) {
		model.addAttribute("counselors", counselorService.findAll())
		"admin/counselor/counselors"
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	String addView(Model model) {
		"admin/counselor/counselor"
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	String add(@Valid AdminCounselorValidator adminCounselorValidator, BindingResult bindingResult, RedirectAttributes attr) {
		if (bindingResult.hasErrors()) {
			attr.addFlashAttribute("alertError", "Error in the counselor form")
			attr.addFlashAttribute("errors", validationWrapper.bindErrors(bindingResult))
			attr.addFlashAttribute("counselor", adminCounselorValidator)
			return "redirect:/admin/counselor/add"
		}

		def counselor = counselorService.generateFromValidator adminCounselorValidator
		counselorService.save counselor
		attr.addFlashAttribute("alertSuccess", "Updated Successfully")
		"redirect:/admin/counselor"
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	String editView(@PathVariable Long id, Model model) {
		if (!model.containsAttribute("counselor")) {
			model.addAttribute("counselor", counselorService.findOne(id))
		}
		"admin/counselor/counselor"
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	String edit(@Valid AdminCounselorValidator adminCounselorValidator, BindingResult bindingResult, RedirectAttributes attr) {
		if (bindingResult.hasErrors()) {
			attr.addFlashAttribute("alertError", "Error in the counselor form")
			attr.addFlashAttribute("errors", validationWrapper.bindErrors(bindingResult))
			attr.addFlashAttribute("counselor", adminCounselorValidator)
			return "redirect:/admin/counselor/${adminCounselorValidator.id}"
		}

		def counselor = counselorService.generateFromValidator adminCounselorValidator
		def existingCounselor = counselorService.findOne counselor.id

		counselorService.mergeProperties counselor, existingCounselor

		counselorService.save existingCounselor
		attr.addFlashAttribute("alertSuccess", "Updated Successfully")
		"redirect:/admin/counselor"
	}

	@RequestMapping(value = "/del/{id}", method = RequestMethod.POST)
	String delCounselor(@PathVariable Long id, RedirectAttributes attr) {
		counselorService.delete id
		attr.addFlashAttribute("alertSuccess", "Successfully deleted counselor")
		"redirect:/admin/counselor"
	}

}
