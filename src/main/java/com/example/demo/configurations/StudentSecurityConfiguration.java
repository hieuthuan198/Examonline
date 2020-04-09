package com.example.demo.configurations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.context.SecurityContextPersistenceFilter;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter;

import com.example.demo.service.AccountService;
@Configuration
@EnableWebSecurity
@Order(3)
public class StudentSecurityConfiguration extends WebSecurityConfigurerAdapter{
	@Autowired
	private AccountService accountService;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		
		http.cors().and().csrf().disable();   
		
		http.antMatcher("/student/**")
			.authorizeRequests()
			.antMatchers("/student/**").access("hasRole('ROLE_STUDENT')")
			.and()
			.formLogin()
			.loginPage("/student-panel")
			.loginProcessingUrl("/student/process") // action login
			.defaultSuccessUrl("/student") // login success
			.failureUrl("/student-panel/login?error") // error ben controller giong day
			.usernameParameter("username") // name input username
			.passwordParameter("password")
			.and()
			.logout().logoutUrl("/student/process/logout")
			.logoutSuccessUrl("/home/index")
			.invalidateHttpSession(true)
			.and()
			// ko co quyen vao
			.exceptionHandling().accessDeniedPage("/student-panel");
		
	}
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder builder) throws Exception {
		builder.userDetailsService(accountService);
	}
	
	@Bean
	public BCryptPasswordEncoder encoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public SecurityContextHolderAwareRequestFilter awareRequestFilter() {
	    return new SecurityContextHolderAwareRequestFilter();
	}
	
	@Bean
	public SecurityContextPersistenceFilter persistenceFilter() {
		return new SecurityContextPersistenceFilter();
	}
}
