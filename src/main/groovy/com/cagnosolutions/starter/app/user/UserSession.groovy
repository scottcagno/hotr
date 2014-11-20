package com.cagnosolutions.starter.app.user
import org.springframework.context.annotation.Scope
import org.springframework.context.annotation.ScopedProxyMode
import org.springframework.stereotype.Component

@Component
@Scope(value = "session", proxyMode = ScopedProxyMode.TARGET_CLASS)
class UserSession {
	long id
	String name
}
