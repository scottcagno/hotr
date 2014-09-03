package com.cagnosolutions.starter.app.VimeoApi
import com.fasterxml.jackson.databind.ObjectMapper
import org.springframework.stereotype.Service

/**
 * Created by greg on 9/3/14.
 */

@Service(value = "vimeoApiService")
class VimeoAPI {

	String accessToken = "42d31cdffcfb6f820c33687faedda08f";

	VimeoAPI() {
	}

	HttpURLConnection makeApiCall(String method, String url, String... param) throws Exception {
		HttpURLConnection con = (HttpURLConnection) new URL(url).openConnection();
		con.setRequestMethod(method);
		con.setRequestProperty("User-Agent", "Mozilla/5.0");
		con.setRequestProperty("Authorization", "Bearer " + this.accessToken);
		con.setRequestProperty("Accept", "application/vnd.vimeo.*+json;version=3.2");
		if (param.length > 0) {
			con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(param[0]);
			wr.flush();
			wr.close();
		}
		con.getResponseCode();
		return con;
	}

	Map getInfo(String url) throws Exception {
		ObjectMapper mapper = new ObjectMapper();
		return mapper.readValue(makeApiCall("GET", url).getInputStream(), Map.class);
	}

	Map postInfo(String url, String params) throws Exception {
		ObjectMapper mapper = new ObjectMapper();
		return mapper.readValue(makeApiCall("POST", url, params).getInputStream(),Map.class);
	}

	def addEmbedPreset(String preset, String videoUrl) throws Exception {
		makeApiCall("PUT", "https://api.vimeo.com" + videoUrl + "/presets/451008");
	}

	def deleteVideo(String videoUri) throws Exception {
		makeApiCall("DELETE", "https://api.vimeo.com" + videoUri);
	}
}

