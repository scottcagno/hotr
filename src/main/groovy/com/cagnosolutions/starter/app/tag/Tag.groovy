package com.cagnosolutions.starter.app.tag

import groovy.transform.CompileStatic

import javax.persistence.*

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@CompileStatic
@Entity
@Table(name = "tag")
class Tag {

    @Id
    String id
    String tag
}