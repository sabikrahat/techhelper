from django.urls import path
from home import views

urlpatterns = [
    path('', views.index, name='index'),
    path('feedback', views.feedback, name='feedback'),
    path('privacy-policy', views.privacy, name='privacy-policy'),
    path('terms-and-conditions', views.terms, name='terms-and-conditions'),
    path('job-vacancy', views.job, name='job-vacancy'),
    path('internship', views.internship, name='internship'),
    path('ask-a-question', views.askquestion, name='ask-a-question'),
    path('post-a-job', views.postjob, name='post-a-job'),
    path('post-an-internship', views.postinternship, name='post-an-internship'),
    path('view-question/<token>/', views.viewquestion, name='view-question'),
]
