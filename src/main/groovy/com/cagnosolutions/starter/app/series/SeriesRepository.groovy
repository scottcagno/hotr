package com.cagnosolutions.starter.app.series

import groovy.transform.CompileStatic
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.stereotype.Repository

@CompileStatic
@Repository
interface SeriesRepository extends JpaRepository<Series, Long> {

	@Query("SELECT COUNT(s.id) FROM Series s WHERE s.id<>:id AND s.name=:name")
	int canUpdate(@Param("id") Long id, @Param("name") String name)

}
