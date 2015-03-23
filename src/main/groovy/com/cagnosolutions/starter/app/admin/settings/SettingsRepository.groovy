package com.cagnosolutions.starter.app.admin.settings

import groovy.transform.CompileStatic
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@CompileStatic
@Repository
interface SettingsRepository extends JpaRepository<Settings, Long> {

}
