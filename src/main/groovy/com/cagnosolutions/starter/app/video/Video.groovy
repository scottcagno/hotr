package com.cagnosolutions.starter.app.video
import com.cagnosolutions.starter.app.videometadata.VideoMetadata

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
    String name, description, thumb

    @OneToMany
    @JoinColumn(name="video_fk")
    List<VideoMetadata> metadata

}