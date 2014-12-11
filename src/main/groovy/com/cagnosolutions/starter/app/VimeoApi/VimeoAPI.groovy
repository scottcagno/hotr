package com.cagnosolutions.starter.app.VimeoApi

import com.cagnosolutions.starter.app.video.VideoService
import com.fasterxml.jackson.databind.ObjectMapper
import org.apache.http.HttpResponse
import org.apache.http.client.entity.UrlEncodedFormEntity
import org.apache.http.client.methods.HttpPatch
import org.apache.http.impl.client.CloseableHttpClient
import org.apache.http.impl.client.HttpClients
import org.apache.http.message.BasicNameValuePair
import org.aspectj.apache.bcel.classfile.annotation.NameValuePair
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

/**
 * Created by greg on 9/3/14.
 */

@Service(value = "vimeoApiService")
class VimeoAPI {

	@Autowired
	VideoService videoService

	String accessToken = "42d31cdffcfb6f820c33687faedda08f";

	VimeoAPI() {
	}

	// base method for most vimeo api calls
	HttpURLConnection makeApiCall(String method, String url, String... param) throws Exception {
		HttpURLConnection con = (HttpURLConnection) new URL(url).openConnection()
		con.setRequestMethod(method)
		con.setRequestProperty("User-Agent", "Mozilla/5.0")
		con.setRequestProperty("Authorization", "Bearer " + this.accessToken)
		con.setRequestProperty("Accept", "application/vnd.vimeo.*+json;version=3.2")
		if (param.length > 0) {
			con.setRequestProperty("Accept-Language", "en-US,en;q=0.5")
			con.setDoOutput(true)
			DataOutputStream wr = new DataOutputStream(con.getOutputStream())
			wr.writeBytes(param[0])
			wr.flush()
			wr.close()
		}
		con.getResponseCode()
		con
	}

	// base method for vimeo api calls that require PATCH method
	Map makePatchCall(String url, Map<String, String> params) throws Exception {
		CloseableHttpClient client = HttpClients.createDefault()
		HttpPatch patch = new HttpPatch(url)
		patch.addHeader("User-Agent", "Mozilla/5.0")
		patch.addHeader("Authorization", "Bearer "+ this.accessToken)
		patch.addHeader("Accept", "application/vnd.vimeo.*+json;version=3.2")
		List<NameValuePair> urlParameters = new ArrayList<>()
		for (String paramKey : params.keySet()) {
			urlParameters.add(new BasicNameValuePair(paramKey, params.get(paramKey)))
		}
		patch.setEntity(new UrlEncodedFormEntity(urlParameters))
		HttpResponse response = client.execute(patch)
		ObjectMapper mapper = new ObjectMapper()
		mapper.readValue(response.getEntity().getContent(), Map.class)
	}

	// get request wrapper
	Map getInfo(String url) throws Exception {
		ObjectMapper mapper = new ObjectMapper()
		mapper.readValue(makeApiCall("GET", url).getInputStream(), Map.class)
	}

	// post request wrapper
	Map postInfo(String url, String params) throws Exception {
		ObjectMapper mapper = new ObjectMapper()
		mapper.readValue(makeApiCall("POST", url, params).getInputStream(),Map.class)
	}

	// add embed presets to vimeo video
	def addEmbedPreset(String vimeoId) throws Exception {
		makeApiCall("PUT", "https://api.vimeo.com/videos/${vimeoId}/presets/465827")
	}

	// add privacy settings to vimeo video
	def addPrivacy(String vimeoId) throws Exception {
		Map<String, String> map = new HashMap<>()
		map.put("privacy.view", "disable")
		makePatchCall("https://api.vimeo.com/videos/${vimeoId}", map)
	}

	// delete vimeo video
	def deleteVideo(String vimeoId) throws Exception {
		makeApiCall("DELETE", "https://api.vimeo.com/videos/${vimeoId}")
	}

	def settings(Long videoId, String vimeoId) {
		Thread.start {
			sleep(60000)
			addEmbedPreset(vimeoId)
			addPrivacy(vimeoId)
			def map = getInfo("https://api.vimeo.com/videos/${vimeoId}/pictures")
			if (map.data != null) {
				def video = videoService.findOne(videoId)
				video.thumb = map.data[0].sizes[-1].link as String
				videoService.save(video)
			}
		}
	}
}

