package project.controller;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import lombok.RequiredArgsConstructor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import project.DAO.UserDao;

@Controller("mailController")
@RequiredArgsConstructor
@RequestMapping("/email")
public class MailController {

    private final JavaMailSender mailSender;
    private final UserController userController;


    @GetMapping("/mailSending")
    public void mailSending(String id, String email) throws Exception {

        int randomNum = (int)(Math.random()*10000)+155;

        String setfrom = "pib102mgr@gmail.com"; // 보내는 사람 이메일
        String tomail = email; // 받는 사람 이메일
        String title = "[PIB] 임시 비밀번호 안내 이메일 입니다"; // 제목
        String TempPassword = "TEMP"+randomNum+"PIB";
        String content = "안녕하세요. 고객님의 PIB 임시 비밀번호는"+TempPassword+" 입니다. 감사합니다."; // 내용
        System.out.println("TempPassword = " + TempPassword);


        // email 발송
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
        messageHelper.setFrom(setfrom); // 보내는사람
        messageHelper.setTo(tomail); // 받는사람 이메일
        messageHelper.setSubject(title); // 메일제목
        messageHelper.setText(content); // 메일 내용
        mailSender.send(message);

        // 임시 비밀번호를 DB에 update
        userController.updateTmpPassword(id, TempPassword);

    }
}













