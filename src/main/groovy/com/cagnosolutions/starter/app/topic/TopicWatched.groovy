package com.cagnosolutions.starter.app.topic
import groovy.transform.CompileStatic

import javax.persistence.Entity
import javax.persistence.Id

@CompileStatic
@Entity
class TopicWatched {

    @Id
    String topic
    Integer watched
}
