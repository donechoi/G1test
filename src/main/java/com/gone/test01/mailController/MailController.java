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
	
	@Autowired MailService ms;
	
	@GetMapping("sendmail")
	public void sendMail() throws Exception{
		ms.emailLogin(null);
	}

}
