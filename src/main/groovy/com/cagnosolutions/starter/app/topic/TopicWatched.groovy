package com.cagnosolutions.starter.app.topic

import groovy.transform.CompileStatic

import javax.persistence.Entity
import javax.persistence.Id
import javax.persistence.Table

/**
 * Created by greg on 12/2/14.
 */

@CompileStatic
@Entity
@Table(name = "topic_watched")
class TopicWatched {

    @Id
    String topic

    Integer watched
}
