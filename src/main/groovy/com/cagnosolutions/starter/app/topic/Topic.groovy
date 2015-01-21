package com.cagnosolutions.starter.app.topic

import groovy.transform.CompileStatic

import javax.persistence.*

@CompileStatic
@Entity
class Topic {

    @Id
	@GeneratedValue
    Long id
    String topic
	Long video_fk
}