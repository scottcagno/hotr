package com.cagnosolutions.starter.app.devotional

import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@CompileStatic
@Service
class DevotionalService {

	@Autowired
	DevotionalRepository repo

	List<Devotional> findAll() {
		def devotionals = repo.findAll()
		Collections.sort(devotionals, new Comparator<Devotional>(){
			int compare(Devotional left, Devotional right) {
				if(left.id != right.id && left.id != null && right.id != null)
					return (left.id <= right.id) ? 1 : -1
				else
					return 0
			}
		});
		devotionals
	}

	Devotional findOne(Long id) {
		repo.findOne id
	}

	def save(Devotional devotional) {
		repo.save devotional
	}

	def delete(Long id) {
		repo.delete id
	}
}
