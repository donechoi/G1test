package com.gone.test01.mailController;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gone.test01.mailService.MailService;

//메일 Test class
@Controller
public class MailController {
	
	@Autowired MailService ms;//메일관련 class

	//가입 메일인증 ajax Controller
	@ResponseBody //ajax후 값 리턴
	@PostMapping(value = "sendMail",
				produces = "application/json; charset=utf-8")
	public String sendMail(String mail,
							HttpServletResponse response,
							HttpServletRequest request) 
										throws Exception{
		String key = ms.gmailLogin(mail);//메일 전송 메소드
		return key; //key값 전송
	}

	//로그인 페이지 Controller
	@GetMapping("mailtest")
	public String mailtest() {
		return "mailtest";
	}
	
}
