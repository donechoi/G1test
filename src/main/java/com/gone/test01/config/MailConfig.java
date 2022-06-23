package com.gone.test01.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration //root-context에 bean등록하는대신 config로 bean생성
public class MailConfig {
	
	@Bean
	public JavaMailSender mailSender() {
		JavaMailSenderImpl jms = new JavaMailSenderImpl();
		jms.setHost("smtp.gmail.com"); //프로토콜설정(어디메일?)
		jms.setPort(587); //포트번호

		jms.setUsername("donexana@gmail.com"); //개인이메일 작성
		jms.setPassword("phbeseyohhbntgga"); //gmail앱 비번(2차비번)
		
		Properties prop = new Properties();
		prop.setProperty("mail.transportprotocol", "smtp"); //프로토콜 형식
		prop.setProperty("mail.smtp.auth", "true"); //사용자인증 유무
		prop.setProperty("mail.smtp.starttls.enable", "true"); //보안처리 유무

		jms.setJavaMailProperties(prop);

		return jms;

	}
}
