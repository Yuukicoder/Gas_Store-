/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package GMAIL;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 *
 * @author dell456
 */
public class GmailDiscount {
    private static final String FROM_EMAIL = "haquocminhduc@gmail.com";
    private static final String PASSWORD = "hvjn uvoe dmlc iopt";


    public void sendEmail(String content ,String toGmail) {

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM_EMAIL, PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(FROM_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toGmail, false));
            message.setSubject("Your Discount Code");

            // Tạo phần nội dung của email với MIME
            MimeMultipart multipart = new MimeMultipart();
            MimeBodyPart htmlPart = new MimeBodyPart();
            htmlPart.setContent(content, "text/html; charset=utf-8"); // Thiết lập nội dung là HTML

            multipart.addBodyPart(htmlPart);
            message.setContent(multipart);

            // Gửi email
            Transport.send(message);

            System.out.println("Email sent successfully!");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
