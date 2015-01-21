package com.cagnosolutions.starter.app.worksheet

import groovy.transform.CompileStatic
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.stereotype.Repository

@CompileStatic
@Repository
interface WorksheetRepository extends JpaRepository<Worksheet, Long> {

	@Query("SELECT w FROM Worksheet w WHERE w.userId=:userId")
	List<Worksheet> findAllByUserId(@Param("userId") Long userId)

	@Query("SELECT COUNT(w.id) FROM Worksheet w")
	int numberOfWorksheets()
}
