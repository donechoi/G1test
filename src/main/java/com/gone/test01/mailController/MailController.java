package com.gone.test01.mailController;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gone.test01.mailService.MailService;

@Controller
public class MailController {
	
	
/*	
	@Autowired MailService ms;
	
	@GetMapping("sendmail")
	public void sendMail() throws Exception{
		ms.sendMail("xana_@naver.com",
					"제목썼는디",
					"내용적었슈");
	}
*/
	
	@Inject
	MailService ms;  //@Service를 붙였었다.

	@RequestMapping("sendmail")
	@ResponseBody
	public String mailAuth(String mail, HttpServletResponse resp) throws Exception {
	    String authKey = ms.sendAuthMail(mail); //사용자가 입력한 메일주소로 메일을 보냄
	    return authKey;
	}
	
	@GetMapping("mailtest")
	public String mailtest() {
		return "mailtest";
	}
	
}
