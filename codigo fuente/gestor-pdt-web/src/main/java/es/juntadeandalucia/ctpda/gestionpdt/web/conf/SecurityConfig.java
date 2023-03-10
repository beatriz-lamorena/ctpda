/*
 * Copyright 2016-2016 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package es.juntadeandalucia.ctpda.gestionpdt.web.conf;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import es.juntadeandalucia.ctpda.gestionpdt.service.core.exception.BaseException;

@Configuration
@EnableWebSecurity
//@EnableConfigurationProperties(ApplicationUsers.class)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Value("server.servlet.context-path")
	private String pathBase;

	@SuppressFBWarnings("SPRING_CSRF_PROTECTION_DISABLED")
	@Override
	protected void configure(HttpSecurity http) throws BaseException {
		try {
			http.csrf().disable();
			http.headers()
				.frameOptions() //Para que funcione el visor de documentos
					.sameOrigin();
					//.and().hsts().disable()

			http.authorizeRequests()
			.antMatchers("/").permitAll()
			.antMatchers("/**.jsf","/demo/**.jsf","/template/**.jsf").permitAll()
			.antMatchers("/javax.faces.resource/**").permitAll()
			.antMatchers("/actuator/**").permitAll()
			.antMatchers("/*/**").permitAll()
			.anyRequest().authenticated()
			.and()
			.formLogin()
			.loginPage("/login.jsf")
			.permitAll()
			.failureUrl("/login.jsf?error=true")
			.defaultSuccessUrl("/starter.jsf")
			.and()
			.logout()
			.logoutSuccessUrl("/login.jsf")
			.deleteCookies("JSESSIONID");
		}
		catch (Exception ex) {
			throw new BaseException(ex.getMessage());
		}
	}

	@Override
	protected UserDetailsService userDetailsService() {
		return new InMemoryUserDetailsManager();
	}
}
