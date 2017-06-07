package com.cagnosolutions.starter.app.counselor

import com.cagnosolutions.starter.app.zipCodeAPI.ZipCode
import com.cagnosolutions.starter.app.zipCodeAPI.ZipCodeAPI
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RestController

@CompileStatic
@RestController
@RequestMapping("/counselor/rest")
@CrossOrigin(methods = [RequestMethod.OPTIONS, RequestMethod.POST, RequestMethod.GET])
class CounselorRestController {

	@Autowired
	CounselorService counselorService

	@Autowired
	ZipCodeAPI zipCodeAPI

	@RequestMapping(method = RequestMethod.GET)
	List<Counselor> counselorAll(String zip, Integer radius) {
		if (zip == null || radius == null) {
			return []
		}
		if (zip.size() != 5 || radius < 1) {
			return []
		}
		def zipCodes = zipCodeAPI.findZipCodes zip, radius
		def counselors = new ArrayList<Counselor>()
		for (ZipCode zipCode : zipCodes) {
			def subCounselors = counselorService.findAllByZip zipCode.zip_code
			subCounselors*.estimatedDistance = ((zipCode.distance < 1.1) ? (Float)1.1 : (Float)zipCode.distance)
			counselors.addAll subCounselors
		}
		counselors
	}

	@RequestMapping(value = "/zipcodes", method = RequestMethod.GET)
	List<ZipCode> zipCodeTest(String zip, Integer radius) {
		if (zip == null || radius == null) {
			return []
		}

		if (zip.size() != 5 || radius < 1) {
			return []
		}

		zipCodeAPI.findZipCodes zip, radius
	}
}
