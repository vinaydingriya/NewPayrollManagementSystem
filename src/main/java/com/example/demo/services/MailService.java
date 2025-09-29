package com.example.demo.services;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.internet.MimeMessage;

@Service
public class MailService {

    private final JavaMailSender mailSender;
    private final String fromAddress;
    private final String fromName;

    public MailService(JavaMailSender mailSender,
                       @Value("${payroll.mail.from-address:${spring.mail.username}}") String fromAddress,
                       @Value("${payroll.mail.from-name:Payroll System}") String fromName) {
        this.mailSender = mailSender;
        this.fromAddress = fromAddress;
        this.fromName = fromName;
    }

    public void sendMailWithAttachment(String to, String subject, String body, byte[] attachmentBytes,
            String attachmentName) throws Exception {
        MimeMessage message = mailSender.createMimeMessage();
        // set UTF-8 to support display name characters
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
        helper.setTo(to);
        helper.setSubject(subject);
        helper.setText(body, false);
        // Use configured from address and friendly name (displayed to recipient)
        helper.setFrom(fromAddress, fromName);
        helper.addAttachment(attachmentName, new ByteArrayResource(attachmentBytes));
        mailSender.send(message);
    }
}
