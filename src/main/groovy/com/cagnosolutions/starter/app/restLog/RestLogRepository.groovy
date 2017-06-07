package com.cagnosolutions.starter.app.restLog

import groovy.transform.CompileStatic
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.stereotype.Repository

@CompileStatic
@Repository
interface RestLogRepository extends JpaRepository<RestLog, Long> {

	@Query("SELECT r FROM RestLog r WHERE r.type=:type AND r.date=:date")
	RestLog findOneByTypeAndDate(@Param("type") String type, @Param("date") String date)

}