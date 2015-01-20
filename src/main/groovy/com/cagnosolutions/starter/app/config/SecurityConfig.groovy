package com.cagnosolutions.starter.app.config
import com.cagnosolutions.starter.app.CustomAuthenticationSuccessHandler
import com.cagnosolutions.starter.app.user.UserService
import groovy.transform.CompileStatic
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.context.annotation.Configuration
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity
import org.springframework.security.config.http.SessionCreationPolicy
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.security.web.util.matcher.AntPathRequestMatcher

import javax.sql.DataSource

@CompileStatic
@Configuration
@EnableWebMvcSecurity
class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	DataSource dataSource

	@Autowired
	UserService userService

	@Autowired
	void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication().withUser("admin").password("admin").roles("ADMIN")
		auth.jdbcAuthentication().dataSource(dataSource).passwordEncoder(new BCryptPasswordEncoder())
				.usersByUsernameQuery("SELECT username, password, active FROM user WHERE username=?")
				.authoritiesByUsernameQuery("SELECT username, role FROM user WHERE username=?")
	}

	void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
				.antMatchers("/admin/**").hasAnyRole("ADMIN")
				.antMatchers("/secure/**").hasAnyRole("ADMIN", "USER")
		http.formLogin()
				.loginPage("/login").defaultSuccessUrl("/secure")
				.successHandler(new CustomAuthenticationSuccessHandler())
		http.logout()
				.invalidateHttpSession(true)
				.logoutSuccessUrl("/")
				.logoutRequestMatcher(new AntPathRequestMatcher("/logout", "GET"))
		http.sessionManagement()
				.maximumSessions(1)
				.expiredUrl("/login?expired")
				.maxSessionsPreventsLogin(false)
				.and()
				.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
	}


}