package com.cagnosolutions.starter.app.blog

import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod

@CompileStatic
@Controller
@RequestMapping(value = "/blog")
class BlogController {

	@Autowired
	BlogService blogService

	@RequestMapping(method = RequestMethod.GET)
	String blog(Model model) {
		model.addAllAttributes([blogs: blogService.findAll(), auth: false])
		"blog/blog"
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	String blogPost(@PathVariable Long id, Model model) {
		model.addAllAttributes([blog: blogService.findOne(id), blogs: blogService.findAll(), auth: false])
		"blog/blog-post"
	}

}
