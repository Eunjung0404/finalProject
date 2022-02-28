package com.test.finalproject;

import javax.mail.internet.MimeMessage;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MailTest {
	@Autowired JavaMailSenderImpl mailSender;
	
//	@Test
	public void mailAuthTest() {	
		
		// 메일 제목, 내용
		String subject = "제목";
		String content = "내용";
		
		// 보내는 사람
		String from = "kimjh-_-@naver.com";
		
		// 받는 사람
		String[] to = new String[2];
		to[0] = "jaehwank@kakao.com";
		to[1] = "kimjh-_-@naver.com";
		
		try {
			// 메일 내용 넣을 객체와 이를 도와주는 Helper 객체 생성
			MimeMessage mail = mailsSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");
			
			// 메일 내용을 채워줌
			mailHelper.setFrom(from);	// 보내는 사람
			mailHelper.setTo(to);	// 받는 사람
			mailHelper.setSubject(subject);	// 제목
			mailHelper.setText(content);	// 내용
			
			// 메일 전송
			mailsSender.send(mail);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
