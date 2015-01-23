package com.cagnosolutions.starter.app.worksheet
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@CompileStatic
@Service
class WorksheetService {

    @Autowired
    WorksheetRepository repo

    List<Worksheet> findAll() {
        repo.findAll()
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

