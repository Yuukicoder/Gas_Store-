/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package GMAIL;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author phung
 */
public class Gmail {

    private static final String FROM_EMAIL = "phungvietanh1994@gmail.com";
    private static final String PASSWORD = "qhtfpbbfhcsijuwa";


    public void sendEmail(String content ,String toGmail) {

        // Khai báo các thuộc tính
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Tạo session và authenticator
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM_EMAIL, PASSWORD);
            }
        });

        try {
            // Tạo một tin nhắn
            Message message = new MimeMessage(session);

            // Thiết lập người gửi
            message.setFrom(new InternetAddress(FROM_EMAIL));

            // Thiết lập người nhận
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toGmail, false));

            // Thiết lập tiêu đề
            message.setSubject("Password");

            // Thiết lập nội dung email dưới dạng HTML
            message.setContent(content, "text/html");

   

            // Gửi email
            Transport.send(message);

            System.out.println("Email sent successfully!");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}