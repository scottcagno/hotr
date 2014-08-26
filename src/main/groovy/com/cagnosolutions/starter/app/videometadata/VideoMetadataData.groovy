package com.cagnosolutions.starter.app.videometadata

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
@Service(value = "videoMetadataService")
class VideoMetadataService {

    @Autowired
    VideoMetadataRepository repo

    List<VideoMetadata> findAll() {
        repo.findAll()
    }

    Page<VideoMetadata> findAll(int page, int size, String... fields) {
        repo.findAll(new PageRequest(page, size, Sort.Direction.ASC, fields))
    }

    VideoMetadata findOne(Long id) {
        repo.findOne id
    }

    VideoMetadata save(VideoMetadata video) {
        repo.save video
    }

    def delete(Long id) {
        repo.delete id
    }

}

@CompileStatic
@Repository
interface VideoMetadataRepository extends JpaRepository<VideoMetadata, Long> {

}