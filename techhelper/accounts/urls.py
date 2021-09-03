from django.urls import path
from accounts import views

urlpatterns = [
    path('signup', views.signup, name='signup'),
    path('login', views.login, name='login'),
    path('logout', views.logout, name='logout'),
    path('profile', views.profile, name='profile'),
    path('my-posts', views.myposts, name='my-posts'),
    path('edit-profile', views.edit_profile, name='edit-profile'),
    path('reset-password', views.reset_password, name='reset-password'),
    path('change-password/<token>/', views.change_password, name='change-password'),
    path('throwtologin', views.throwtologin, name='throwtologin'),
]
