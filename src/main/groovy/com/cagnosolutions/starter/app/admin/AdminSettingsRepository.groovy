package com.cagnosolutions.starter.app.admin

import groovy.transform.CompileStatic
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@CompileStatic
@Repository
interface AdminSettingsRepository extends JpaRepository<AdminSettings, Long> {

}
