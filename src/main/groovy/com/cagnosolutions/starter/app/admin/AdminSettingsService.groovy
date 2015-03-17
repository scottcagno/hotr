package com.cagnosolutions.starter.app.admin

import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@CompileStatic
@Service
class AdminSettingsService {

    @Autowired
    AdminSettingsRepository repo

    List<AdminSettings> findAll() {
        repo.findAll()
    }

    AdminSettings findOne() {
        repo.findOne 1L
    }

    AdminSettings save(AdminSettings adminSettings) {
        repo.save adminSettings
    }

    def delete(Long id) {
        repo.delete id
    }

}

