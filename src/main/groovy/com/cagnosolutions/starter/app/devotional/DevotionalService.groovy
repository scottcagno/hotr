package com.cagnosolutions.starter.app.devotional

import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.domain.PageRequest
import org.springframework.data.domain.Sort.Direction
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
				if(left.date != right.date && left.date != null && right.date != null)
					return (left.date <= right.date) ? 1 : -1
				else
					return 0
			}
		})
		devotionals
	}

	List<Devotional> findAll(int page, int size) {
		repo.findAll(new PageRequest(page, size, Direction.DESC, "date")).content
	}

	Devotional findOne(Long id) {
		repo.findOne id
	}

	Devotional findOneBySlug(String slug) {
		repo.findOneBySlug(slug)
	}

	def save(Devotional devotional) {
		repo.save devotional
	}

	def save(List<Devotional> devotionals) {
		repo.save(devotionals)
	}

	def delete(Long id) {
		repo.delete id
	}

	List<Devotional> findAllRecentlyAdded() {
		repo.findAllRecent()
	}

}
