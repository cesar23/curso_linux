import smtplib, ssl
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
import re


class MailUtil:

    def __init__(self, sender_mail, password):
        self.port = 465
        self.smtp_server_domain_name = "smtp.gmail.com"
        self.sender_mail = sender_mail
        self.password = password

    def send(self, emails, subject, message):
        ssl_context = ssl.create_default_context()
        service = smtplib.SMTP_SSL(self.smtp_server_domain_name, self.port, context=ssl_context)
        service.login(self.sender_mail, self.password)

        for email in emails:
            mail = MIMEMultipart('alternative')
            mail['Subject'] = subject
            mail['From'] = self.sender_mail
            mail['To'] = email

            text_template = re.sub('<[^<]+?>', '', message)
            html_template = message

            # Aqui pondra el nombre del email en el cuerpo
            html_content = MIMEText(html_template.format(email.split("@")[0]), 'html')
            text_content = MIMEText(text_template.format(email.split("@")[0]), 'plain')

            mail.attach(text_content)
            mail.attach(html_content)

            service.sendmail(self.sender_mail, email, mail.as_string())

        service.quit()

    def send_simple(self, email, subject, message):
        ssl_context = ssl.create_default_context()
        service = smtplib.SMTP_SSL(self.smtp_server_domain_name, self.port, context=ssl_context)
        service.login(self.sender_mail, self.password)

        mail = MIMEMultipart('alternative')
        mail['Subject'] = subject
        mail['From'] = self.sender_mail
        mail['To'] = email

        text_template = re.sub('<[^<]+?>', '', message)
        html_template = message

        # Aqui pondra el nombre del email en el cuerpo
        html_content = MIMEText(html_template, 'html')
        # text_content = MIMEText(text_template.format(email.split("@")[0]), 'plain')

        # mail.attach(text_content)
        mail.attach(html_content)

        service.sendmail(self.sender_mail, email, mail.as_string())

        service.quit()

if __name__ == '__main__':
    # mails = input("Enter emails: ").split()
    mails = ["perucaos@gmail.com", "sistemas_aempresarial@hotmail.com"]
    subject = "ALerta"
    # {0} sera reemplazadopor el emial
    message = """
            <h1>Felicidades</h1>

            <p>Hi {0},</p>
            <p>We are delighted announce that our website hits <b>10 Million</b> views last month.</p>
            """

    mail = MailUtil("notificacion.web.mail@gmail.com", "$cesar$.PeruAnos0?$")
    # mail.send(mails, subject, message)
    mail.send_simple("perucaos@gmail.com", "alerta22", " no e puede")
    # mail.send(mails, subject, message)
