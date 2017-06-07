package com.cagnosolutions.starter.app.counselor

import com.cagnosolutions.starter.app.validators.AdminCounselorValidator
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@CompileStatic
@Service
class CounselorService {

	@Autowired
	CounselorRepository repo

	List<Counselor> findAll() {
		repo.findAll()
	}

	List<Counselor> findAllByZip(String zip) {
		repo.findAllByZip zip
	}

	Counselor findOne(Long id) {
		repo.findOne id
	}

	Counselor save(Counselor counselor) {
		repo.save counselor
	}

	def delete(Long id) {
		repo.delete id
	}

	Counselor generateFromValidator(AdminCounselorValidator adminCounselorValidator) {
		def counselor = new Counselor()
		mergeProperties adminCounselorValidator, counselor
		counselor
	}

	// helper method
	def mergeProperties(source, target) {
		source.properties.each { key, value ->
			if (target.hasProperty(key as String) && !(key in ['class', 'metaClass']) && value != null)
				target[key as String] = value
		}
	}

}