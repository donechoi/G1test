package com.gone.test01.mailService;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailService {

	@Autowired JavaMailSender gmailSender;

	// 인증코드 만드는 메소드
    private String createKey(int size) {
    	StringBuffer key = new StringBuffer();
    	Random ran = new Random();
    	for(int i = 0; i < size; i++) {// 몇 자리
    		key.append((ran.nextInt(10))); // 0~9
    	}
        return key.toString();  
    }
	
    // 메일관련 기본 메소드+예외처리
	public void sendGmail(String to, String subject, String body) {
		MimeMessage mime = gmailSender.createMimeMessage();
		
		try {
			MimeMessageHelper m = 
					new MimeMessageHelper(mime,true,"utf-8");
			
			m.setTo(to);
			m.setSubject(subject);
			m.setText(body);
			gmailSender.send(mime);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// Login 메일 발송 코드
	public String gmailLogin(String mail) {
		String to, subject, body, key;
		
		key = createKey(6);// 키 생성
		
		to = mail; // 받는메일
		subject = "[오리마켓]가입 인증코드입니다."; // 메일제목
		body = "인증번호 : "+ key; // 메일내용
		
		sendGmail(to,subject,body);
		return key; // key값 돌려줌
	}
	
	
}
