package com.cagnosolutions.starter.app.user
import groovy.transform.CompileStatic

import javax.persistence.Entity
import javax.persistence.Id
import javax.persistence.Table

@CompileStatic
@Entity
@Table(name = "UserConnection")
class UserConnection {

	@Id
	String userId

	String providerId
	String providerUserId
	Integer rank
	String displayName
	String profileUrl
	String imageUrl
	String accessToken
	String secret
	String refreshToken
	Long expireTime
}