package com.example.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .csrf(csrf -> csrf.disable())
            .authorizeHttpRequests(auth -> auth
                .requestMatchers(
                    "/login-user", "/userlogin.jsp", "/useroptions.jsp", "/userhome", "/register", "/save-user", "/css/**", "/js/**", "/images/**", "/webjars/**", "/"
                ).permitAll()
                .anyRequest().permitAll()
            )
            .formLogin(form -> form.disable())
            .httpBasic(httpBasic -> httpBasic.disable())
            // Configure logout behavior so redirection goes to our custom login page
            .logout(logout -> logout
                // keep default logout URL '/logout' but set success URL to our login-user path
                .logoutUrl("/logout")
                .logoutSuccessUrl("/login-user")
                .permitAll()
            );
        return http.build();
    }
}
