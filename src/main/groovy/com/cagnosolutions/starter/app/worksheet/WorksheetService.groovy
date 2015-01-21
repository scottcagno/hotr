package com.cagnosolutions.starter.app.worksheet
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.domain.Page
import org.springframework.data.domain.PageRequest
import org.springframework.data.domain.Sort
import org.springframework.stereotype.Service

@CompileStatic
@Service
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

    int numberOfWorksheets() {
        repo.numberOfWorksheets()
    }

}

