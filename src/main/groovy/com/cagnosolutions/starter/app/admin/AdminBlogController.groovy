package com.cagnosolutions.starter.app.admin
import com.cagnosolutions.starter.app.blog.Blog
import com.cagnosolutions.starter.app.blog.BlogService
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
@RequestMapping(value = "/admin/blog")
class AdminBlogController {

	@Autowired
	BlogService blogService

	@RequestMapping(method = RequestMethod.GET)
	String viewAllBlogEntries(Model model) {
		model.addAttribute "blogs", blogService.findAll()
		"admin/blog/blog"
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	String saveBlogEntry(Blog blog, RedirectAttributes attr) {

		println blog.toString()

		def errors = new HashMap<String,String>()
		if (blog.title == null || blog.title == "") errors.put "title", "Required field"
		if (blog.body == null || blog.body == "") errors.put "body", "Required field"
		if (errors.size() > 0) {
			attr.addFlashAttribute "errors", errors
			return "redirect:/admin/blog"
		}
		if(blog.id == null) blog.date = new Date()
		blogService.save blog
		attr.addFlashAttribute("alertSuccess", "Successfully saved blog entry")
		"redirect:/admin/blog"
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	String findBlogEntry(@PathVariable Long id, Model model) {
		model.addAllAttributes([blogs : blogService.findAll(), blog : blogService.findOne(id)])
		"admin/blog/blog"
	}

	@RequestMapping(value = "/del/{id}", method = RequestMethod.POST)
	String delete(@PathVariable Long id, RedirectAttributes attr) {
		blogService.delete id
		attr.addFlashAttribute("alertSuccess", "Successfully deleted blog entry")
		"redirect:/admin/blog"
	}

}
