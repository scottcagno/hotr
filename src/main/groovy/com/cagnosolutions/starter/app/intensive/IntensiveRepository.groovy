package com.cagnosolutions.starter.app.intensive

import groovy.transform.CompileStatic
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@CompileStatic
@Repository
interface IntensiveRepository extends JpaRepository<Intensive, Long> {

}
