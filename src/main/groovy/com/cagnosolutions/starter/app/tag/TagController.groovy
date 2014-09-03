package com.cagnosolutions.starter.app.tag

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
@Controller(value = "tagController")
@RequestMapping(value = "/secure/video/tag")
class TagController {

    @Autowired
    TagService tagService

    @RequestMapping(method = RequestMethod.GET)
    String viewAll(Model model) {
        model.addAttribute "tags", tagService.findAll()
        "video/tag"
    }

    @RequestMapping(method = RequestMethod.POST)
    String addOrEdit(Tag metaData, RedirectAttributes attr) {
        // TODO: implement add or edit
        "redirect:/secure/tag"
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    String view(@PathVariable Long id, Model model) {
        def video = tagService.findOne id
        model.addAllAttributes([video: video, videos: tagService.findAll()])
        "video/tag"
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.POST)
    String delete(@PathVariable Long id) {
        tagService.delete id
        "redirect:/secure/tag"
    }

}