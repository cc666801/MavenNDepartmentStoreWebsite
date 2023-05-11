package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;

@Service
public class EmailService {
    @Autowired
    private JavaMailSender mailSender;
    @ResponseBody
    public void sendVerificationEmail(Member member, String token) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(member.getEmail());
        message.setSubject("MavenNDepartmentStoreWebsite 會員驗證信");
        message.setText("親愛的 " + member.getName() + " 您好，\n\n感謝您加入MavenNDepartmentStoreWebsite！\n\n請點擊以下連結進行帳戶驗證：\n\n"
            + "http://localhost:8080/MavenNDepartmentStoreWebsite/member/verify?token=" + token + "\n\n"
            + "此信件為系統自動發送，請勿回覆。\n\n" + "MavenNDepartmentStoreWebsite團隊 敬上");
        mailSender.send(message);
    }
    
    @ResponseBody
    public void sendVerificationPassword(Member member, String token) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(member.getEmail());
        message.setSubject("MavenNDepartmentStoreWebsite 忘記密碼信");
        message.setText("親愛的 " + member.getName() + " 您好，\n\n請點擊以下連結進行修改：\n\n"
            + "http://localhost:8080/MavenNDepartmentStoreWebsite/member/resetPassword?token=" + token + "\n\n"
            + "此信件為系統自動發送，請勿回覆。\n\n" + "MavenNDepartmentStoreWebsite團隊 敬上");
        mailSender.send(message);
    }
}
