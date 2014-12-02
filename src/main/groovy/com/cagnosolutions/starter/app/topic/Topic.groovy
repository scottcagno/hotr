package com.cagnosolutions.starter.app.topic

import groovy.transform.CompileStatic

import javax.persistence.*

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@CompileStatic
@Entity
@Table(name = "topic")
class Topic {

    @Id
	@GeneratedValue
    Long id
    String topic
	Long video_fk
}