package com.cagnosolutions.starter.app.counselor

import groovy.transform.CompileStatic
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.stereotype.Repository

@CompileStatic
@Repository
interface CounselorRepository extends JpaRepository<Counselor, Long> {

	@Query("SELECT c FROM Counselor c WHERE c.zip=:zip")
	List<Counselor> findAllByZip(@Param("zip") String zip)

}
