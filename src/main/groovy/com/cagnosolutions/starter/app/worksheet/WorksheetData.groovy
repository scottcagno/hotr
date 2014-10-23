package com.cagnosolutions.starter.app.worksheet

import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.domain.Page
import org.springframework.data.domain.PageRequest
import org.springframework.data.domain.Sort
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.stereotype.Repository
import org.springframework.stereotype.Service
/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@CompileStatic
@Service(value = "worksheetService")
class WorksheetService {

    @Autowired
    WorksheetRepository repo

    List<Worksheet> findAll() {
        repo.findAll()
    }

    Page<Worksheet> findAll(int page, int size, String... fields) {
        repo.findAll(new PageRequest(page, size, Sort.Direction.ASC, fields))
    }

	List<Worksheet> findAllByUserId(Long userId) {
		repo.findAllByUserId userId
	}

    Worksheet findOne(Long id) {
        repo.findOne id
    }

    Worksheet save(Worksheet worksheet) {
        repo.save worksheet
    }

    def delete(Long id) {
        repo.delete id
    }

}

@CompileStatic
@Repository
interface WorksheetRepository extends JpaRepository<Worksheet, Long> {

	@Query("SELECT w FROM Worksheet w WHERE w.userId=:userId")
	List<Worksheet> findAllByUserId(@Param("userId") Long userId)
}
