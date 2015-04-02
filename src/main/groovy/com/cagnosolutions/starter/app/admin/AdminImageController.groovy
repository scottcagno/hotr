package com.cagnosolutions.starter.app.admin
import groovy.transform.CompileStatic
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.servlet.mvc.support.RedirectAttributes

@CompileStatic
@Controller
@RequestMapping("/admin/upload")
class AdminImageController {

	@RequestMapping(method = RequestMethod.POST)
	String upload(@RequestParam(required = false) MultipartFile series,
				  @RequestParam(required = false) MultipartFile blog,
				  String redirect, RedirectAttributes attr) throws Exception {
		def path = "opt/images/"
		new File(path).mkdirs() //make directory, if it doesn't already exist
		if (series != null) {
			try {
				byte[] bytes = series.getBytes()
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(
						new File("${path}series_${series.originalFilename}")))
				stream.write(bytes)
				stream.close()
			} catch (Exception ex) {
				ex.printStackTrace()
				attr.addFlashAttribute("alertError", "File could not be uploaded")
				return "redirect:${redirect}"
			}
		}
		if (blog != null) {
			try {
				byte[] bytes = series.getBytes()
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(
						new File("${path}blog_${series.originalFilename}")))
				stream.write(bytes)
				stream.close()
			} catch (Exception ex) {
				ex.printStackTrace()
				attr.addFlashAttribute("alertError", "File could not be uploaded")
				return "redirect:${redirect}"
			}
		}
		"redirect:${redirect}"
	}

}
