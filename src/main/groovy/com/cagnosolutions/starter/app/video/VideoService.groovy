package com.cagnosolutions.starter.app.video

import com.cagnosolutions.starter.app.validators.VideoValidator
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@CompileStatic
@Service
class VideoService {

    @Autowired
    VideoRepository repo

    List<Video> findAll() {
        repo.findAll()
    }

	List<Video> findAll(List<Long> ids) {
		repo.findAll ids
	}

	List<Video> findAllByTopic(String topic) {
		repo.findAllVideoByTopic(topic)
	}

	List<Video> findAllBySeries(String series) {
		repo.findAllBySeries(series)
	}

    Video findOne(Long id) {
        repo.findOne id
    }

	Video findOneBySlug(String slug) {
		repo.findOneBySlug(slug)
	}

	List<Video> findAllRecentlyAdded() {
		repo.findAllRecentlyAdded()
	}

	List<Video> findAllPopular() {
		repo.findAllPopular()
	}

    Video save(Video video) {
	    if (video.id == null)
		    video.added = new Date()
        repo.save video
    }

	def save(List<Video> videos) {
		repo.save(videos)
	}

	Video saveAndFlush(Video video) {
		if (video.id == null)
			video.added = new Date()
		repo.saveAndFlush video
	}

    def delete(Long id) {
        repo.delete id
    }

	def delete(Video video) {
		repo.delete video
	}

	Integer numberOfVideos() {
		repo.numberOfVideos()
	}

	Integer numberOfVideosWatched() {
		repo.numberOfVideosWatched()
	}

	Set<String> findAllSeries() {
		List<String> allSeries = new ArrayList<>();
		List<Video> allVideos = repo.findAll();
		for(Video video : allVideos) {
			if (video.series != "" && video.series != null) {
				allSeries.add video.series;
			}
		}
		new HashSet<String>(allSeries);
	}

	def videoWatched(Long videoId) {
		def video = repo.findOne videoId
		video.watched++
		repo.save video
	}

	Video generateFromValidator(VideoValidator videoValidator) {
		def video = new Video()
		mergeProperties videoValidator, video
		video
	}
	
	// helper method
	def mergeProperties(source, target) {
		source.properties.each { key, value ->
			if (target.hasProperty(key as String) && !(key in ['class', 'metaClass']) && value != null)
				target[key as String] = value
		}
	}

}

