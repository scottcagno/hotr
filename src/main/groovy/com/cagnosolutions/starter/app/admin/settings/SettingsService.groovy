package com.cagnosolutions.starter.app.admin.settings

import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@CompileStatic
@Service
class SettingsService {

    @Autowired
    SettingsRepository repo

    List<Settings> findAll() {
        repo.findAll()
    }

    Settings findOne() {
        repo.findOne 1L
    }

    Settings save(Settings adminSettings) {
        repo.save adminSettings
    }

    def delete(Long id) {
        repo.delete id
    }

}

