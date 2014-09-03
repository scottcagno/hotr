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
	@GeneratedValue
	Long id
    String name, description, thumb, uri

    @OneToMany
    @JoinColumn(name="video_fk")
    List<Tag> metadata

}