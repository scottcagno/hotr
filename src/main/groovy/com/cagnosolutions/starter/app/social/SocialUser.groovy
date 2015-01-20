package com.cagnosolutions.starter.app.social

import groovy.transform.CompileStatic
import javax.persistence.*

@CompileStatic
@Entity
@Table(uniqueConstraints=[@UniqueConstraint(columnNames=["userId","providerId","providerUserId"]),
@UniqueConstraint(columnNames=["userId","providerId","rank"])])
class SocialUser {

	@Id
	@GeneratedValue
	Long id
	String userId

	@Column(nullable = false)
	String providerId
	String providerUserId

	@Column(nullable = false)
	Integer rank
	String displayName
	String profileUrl
	String imageUrl

	@Column(nullable = false)
	String accessToken
	String secret
	String refreshToken
	Long expireTime
	Date createDate = new Date()
}