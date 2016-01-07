package com.cagnosolutions.starter.app.video

import groovy.transform.CompileStatic
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.stereotype.Repository

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
