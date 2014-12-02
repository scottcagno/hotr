package com.cagnosolutions.starter.app.topic

import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.domain.Page
import org.springframework.data.domain.PageRequest
import org.springframework.data.domain.Sort
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Modifying
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.stereotype.Repository
import org.springframework.stereotype.Service

import javax.transaction.Transactional

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@Service(value = "topicService")
class TopicService {

    @Autowired
    TopicRepository repo

	@Autowired
	TopicWatchedRepository watchedRepo

    List<Topic> findAll() {
        repo.findAll()
    }

    Page<Topic> findAll(int page, int size, String... fields) {
        repo.findAll(new PageRequest(page, size, Sort.Direction.ASC, fields))
    }

	List<String> findAllByVideo(Long video_fk) {
		repo.videoTopics(video_fk)
	}

	def deleteAllByVideo(Long video_fk) {
		repo.deleteAllByVideo(video_fk)
	}

    Topic findOne(Long id) {
        repo.findOne id
    }

    Topic save(Topic topic) {
        repo.save topic
    }

    def delete(Long id) {
        repo.delete id
    }

	def videoTopics(String topics, Long video_fk) {
		def oldTopics = repo.videoTopics(video_fk)
		def newTopics = []
		topics.split(",").each { String topic ->
			newTopics << topic.trim()
		}
		List<String> delTopics = new ArrayList<>(oldTopics)
		List<String> addTopics = new ArrayList<>(newTopics)
		delTopics.removeAll(newTopics)
		addTopics.removeAll(oldTopics)
		def videoTopics = []
		addTopics.each { String topic ->
			videoTopics << new Topic([topic : topic, video_fk : video_fk])
			if (repo.hasTopic(topic) < 1) {
				watchedRepo.save(new TopicWatched([topic: topic, watched: 0]))
			}
		}
		repo.save(videoTopics)
		delTopics.each { String topic ->
			repo.deleteTopic(topic, video_fk)
			if (repo.hasTopic(topic) < 1) {
				watchedRepo.delete(topic)
			}
		}
	}

	def topicWatched(List<String> topicIds) {
		def topics = watchedRepo.findAll(topicIds)
		topics*.watched++
		watchedRepo.save(topics)
	}

}

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
	@Query("DELETE FROM Topic t WHERE t.video_fk=:video_fk")
	@Transactional
	void deleteAllByVideo(@Param("video_fk") Long video_fk)

	@Query("SELECT COUNT(t.id) FROM Topic t WHERE t.topic=:topic")
	int hasTopic(@Param("topic") String topic)

}

@CompileStatic
@Repository
interface TopicWatchedRepository extends JpaRepository<TopicWatched, String> {

}