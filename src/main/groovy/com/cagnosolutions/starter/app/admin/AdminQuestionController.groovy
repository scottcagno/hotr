package com.cagnosolutions.starter.app.admin

import com.cagnosolutions.starter.app.question.Question
import com.cagnosolutions.starter.app.question.QuestionService
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.servlet.mvc.support.RedirectAttributes

@CompileStatic
@Controller
@RequestMapping(value = "/admin/question")
class AdminQuestionController {

	@Autowired
	QuestionService questionService

	// GET add questing
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	String add(@RequestParam Long videoId, Model model) {
		model.addAttribute("videoId", videoId)
		"admin/question/add"
	}

	// GET edit question
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
 	String edit(@PathVariable Long id, Model model) {
		model.addAttribute("question", questionService.findOne(id))
		"admin/question/edit"
	}

	// POST save question
	@RequestMapping(method = RequestMethod.POST)
	String save(Question question, RedirectAttributes attr) {
		questionService.save(question)
		attr.addFlashAttribute("alertSuccess", "Successfully saved question")
		"redirect:/admin/video/${question.video_fk}"
	}

	// POST delete question
	@RequestMapping(value = "/del/{id}", method = RequestMethod.POST)
	String delete(@PathVariable Long id, @RequestParam Long videoId, RedirectAttributes attr) {
		questionService.delete(id)
		attr.addFlashAttribute("alertSuccess", "Successfully deleted question")
		"redirect:/admin/video/${videoId}"
	}
}
