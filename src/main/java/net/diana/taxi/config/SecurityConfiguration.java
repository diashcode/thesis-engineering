package net.diana.taxi.config;

import net.diana.taxi.repository.UserRepository;
import net.diana.taxi.service.CustomUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity
@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true)
@EnableJpaRepositories(basePackageClasses = UserRepository.class)
public class SecurityConfiguration extends WebSecurityConfigurerAdapter
{
    @Autowired
    private CustomUserDetailsService userDetailsService;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception
    {
        auth.userDetailsService(userDetailsService).passwordEncoder(getPasswordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception
    {
        http.csrf().disable();
        http.authorizeRequests()
        		//.antMatchers("/admin/**").authenticated()
                .antMatchers("/dashboard/**").authenticated()
                .antMatchers("/travel-offer/**").authenticated()
                .anyRequest().permitAll()
                .and()
                .formLogin()
                .loginPage("/login").permitAll()
                .defaultSuccessUrl("/dashboard")
        		.and().logout()
        		.logoutUrl("/logout") 
        		.logoutSuccessUrl("/login")
        		.and().exceptionHandling() 
        		.accessDeniedPage("/error");
    }

    private PasswordEncoder getPasswordEncoder()
    {
        return new PasswordEncoder()
        {
            @Override
            public String encode(CharSequence charSequence)
            {
                return charSequence.toString();
            }

            @Override
            public boolean matches(CharSequence charSequence, String actualPassword)
            {
                String inputPassword = charSequence.toString();
                return actualPassword.equals(inputPassword);
            }
        };
    }
}
