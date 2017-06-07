package com.cagnosolutions.starter.app.restLog

import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@CompileStatic
@Service
class RestLogService {

	@Autowired
	RestLogRepository repo

	List<RestLog> findAll() {
		repo.findAll()
	}

	RestLog findOne(Long id) {
		repo.findOne id
	}

	RestLog save(RestLog restLog) {
		repo.save restLog
	}

	RestLog save(String type) {
		def date = new Date().dateString

		def restLog = repo.findOneByTypeAndDate type, date

		if (restLog == null) {
			restLog = new RestLog()
			restLog.date = date
			restLog.type = type
		}
		restLog.count++
		repo.save restLog
	}

	def delete(Long id) {
		repo.delete id
	}

	// helper method
	def mergeProperties(source, target) {
		source.properties.each { key, value ->
			if (target.hasProperty(key as String) && !(key in ['class', 'metaClass']) && value != null)
				target[key as String] = value
		}
	}

}