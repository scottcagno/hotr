package com.cagnosolutions.starter.app.question

import groovy.transform.CompileStatic
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Modifying
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.stereotype.Repository

import javax.transaction.Transactional

/**
 * Created by greg on 12/11/14.
 */
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
