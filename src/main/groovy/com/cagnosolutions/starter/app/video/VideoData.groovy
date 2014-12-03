package com.cagnosolutions.starter.app.video

import com.cagnosolutions.starter.app.topic.TopicService
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.domain.Page
import org.springframework.data.domain.PageRequest
import org.springframework.data.domain.Sort
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.stereotype.Repository
import org.springframework.stereotype.Service
/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@CompileStatic
@Service(value = "videoService")
class VideoService {

    @Autowired
    VideoRepository repo

	@Autowired
	TopicService topicService

    List<Video> findAll() {
        repo.findAll()
    }

	List<Video> findAll(List<Long> ids) {
		repo.findAll(ids)
	}

	List<Video> findAllByTopic(String topic) {
		repo.findAllVideoByTopic(topic)
	}

	List<Video> findAllBySeries(String series) {
		repo.findAllBySeries(series)
	}

    Page<Video> findAll(int page, int size, String... fields) {
        repo.findAll(new PageRequest(page, size, Sort.Direction.ASC, fields))
    }

    Video findOne(Long id) {
        repo.findOne id
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
				allSeries.add(video.series);
			}
		}
		new HashSet<String>(allSeries);
	}

	def videoWatched(Long videoId) {
		def video = repo.findOne videoId
		video.watched++
		repo.save video
	}

	// helper method
	def mergeProperties(source, target) {
		source.properties.each { key, value ->
			if (target.hasProperty(key as String) && !(key in ['class', 'metaClass']) && value != null)
				target[key as String] = value
		}
	}

}

@CompileStatic
@Repository
interface VideoRepository extends JpaRepository<Video, Long> {

	@Query(nativeQuery = true, value = "select * from hotr.video where hotr.video.id in (select hotr.topic.video_fk from hotr.topic where hotr.topic.topic=:topic)")
	List<Video> findAllVideoByTopic(@Param("topic") String topic)

	@Query("SELECT COUNT(v.id) FROM Video v")
	Integer numberOfVideos()

	@Query("SELECT SUM(v.watched)FROM Video v WHERE v.watched > 0")
	Integer numberOfVideosWatched()

	@Query(nativeQuery = true, value = "SELECT * FROM hotr.video ORDER BY hotr.video.id DESC limit 10")
	List<Video> findAllRecentlyAdded()

	@Query("SELECT v FROM Video v WHERE v.series=:series")
	List<Video> findAllBySeries(@Param("series") String series)

	@Query(nativeQuery = true, value = "SELECT * FROM hotr.video ORDER BY hotr.video.watched DESC limit 10")
	List<Video> findAllPopular()
}
