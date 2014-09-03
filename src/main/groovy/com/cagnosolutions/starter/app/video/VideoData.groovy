package com.cagnosolutions.starter.app.video
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.domain.Page
import org.springframework.data.domain.PageRequest
import org.springframework.data.domain.Sort
import org.springframework.data.jpa.repository.JpaRepository
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

    List<Video> findAll() {
        repo.findAll()
    }

    Page<Video> findAll(int page, int size, String... fields) {
        repo.findAll(new PageRequest(page, size, Sort.Direction.ASC, fields))
    }

    Video findOne(Long id) {
        repo.findOne id
    }

    Video save(Video video) {
        repo.save video
    }

    def delete(Long id) {
        repo.delete id
    }

}

@CompileStatic
@Repository
interface VideoRepository extends JpaRepository<Video, Long> {
}
