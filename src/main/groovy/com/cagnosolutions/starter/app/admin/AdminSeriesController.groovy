package com.cagnosolutions.starter.app.admin

import com.cagnosolutions.starter.app.series.Series
import com.cagnosolutions.starter.app.series.SeriesService
import com.cagnosolutions.starter.app.video.VideoService
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
@RequestMapping("/admin/series")
class AdminSeriesController {

	@Autowired
	SeriesService seriesService

	@Autowired
	VideoService videoService

	// GET view all series
	@RequestMapping(method = RequestMethod.GET)
	String allSeries(Model model) {
		model.addAllAttributes([allSeries: seriesService.findAll(),
								videos: videoService.findAll(), images: getImages("series_")])
		"admin/series/series"
	}

	// POST save series
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	String save(Series series, RedirectAttributes attr) {
		if (seriesService.canUpdate(series.id, series.name)) {
			series.createSlug()
			series = seriesService.save series
			attr.addFlashAttribute("alertSuccess", "Successfully saved series")
		} else {
			attr.addFlashAttribute("alertError", "Error saving series. Series name already exists")
		}
		"redirect:/admin/series/${(series.id !=null) ? series.id : ""}"
	}

	// GET view one series
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	String series(Model model, @PathVariable Long id) {
		model.addAllAttributes([allSeries: seriesService.findAll(),
								series: seriesService.findOne(id),
								videos: videoService.findAll(), images: getImages("series_")])
		"admin/series/series"
	}

	// POST delete one series
	@RequestMapping(value = "/del/{id}", method = RequestMethod.POST)
	String deleteSeries(@PathVariable Long id, RedirectAttributes attr) {
		seriesService.delete(id)
		attr.addFlashAttribute("alertSuccess", "Successfully deleted series")
		"redirect:/admin/series"
	}

	@RequestMapping(value="/create/slugs", method = RequestMethod.GET)
	String createSlugs(RedirectAttributes attr) {
		def series = seriesService.findAll()
		for (Series s : series) {
			s.createSlug()
		}
		seriesService.save(series)
		attr.addFlashAttribute("alertSuccess", "Successfully created slugs for all series")
		"redirect:/admin/series"
	}

	// helper get images
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
