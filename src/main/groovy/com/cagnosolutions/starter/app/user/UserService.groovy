package com.cagnosolutions.starter.app.user
import com.cagnosolutions.starter.app.util.email.EmailService
import com.cagnosolutions.starter.app.validators.AdminAddUserValidator
import com.cagnosolutions.starter.app.validators.AdminEditUserValidator
import com.cagnosolutions.starter.app.validators.UserAccountValidator
import com.cagnosolutions.starter.app.validators.UserRegistrationValidator
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.scheduling.annotation.EnableScheduling
import org.springframework.scheduling.annotation.Scheduled
import org.springframework.social.connect.UserProfile
import org.springframework.stereotype.Service

@EnableScheduling
@CompileStatic
@Service
class UserService {

	@Autowired
	UserRepository repo

	@Autowired
	EmailService emailService

	List<User> findAll() {
		repo.findAll()
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

	User generateFromValidator(UserRegistrationValidator userRegistrationValidator) {
		def user = new User()
		mergeProperties userRegistrationValidator, user
		user
	}

	User generateFromValidator(UserAccountValidator userSettingsValidator) {
		def user = new User()
		mergeProperties userSettingsValidator, user
		user
	}

	User generateFromValidator(AdminAddUserValidator adminAddUserValidator) {
		def user = new User()
		mergeProperties adminAddUserValidator, user
		user
	}

	User generateFromValidator(AdminEditUserValidator adminEditUserValidator) {
		def user = new User()
		mergeProperties adminEditUserValidator, user
		user
	}

	// helper method
	def mergeProperties(source, target) {
		source.properties.each { key, value ->
			if (target.hasProperty(key as String) && !(key in ['class', 'metaClass']) && value != null)
				target[key as String] = value
		}
	}
	
	String createUserFromSocial(UserProfile profile) {
		def user
		if (canUpdate(0L, profile.email)) {
			user = new User([
				firstName: profile.firstName,
				lastName : profile.lastName,
				username : profile.email,
				password : UUID.randomUUID().toString(),
				creation : new Date(),
				lastSeen : new Date(),
				challenge: false,
				monthly  : false,
				social   : true,
				progress : new ArrayList<Long>(),
				active   : 1 as short,
				role     : "ROLE_USER"
			])
		} else {
			user = repo.findOne profile.email
			user.social = true
			user.password = UUID.randomUUID().toString()
		}
		repo.saveAndFlush user
		user.username
	}
}

