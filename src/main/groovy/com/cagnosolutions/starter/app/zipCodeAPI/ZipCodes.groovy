package com.cagnosolutions.starter.app.zipCodeAPI

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import groovy.transform.CompileStatic

@CompileStatic
@JsonIgnoreProperties(ignoreUnknown = true)
class ZipCodes {

	List<ZipCode> zip_codes

}
