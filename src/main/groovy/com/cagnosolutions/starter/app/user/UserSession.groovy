package com.cagnosolutions.starter.app.user

import groovy.transform.CompileStatic
import org.springframework.context.annotation.Scope
import org.springframework.context.annotation.ScopedProxyMode
import org.springframework.stereotype.Component

@CompileStatic
@Component
@Scope(value = "session", proxyMode = ScopedProxyMode.TARGET_CLASS)
class UserSession {
	
	long id
	String firstName, lastName, spouseName
	int progress
}
