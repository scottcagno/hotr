package com.cagnosolutions.starter.app.question

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

@Service(value = "questionService")
class QuestionService {

    @Autowired
    QuestionRepository repo

    List<Question> findAll() {
        repo.findAll()
    }

    Page<Question> findAll(int page, int size, String... fields) {
        repo.findAll(new PageRequest(page, size, Sort.Direction.ASC, fields))
    }

	List<Question> findAllByVideo(Long videoId) {
		repo.findAllByVideo(videoId)
	}

	def deleteAllByVideo(Long videoId) {
		repo.deleteAllByVideo(videoId)
	}

    Question findOne(Long id) {
        repo.findOne id
    }

    Question save(Question question) {
        repo.save question
    }

    def delete(Long id) {
        repo.delete id
    }

}

@CompileStatic
@Repository
interface QuestionRepository extends JpaRepository<Question, Long> {
	@Query("SELECT q FROM Question q WHERE q.video_fk=:videoId")
	List<Question> findAllByVideo(@Param("videoId") Long videoId);

	@Modifying
	@Query("DELETE FROM Question q WHERE q.video_fk=:videoId")
	@Transactional
	void deleteAllByVideo(@Param("videoId") Long videoId)

}