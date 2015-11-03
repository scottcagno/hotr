package com.cagnosolutions.starter.app.topic

import groovy.transform.CompileStatic
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Modifying
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.stereotype.Repository

import javax.transaction.Transactional

@CompileStatic
@Repository
interface TopicRepository extends JpaRepository<Topic, Long> {
	@Query("SELECT t.topic FROM Topic t WHERE t.video_fk=:video_fk")
	List<String> videoTopics(@Param("video_fk") Long video_fk);

	@Modifying
	@Query("DELETE FROM Topic t WHERE t.topic=:topicString AND t.video_fk=:video_fk")
	@Transactional
	void deleteTopic(@Param("topicString") String topic, @Param("video_fk") Long video_fk)

	@Modifying
	@Transactional
	@Query("DELETE FROM Topic t WHERE t.video_fk=:video_fk")
	void deleteAllByVideo(@Param("video_fk") Long video_fk)

	@Query("SELECT COUNT(t.id) FROM Topic t WHERE t.topic=:topic")
	int hasTopic(@Param("topic") String topic)

	@Query("SELECT t.video_fk FROM Topic t WHERE t.topic=:topic")
	List<Long> videoIdsByTopic(@Param("topic") String topic)

}
