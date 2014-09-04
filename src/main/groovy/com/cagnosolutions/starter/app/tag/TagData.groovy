package com.cagnosolutions.starter.app.tag

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

@Service(value = "tagService")
class TagService {

    @Autowired
    TagRepository repo

    List<Tag> findAll() {
        repo.findAll()
    }

    Page<Tag> findAll(int page, int size, String... fields) {
        repo.findAll(new PageRequest(page, size, Sort.Direction.ASC, fields))
    }

	List<String> findAllByVideo(Long video_fk) {
		repo.videoTags(video_fk)
	}

	def deleteAllByVideo(Long video_fk) {
		repo.deleteVideoTag(video_fk)
	}

    Tag findOne(Long id) {
        repo.findOne id
    }

    Tag save(Tag video) {
        repo.save video
    }

    def delete(Long id) {
        repo.delete id
    }

	def videoTags(String tags, Long video_fk) {
		def oldTags = repo.videoTags(video_fk)
		def newTags = []
		tags.split(",").each { String tag ->
			newTags << tag.trim()
		}
		List<String> delTags = new ArrayList<>(oldTags)
		List<String> addTags = new ArrayList<>(newTags)
		delTags.removeAll(newTags)
		addTags.removeAll(oldTags)
		def videoTags = []
		addTags.each { String tag ->
			videoTags << new Tag([tag : tag, video_fk : video_fk])
		}
		repo.save(videoTags)
		delTags.each { String tag ->
			repo.deleteTag(tag, video_fk)
		}
	}

	def testTags(String tags, Long video_fk) {
		def oldTags = repo.testTags(video_fk)
		def newTags = []
		tags.split(",").each { String tag ->
			newTags << new Tag([tag : tag.trim(), video_fk : video_fk])
		}
		List<Tag> delTags = new ArrayList<>(oldTags)
		List<Tag> addTags = new ArrayList<>(newTags)

		delTags.removeAll(newTags)
		addTags.removeAll(oldTags)
		repo.save(addTags)
		repo.delete(delTags)
	}

}

@CompileStatic
@Repository
interface TagRepository extends JpaRepository<Tag, Long> {
	@Query("SELECT t.tag FROM Tag t WHERE t.video_fk=:video_fk")
	List<String> videoTags(@Param("video_fk") Long video_fk);

	@Query("SELECT t FROM Tag t WHERE t.video_fk=:video_fk")
	List<Tag> testTags(@Param("video_fk") Long video_fk);

	@Modifying
	@Query("DELETE FROM Tag t WHERE t.tag=:tagString AND t.video_fk=:video_fk")
	@Transactional
	void deleteTag(@Param("tagString") String tag, @Param("video_fk") Long video_fk)

	@Modifying
	@Query("DELETE FROM Tag t WHERE t.video_fk=:video_fk")
	@Transactional
	void deleteVideoTag(@Param("video_fk") Long video_fk)
}