package com.cagnosolutions.starter.app.blog

import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@CompileStatic
@Service
class BlogService {

	@Autowired
	BlogRepository repo

	List<Blog> findAll() {
		def blogs = repo.findAll()
		Collections.sort(blogs, new Comparator<Blog>(){
			int compare(Blog left, Blog right) {
				if(left.id != right.id && left.id != null && right.id != null)
					return (left.id <= right.id) ? 1 : -1
				else
					return 0
			}
		});
		blogs
	}

	Blog findOne(Long id) {
		repo.findOne id
	}

}
