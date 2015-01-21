package com.cagnosolutions.starter.app.user

import groovy.transform.CompileStatic
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.stereotype.Repository

@CompileStatic
@Repository
interface UserRepository extends JpaRepository<User, Long> {

	@Query("SELECT COUNT(u.id) FROM User u WHERE u.id<>:id AND u.username=:username")
	int canUpdate(@Param("id") Long id, @Param("username") String username)

	@Query("SELECT u FROM User u WHERE u.username=:username")
	User findOne(@Param("username") String username)

	@Query("SELECT COUNT(u.id) FROM User u")
	Integer numberOfUsers()

	@Query("SELECT COUNT(u.id) FROM User u WHERE u.challenge=true")
	Integer numberOfChallenge()

	@Query("SELECT u FROM User u WHERE u.monthly=true")
	List<User> findAllByMonthly()
}
