package com.cagnosolutions.starter.app.topic

import groovy.transform.CompileStatic
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.stereotype.Repository

@CompileStatic
@Repository
interface TopicWatchedRepository extends JpaRepository<TopicWatched, String> {
	@Query(nativeQuery = true, value = "select * from hotr.topic_watched order by hotr.topic_watched.watched desc limit 10;")
	List<TopicWatched> popTopic()
}
