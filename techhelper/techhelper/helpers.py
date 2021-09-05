from django.core.mail import send_mail
from django.conf import settings


def send_forget_password_mail(email, token):
    subject = 'Your forget password link'
    message = f'Hi , click on the link to reset your password http://127.0.0.1:8000/accounts/change-password/{token}/'
    email_from = settings.EMAIL_HOST_USER
    recipient_list = [email]
    send_mail(subject, message, email_from, recipient_list)
    return True


def send_comment_mail(email, name, token):
    subject = 'Discussion Notifications'
    message = f'{name} updated a discussion in your post. Click the link given below to view.\n\n http://127.0.0.1:8000/view-question/{token}/'
    email_from = settings.EMAIL_HOST_USER
    recipient_list = [email]
    send_mail(subject, message, email_from, recipient_list)
    return True


def send_point_purchase_mail(name):
    subject = 'Point Purchase Request'
    message = f'{name} requested for purchase some points. Click the link given below to view.\n\n http://127.0.0.1:8000/admin-panel'
    email_from = settings.EMAIL_HOST_USER
    recipient_list = ['techhelper72428@gmail.com']
    send_mail(subject, message, email_from, recipient_list)
    return True

def send_point_success_mail(email):
    subject = 'Point Added'
    message = f'Your requested point has been added to your account. Click the link given below to view.\n\n http://127.0.0.1:8000'
    email_from = settings.EMAIL_HOST_USER
    recipient_list = [email]
    send_mail(subject, message, email_from, recipient_list)
    return True
