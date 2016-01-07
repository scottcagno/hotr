package com.cagnosolutions.starter.app.devotional

import groovy.transform.CompileStatic
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.stereotype.Repository

@CompileStatic
@Repository
interface DevotionalRepository extends JpaRepository<Devotional, Long> {

	@Query(nativeQuery = true, value = "SELECT * FROM hotr.devotional ORDER BY hotr.devotional.date DESC limit 4")
	List<Devotional> findAllRecent()

}