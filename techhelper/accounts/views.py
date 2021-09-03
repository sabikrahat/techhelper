from techhelper.helpers import send_forget_password_mail
from accounts.models import Profile
import uuid
from django.contrib.messages.api import success
from django.shortcuts import redirect, render
from accounts.models import UserRegister
from home.models import UserQuestion
from django.contrib import messages
from django.contrib.auth.hashers import make_password
from django.contrib.auth.hashers import check_password
from django.db import connection

# Create your views here.


def signup(request):
    context = {}
    if request.method == 'POST':
        if request.POST.get('firstName') and request.POST.get('lastName') and request.POST.get('phoneNumber') and request.POST.get('expert') and request.POST.get('email') and request.POST.get('password'):
            saveRecord = UserRegister()
            saveToken = Profile()

            t_email = request.POST.get('email')

            saveRecord.firstName = request.POST.get('firstName')
            saveRecord.lastName = request.POST.get('lastName')
            saveRecord.phoneNumber = request.POST.get('phoneNumber')
            saveRecord.expert = request.POST.get('expert')
            saveRecord.point = '100'
            saveRecord.email = t_email
            saveRecord.username = t_email.split('@')[0]
            saveRecord.password = make_password(request.POST.get('password'))

            if saveRecord.isExists():
                messages.error(request, t_email +
                               " email address already registered!")
                return render(request, 'account/signup.html', context)
            else:
                saveRecord.save()
                saveToken.user = saveRecord
                saveToken.save()
                messages.success(
                    request, "New user " + t_email.split('@')[0] + ", registration details saved successfully...! Please Log in now.")
                return render(request, 'account/signup.html', context)

    else:
        return render(request, 'account/signup.html', context)


def login(request):
    context = {}
    if request.method == 'POST':
        try:
            userDetail = UserRegister.objects.get(
                email=request.POST.get('email'))
            if check_password(request.POST.get('password'), (userDetail.password)):
                request.session['email'] = userDetail.email
                return redirect('/')
            else:
                messages.error(
                    request, 'Password incorrect...!')
        except UserRegister.DoesNotExist as e:
            messages.error(
                request, 'No user found of this email....!')

    return render(request, 'account/login.html', context)


def logout(request):
    try:
        del request.session['email']
        messages.success(request, "Successfully logged out.")
    except:
        messages.error(request, "An error occurred. Try again.")
        return redirect('/')
    return redirect('/')


def profile(request):
    try:
        user = UserRegister.objects.get(email=request.session['email'])
        return render(request, 'account/profile.html', {'user': user})
    except:
        messages.error(request, 'You need to login first')
        return redirect(login)


def myposts(request):
    try:
        user = UserRegister.objects.get(email=request.session['email'])
        cursor = connection.cursor()
        cursor.execute(
            'SELECT * FROM app_users au, users_questions uq WHERE au.id = uq.publisherId and uq.PUBLISHERID =  %s ORDER BY uq.id DESC', [user.id])
        questions = cursor.fetchall()
        cursor.close()
        return render(request, 'account/my-post.html', {'questions': questions, 'user': user})

    except:
        messages.error(request, 'You need to login first')
        return redirect(login)


def edit_profile(request):
    if request.method == 'POST':
        user = UserRegister.objects.get(email=request.session['email'])
        if request.POST.get('editFirstName') and request.POST.get('editLastName') and request.POST.get('editPhoneNumber') and request.POST.get('editUsername') and request.POST.get('editExpert'):

            updateRecord = UserRegister()

            updateRecord.id = user.id
            updateRecord.firstName = request.POST.get('editFirstName')
            updateRecord.lastName = request.POST.get('editLastName')
            updateRecord.phoneNumber = request.POST.get('editPhoneNumber')
            updateRecord.email = request.POST.get('editEmail')
            updateRecord.username = request.POST.get('editUsername')
            updateRecord.expert = request.POST.get('editExpert')
            updateRecord.password = user.password
            updateRecord.point = user.point

            if len(request.FILES) != 0:
                updateRecord.image = request.FILES['editPhoto']

            updateRecord.save()
            messages.success(
                request, "User details updated successfully...!")

            return redirect('edit-profile')

    else:
        try:
            user = UserRegister.objects.get(email=request.session['email'])
            return render(request, 'account/edit-profile.html', {'user': user})
        except:
            messages.error(request, 'You need to login first')
            return redirect('login')


def reset_password(request):
    try:
        if request.method == 'POST' and request.POST.get('resetEmail'):
            email = request.POST.get('resetEmail')

        if not UserRegister.objects.filter(email=email).first():
            messages.error(request, 'No user found with this email.')
            return render(request, 'reset_password/forget-password.html')

        user_obj = UserRegister.objects.get(email=email)
        token = str(uuid.uuid4())
        profile_obj = Profile.objects.get(user=user_obj.id)
        profile_obj.forget_password_token = token
        profile_obj.save()
        send_forget_password_mail(user_obj.email, token)
        messages.success(request, 'An email is sent.')
        return render(request, 'reset_password/forget-password.html')

    except Exception as e:
        print(e)
    return render(request, 'reset_password/forget-password.html')


def change_password(request, token):
    context = {}

    try:
        profile_obj = Profile.objects.filter(
            forget_password_token=token).first()
        context = {'user_id': profile_obj.user.id}

        if request.method == 'POST':
            new_password = request.POST.get('new_password')
            confirm_password = request.POST.get('reconfirm_password')
            user_id = request.POST.get('user_id')

            if user_id is None:
                messages.error(request, 'No user id found.')
                return render(request, f'reset_password/change-password/{token}/.html', context)

            if new_password != confirm_password:
                messages.error(request, 'both should  be equal.')
                return render(request, f'reset_password/change-password/{token}/.html', context)

            user_obj = UserRegister.objects.filter(id=user_id).first()
            user_obj.password = make_password(new_password)
            user_obj.save()
            messages.success(request, 'Password updated.')
            return render(request, 'reset_password/change-password.html', context)
        else:
            return render(request, 'reset_password/change-password.html', context)

    except Exception as e:
        print(e)
        messages.error(request, 'url has already been used.')
        return render(request, 'reset_password/change-password.html', context)


def throwtologin(request):
    messages.error(request, 'You need to login first')
    return redirect(login)
