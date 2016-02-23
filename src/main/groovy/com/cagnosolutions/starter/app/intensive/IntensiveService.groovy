package com.cagnosolutions.starter.app.intensive

import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@CompileStatic
@Service
class IntensiveService {

    @Autowired
    IntensiveRepository repo

    List<Intensive> findAll() {
        repo.findAll()
    }

    Intensive findOne() {
        repo.findOne 1L
    }

    Intensive save(Intensive intensive) {
		intensive.id = 1L
        repo.save intensive
    }

    def delete(Long id) {
        repo.delete id
    }

}

