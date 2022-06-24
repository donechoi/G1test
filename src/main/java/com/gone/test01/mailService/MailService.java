package com.gone.test01.mailService;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailService {

	@Autowired JavaMailSender mailSender;

    private String getKey(int size) {
        return "123456";  //6개 숫자 랜덤 만들어보세요
    }
	
    public String sendAuthMail(String mail)  throws MessagingException{
        String authKey = getKey(6);
        MimeMessage mime = mailSender.createMimeMessage();
        String body = "인증번호: "+authKey ;     //보낼 메시지 
        try {
        	MimeMessageHelper m = 
					new MimeMessageHelper(mime,true,"utf-8");
        	
        	mime.addRecipient(Message.RecipientType.TO, new InternetAddress(mail));
        	
        	m.setSubject("[오리마켓]가입 인증번호입니다."); 
        	m.setText(body);
        	
            mailSender.send(mime);
        } catch (MessagingException e) {
        	e.printStackTrace();   
            return "fail to send mail";
        }
          return authKey;
    }
    
    
	public void sendMail(String to, String subject, String body) {
		
		MimeMessage mime = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper m = 
					new MimeMessageHelper(mime,true,"utf-8");
			m.setTo(to);
			m.setSubject(subject);
			m.setText(body);
			mailSender.send(mime);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void emailLogin(String mail) {
		String to, subject , body;
		to = mail;
		subject = "[오리마켓]가입 인증번호입니다.";
		body = getKey(6);
		sendMail(to,subject,body);
	}
	
	
}
