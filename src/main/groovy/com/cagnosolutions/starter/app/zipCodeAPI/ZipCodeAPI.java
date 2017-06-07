package com.cagnosolutions.starter.app.zipCodeAPI;

import groovy.transform.CompileStatic;
import org.codehaus.groovy.runtime.DefaultGroovyMethods;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import java.util.ArrayList;
import java.util.List;

@CompileStatic
@Service
public class ZipCodeAPI {

	public List<ZipCode> findZipCodes(String zipCode, Integer radius) {
		String url = "https://www.zipcodeapi.com/rest/e19TYbAVJpHDlwdPojmnXyvvbynMcSorTykSJVNsku6F1jvqDSNAqj5CRto4lMvf/radius.json/" + zipCode + "/" + radius.toString() + "/mile";
		RestTemplate template = new RestTemplate();
		ZipCodes zipCodes = DefaultGroovyMethods.asType(template.getForObject(url, ZipCodes.class), ZipCodes.class);
		List<ZipCode> zipCodesSorted = new ArrayList<>(zipCodes.getZip_codes().size());
		zipCodes.getZip_codes().stream().sorted((z1, z2) -> z1.getDistance().compareTo(z2.getDistance())).forEach(zipCodesSorted::add);
		return zipCodesSorted;
	}
}
