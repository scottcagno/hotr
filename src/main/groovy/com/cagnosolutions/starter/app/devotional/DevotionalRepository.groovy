package com.cagnosolutions.starter.app.devotional

import groovy.transform.CompileStatic
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@CompileStatic
@Repository
interface DevotionalRepository extends JpaRepository<Devotional, Long>{

}