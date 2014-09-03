package com.cagnosolutions.starter.app.video

import com.cagnosolutions.starter.app.tag.Tag

import javax.persistence.*
/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@Entity
@Table(name = "video")
class Video {

    @Id
    String id
    String name, description, thumburi, videouri

    @OneToMany
    @JoinColumn(name="video_fk")
    List<Tag> tags

}