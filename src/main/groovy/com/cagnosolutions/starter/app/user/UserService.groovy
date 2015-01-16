package com.cagnosolutions.starter.app.user

import com.cagnosolutions.starter.app.email.EmailService
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.domain.Page
import org.springframework.data.domain.PageRequest
import org.springframework.data.domain.Sort
import org.springframework.scheduling.annotation.EnableScheduling
import org.springframework.scheduling.annotation.Scheduled
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.social.connect.UserProfile
import org.springframework.stereotype.Service
/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@EnableScheduling
@CompileStatic
@Service(value = "userService")
class UserService {

	@Autowired
	UserRepository repo

	@Autowired
	EmailService emailService

	List<User> findAll() {
		repo.findAll()
	}

	Page<User> findAll(int page, int size, String... fields) {
		repo.findAll(new PageRequest(page, size, Sort.Direction.ASC, fields))
	}

	List<User> findAllByMonthly() {
		repo.findAllByMonthly()
	}

	boolean canUpdate(Long id, String username) {
		(repo.canUpdate((id == null) ? 0L : id, username) == 0)
	}

	User findOne(Long id) {
		repo.findOne id
	}

	User findOne(String username) {
		repo.findOne username
	}

	User findOneByHashedUsername(String hash) {
		repo.findOne new String(hash.decodeBase64())
	}

	User save(User user) {
		if(user.id == null)
			user.creation = new Date()
		repo.save user
	}

	def delete(Long id) {
		repo.delete id
	}

	Integer numberOfUsers() {
		repo.numberOfUsers()
	}

	Integer numberOrChallenge() {
		repo.numberOfChallenge()
	}

	String getHash(String username) {
		username.bytes.encodeBase64().toString()
	}

	String getUsername(String hash) {
		new String(hash.decodeBase64())
	}

	@Scheduled(cron = "0 0 12 1 * *")
	void monthlyReminder() {
		def users = findAllByMonthly()
		users.each { user ->
			def map = [:]
			map.put("user", user)
			def name = (user.spouseName != null && user.spouseName != "") ?
					"${user.firstName} and ${user.spouseName} ${user.lastName}" :
					"${user.firstName} ${user.lastName}"
			map.put("name", name)
			emailService.send("noreply@fantheflamedates.com", user.username, "Monthly Reminder", "Monthly Reminder", "email/reminder.ftl", map)
		}
	}


	// helper method
	def mergeProperties(source, target) {
		source.properties.each { key, value ->
			if (target.hasProperty(key as String) && !(key in ['class', 'metaClass']) && value != null)
				target[key as String] = value
		}
	}

	User createUserFromSocial(UserProfile profile) {
		def user = new User()
		user.password = new BCryptPasswordEncoder().encode("social")
		user.firstName = profile.firstName
		user.lastName = profile.lastName
		user.username = profile.email
		user.challenge = false
		user.monthly = false
		user.creation = new Date()
		user.progress = new ArrayList<Long>()
		repo.save user
	}

}

