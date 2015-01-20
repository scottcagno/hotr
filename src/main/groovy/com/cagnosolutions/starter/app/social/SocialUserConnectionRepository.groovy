package com.cagnosolutions.starter.app.social

import groovy.transform.CompileStatic
import org.springframework.social.connect.Connection
import org.springframework.social.connect.ConnectionKey
import org.springframework.social.connect.ConnectionRepository
import org.springframework.util.MultiValueMap

/**
 * Created by greg on 1/20/15.
 */

@CompileStatic
class SocialUserConnectionRepository implements ConnectionRepository{
	@Override
	MultiValueMap<String, Connection<?>> findAllConnections() {
		return null
	}

	@Override
	List<Connection<?>> findConnections(String providerId) {
		return null
	}

	@Override
	def <A> List<Connection<A>> findConnections(Class<A> apiType) {
		return null
	}

	@Override
	MultiValueMap<String, Connection<?>> findConnectionsToUsers(MultiValueMap<String, String> providerUserIds) {
		return null
	}

	@Override
	Connection<?> getConnection(ConnectionKey connectionKey) {
		return null
	}

	@Override
	def <A> Connection<A> getConnection(Class<A> apiType, String providerUserId) {
		return null
	}

	@Override
	def <A> Connection<A> getPrimaryConnection(Class<A> apiType) {
		return null
	}

	@Override
	def <A> Connection<A> findPrimaryConnection(Class<A> apiType) {
		return null
	}

	@Override
	void addConnection(Connection<?> connection) {

	}

	@Override
	void updateConnection(Connection<?> connection) {

	}

	@Override
	void removeConnections(String providerId) {

	}

	@Override
	void removeConnection(ConnectionKey connectionKey) {

	}
}
