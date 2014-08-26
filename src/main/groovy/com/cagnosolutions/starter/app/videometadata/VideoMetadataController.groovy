package com.cagnosolutions.starter.app.videometadata

import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.servlet.mvc.support.RedirectAttributes

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@CompileStatic
@Controller(value = "videoMetadataController")
@RequestMapping(value = "/secure/video/metadata")
class VideoMetadataController {

    @Autowired
    VideoMetadataService metaDataService

    @RequestMapping(method = RequestMethod.GET)
    String viewAll(Model model) {
        model.addAttribute "videos", metaDataService.findAll()
        "video/metadata"
    }

    @RequestMapping(method = RequestMethod.POST)
    String addOrEdit(VideoMetadata metaData, RedirectAttributes attr) {
        // TODO: implement add or edit
        "redirect:/secure/metadata"
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    String view(@PathVariable Long id, Model model) {
        def video = metaDataService.findOne id
        model.addAllAttributes([video: video, videos: metaDataService.findAll()])
        "video/metadata"
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.POST)
    String delete(@PathVariable Long id) {
        metaDataService.delete id
        "redirect:/secure/metadata"
    }

}