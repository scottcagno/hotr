package com.cagnosolutions.starter.app.question
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@CompileStatic
@Service
class QuestionService {

    @Autowired
    QuestionRepository repo

    List<Question> findAll() {
        repo.findAll()
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

