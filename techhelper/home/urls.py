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
    path('edit-question/<token>/', views.editquestion, name='edit-question'),
    path('view-job/<token>/', views.viewjob, name='view-job'),
    path('edit-job/<token>/', views.editjob, name='edit-job'),
    path('view-internship/<token>/', views.viewinternship, name='view-internship'),
    path('edit-internship/<token>/', views.editinternship, name='edit-internship'),
    path('delete-question/<token>/', views.deletequestion, name='delete-question'),
    path('delete-job/<token>/', views.deletejob, name='delete-job'),
    path('delete-internship/<token>/', views.deleteinternship, name='delete-internship'),
    path('user-profile/<token>/', views.userprofile, name='user-profile'),
    path('point-purchase', views.pointpurchase, name='point-purchase'),
    path('admin-panel', views.adminpanel, name='admin-panel'),
    path('point-add/<token>/', views.pointadd, name='point-add'),
]
