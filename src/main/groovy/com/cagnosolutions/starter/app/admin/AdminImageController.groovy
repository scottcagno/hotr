package com.cagnosolutions.starter.app.admin

import freemarker.template.Configuration
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.servlet.mvc.support.RedirectAttributes

@CompileStatic
@Controller
@RequestMapping("/admin/image")
class AdminImageController {

	@Autowired
	Configuration config

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	String upload(@RequestParam(required = false) MultipartFile series,
				  @RequestParam(required = false) MultipartFile devotional,
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
		if (devotional != null) {
			try {
				byte[] bytes = devotional.getBytes()
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(
						new File("${path}devotional_${devotional.originalFilename}")))
				stream.write(bytes)
				stream.close()
			} catch (Exception ex) {
				ex.printStackTrace()
				attr.addFlashAttribute("alertError", "File could not be uploaded")
				return "redirect:${redirect}"
			}
			attr.addFlashAttribute("imageUrl", "/image/devotional_${devotional.originalFilename}")
		}
		"redirect:${redirect}"
	}

	@RequestMapping(method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	String imageList() {
		def data = [:]
		data.put("images", getImages("devotional_"))
		FreeMarkerTemplateUtils.processTemplateIntoString(config.getTemplate("admin/devotional/images.ftl"), data)
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
