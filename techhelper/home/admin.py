from .models import UserQuestion, UserContact, UserJobs, UserInternships, BkashPayment
from django.contrib import admin

# Register your models here.

admin.site.register(UserQuestion)
admin.site.register(UserContact)
admin.site.register(UserJobs)
admin.site.register(UserInternships)
admin.site.register(BkashPayment)

