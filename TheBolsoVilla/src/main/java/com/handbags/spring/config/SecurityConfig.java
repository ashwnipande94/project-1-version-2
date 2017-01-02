package com.handbags.spring.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;



	
	
	@Configuration
	@EnableWebSecurity
	public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
   @Autowired
	DataSource dataSource;
	
	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {

	auth.jdbcAuthentication().dataSource(dataSource)
	.usersByUsernameQuery(
	"select username,password, enabled from User where username=?")
	.authoritiesByUsernameQuery(
	"select username, roleName from User u,UserRole ur,Role r where u.userId=ur.userId and r.roleId=ur.roleId and username=?");
	} 
	
	
	protected void configure(HttpSecurity http) throws Exception {
	http.authorizeRequests()
	//.antMatchers("/hh").access("hasRole('ROLE_ADMIN')")
	.anyRequest().permitAll()
	.and()
	.formLogin().loginPage("/loginpage").loginProcessingUrl("/perform_login").defaultSuccessUrl("/").failureUrl("/loginpage?error")
	.usernameParameter("username").passwordParameter("password")
    .and()
	.logout().logoutSuccessUrl("/loginpage?logout") 
	.and()
	.csrf().disable();
	}
}
