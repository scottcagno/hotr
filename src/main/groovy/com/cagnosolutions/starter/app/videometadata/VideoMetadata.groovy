package com.cagnosolutions.starter.app.videometadata

import groovy.transform.CompileStatic

import javax.persistence.*

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@CompileStatic
@Entity
@Table(name = "videoMetadata")
class VideoMetadata {

    @Id
    String id
    String data
}