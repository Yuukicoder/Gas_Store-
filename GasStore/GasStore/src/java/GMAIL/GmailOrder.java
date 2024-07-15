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
 * @author dell456
 */
public class GmailOrder {
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
            message.setSubject("Order Details");

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
