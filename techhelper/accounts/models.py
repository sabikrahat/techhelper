from django.db import models
# Create your models here.
from datetime import datetime
import os


def filepath(request, filename):
    old_filename = filename
    timeNow = datetime.now().strftime('%Y%m%d%H:%M:%S')
    filename = "%s-%s" % (timeNow, old_filename)
    return os.path.join('uploads/', filename)


class UserRegister(models.Model):
    firstName = models.CharField(max_length=20)
    lastName = models.CharField(max_length=20)
    phoneNumber = models.CharField(max_length=15)
    expert = models.CharField(max_length=15)
    point = models.CharField(max_length=5)
    email = models.CharField(max_length=50)
    username = models.CharField(max_length=30)
    password = models.CharField(max_length=1024)
    image = models.ImageField(upload_to=filepath, null=True, blank=True)
    created_at = models.DateTimeField(default=datetime.now)

    class Meta:
        db_table = 'app_users'

    def isExists(self):
        if UserRegister.objects.filter(email=self.email):
            return True
        return False


class Profile(models.Model):
    user = models.OneToOneField(UserRegister, on_delete=models.CASCADE)
    forget_password_token = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'profile_tokens'

    def __str__(self):
        return self.user.email
