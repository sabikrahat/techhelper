from django.db import models
from datetime import datetime

# Create your models here.

class UserQuestion(models.Model):
    publisherId = models.CharField(max_length=20)
    publisherName = models.CharField(max_length=50)
    title = models.CharField(max_length=100)
    description = models.CharField(max_length=3072)
    type = models.CharField(max_length=15)
    code = models.CharField(max_length=3072)
    created_at = models.DateTimeField(default=datetime.now)

    class Meta:
        db_table = 'users_questions'

class UserContact(models.Model):
    messengerId = models.CharField(max_length=10)
    messengerUsername = models.CharField(max_length=30)
    messengerEmail = models.CharField(max_length=50)
    messengerPhoneNumber = models.CharField(max_length=15)
    message = models.CharField(max_length=3072)
    created_at = models.DateTimeField(default=datetime.now)

    class Meta:
        db_table = 'users_contacts'

class UserJobs(models.Model):
    publisherId = models.CharField(max_length=15)
    publisherName = models.CharField(max_length=50)
    jobTitle = models.CharField(max_length=20)
    companyName = models.CharField(max_length=30)
    description = models.CharField(max_length=3072)
    jobType = models.CharField(max_length=15)
    paymentStatus = models.CharField(max_length=15)
    workPlace = models.CharField(max_length=15)
    minSalary = models.CharField(max_length=15)
    maxSalary = models.CharField(max_length=15)
    applyLink = models.CharField(max_length=100)
    created_at = models.DateTimeField(default=datetime.now)

    class Meta:
        db_table = 'users_jobs'


class UserInternships(models.Model):
    publisherId = models.CharField(max_length=15)
    publisherName = models.CharField(max_length=50)
    internshipTitle = models.CharField(max_length=20)
    companyName = models.CharField(max_length=30)
    description = models.CharField(max_length=3072)
    internshipType = models.CharField(max_length=15)
    paymentStatus = models.CharField(max_length=15)
    workPlace = models.CharField(max_length=15)
    minSalary = models.CharField(max_length=15)
    maxSalary = models.CharField(max_length=15)
    applyLink = models.CharField(max_length=100)
    created_at = models.DateTimeField(default=datetime.now)

    class Meta:
        db_table = 'users_internships'

class QstnCmnt(models.Model):
    publisherId = models.CharField(max_length=20)
    publisherName = models.CharField(max_length=50)
    qstnId = models.CharField(max_length=20)
    cmnt = models.CharField(max_length=3072)
    created_at = models.DateTimeField(default=datetime.now)

    class Meta:
        db_table = 'questions_comments'
