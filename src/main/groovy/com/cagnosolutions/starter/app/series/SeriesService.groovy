package com.cagnosolutions.starter.app.series

import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.scheduling.annotation.EnableScheduling
import org.springframework.stereotype.Service

@EnableScheduling
@CompileStatic
@Service
class SeriesService {

	@Autowired
	SeriesRepository repo

	List<Series> findAll() {
		repo.findAll()
	}

	boolean canUpdate(Long id, String name) {
		(repo.canUpdate((id == null) ? 0L : id, name) == 0)
	}

	Series findOne(Long id) {
		repo.findOne id
	}

	Series findOneBySlug(String slug) {
		repo.fineOneBySlug(slug)
	}

	Series save(Series series) {
		repo.save series
	}

	def save(List<Series> series) {
		repo.save(series)
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

