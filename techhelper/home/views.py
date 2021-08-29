from home.models import QstnCmnt
from home.models import UserInternships
from home.models import UserJobs
from home.models import UserContact
from home.models import UserQuestion
from django.contrib import messages
from accounts.models import UserRegister
from django.shortcuts import redirect, render
from django.db import connection

# Create your views here.


def index(request):
    try:
        user = UserRegister.objects.get(email=request.session['email'])
        if request.method == 'POST':
            if request.POST.get('qstnType'):
                if request.POST.get('qstnType') == "All":
                    cursor = connection.cursor()
                    cursor.execute(
                        'SELECT * FROM app_users au, users_questions uq WHERE au.id = uq.publisherId ORDER BY uq.id DESC')

                    questions = cursor.fetchall()
                    cursor.close()
                    return render(request, 'index.html', {'questions': questions, 'user': user})
                else:
                    cursor = connection.cursor()
                    cursor.execute(
                        'SELECT * FROM app_users au, users_questions uq WHERE au.id = uq.publisherId and TYPE = %s ORDER BY uq.id DESC', [request.POST['qstnType']])

                    questions = cursor.fetchall()
                    cursor.close()
                    return render(request, 'index.html', {'questions': questions, 'user': user})
            else:
                cursor = connection.cursor()
                cursor.execute(
                    'SELECT * FROM app_users au, users_questions uq WHERE au.id = uq.publisherId ORDER BY uq.id DESC')

                questions = cursor.fetchall()
                cursor.close()
                return render(request, 'index.html', {'questions': questions, 'user': user})
        else:
            cursor = connection.cursor()
            cursor.execute(
                'SELECT * FROM app_users au, users_questions uq WHERE au.id = uq.publisherId ORDER BY uq.id DESC')

            questions = cursor.fetchall()
            cursor.close()
            return render(request, 'index.html', {'questions': questions, 'user': user})
    except:
        if request.method == 'POST':
            if request.POST.get('qstnType'):
                if request.POST.get('qstnType') == "All":
                    cursor = connection.cursor()
                    cursor.execute(
                        'SELECT * FROM app_users au, users_questions uq WHERE au.id = uq.publisherId ORDER BY uq.id DESC')

                    questions = cursor.fetchall()
                    cursor.close()
                    return render(request, 'index.html', {'questions': questions})
                else:
                    cursor = connection.cursor()
                    cursor.execute(
                        'SELECT * FROM app_users au, users_questions uq WHERE au.id = uq.publisherId and TYPE = %s ORDER BY uq.id DESC', [request.POST['qstnType']])

                    questions = cursor.fetchall()
                    cursor.close()
                    return render(request, 'index.html', {'questions': questions})
            else:
                cursor = connection.cursor()
                cursor.execute(
                    'SELECT * FROM app_users au, users_questions uq WHERE au.id = uq.publisherId ORDER BY uq.id DESC')

                questions = cursor.fetchall()
                cursor.close()
                return render(request, 'index.html', {'questions': questions})
        else:
            cursor = connection.cursor()
            cursor.execute(
                'SELECT * FROM app_users au, users_questions uq WHERE au.id = uq.publisherId ORDER BY uq.id DESC')

            questions = cursor.fetchall()
            cursor.close()
            return render(request, 'index.html', {'questions': questions})


def feedback(request):
    try:
        user = UserRegister.objects.get(email=request.session['email'])

        if request.method == 'POST':
            if request.POST.get('txtUsername') and request.POST.get('txtEmail') and request.POST.get('txtPhone') and request.POST.get('txtMsg'):
                saveContact = UserContact()

                saveContact.messengerId = user.id
                saveContact.messengerUsername = request.POST.get(
                    'txtUsername')
                saveContact.messengerEmail = request.POST.get('txtEmail')
                saveContact.messengerPhoneNumber = request.POST.get(
                    'txtPhone')
                saveContact.message = request.POST.get('txtMsg')

                saveContact.save()
                messages.success(
                    request, "Your message has been submitted.")
                return render(request, 'feedback.html', {'user': user})
        else:
            return render(request, 'feedback.html', {'user': user})
    except:
        messages.success(request, 'You need to login first')
        return redirect('login')


def privacy(request):
    try:
        user = UserRegister.objects.get(email=request.session['email'])
        return render(request, 'privacy-policy.html', {'user': user})
    except:
        return render(request, 'privacy-policy.html')


def terms(request):
    try:
        user = UserRegister.objects.get(email=request.session['email'])
        return render(request, 'terms-and-conditions.html', {'user': user})
    except:
        return render(request, 'terms-and-conditions.html')


def job(request):
    jobs = UserQuestion.objects.raw(
        'SELECT * FROM app_users au, users_jobs uj WHERE au.id = uj.publisherId ORDER BY uj.id DESC')
    try:
        user = UserRegister.objects.get(email=request.session['email'])
        return render(request, 'job.html', {'jobs': jobs, 'user': user})
    except:
        return render(request, 'job.html', {'jobs': jobs})


def internship(request):
    internships = UserQuestion.objects.raw(
        'SELECT * FROM app_users au, users_internships ui WHERE au.id = ui.publisherId ORDER BY ui.id DESC')
    try:
        user = UserRegister.objects.get(email=request.session['email'])
        return render(request, 'internship.html', {'internships': internships, 'user': user})
    except:
        return render(request, 'internship.html', {'internships': internships})


def askquestion(request):
    if request.method == 'POST':
        if request.POST.get('questionTitle') and request.POST.get('qustionDescription') and request.POST.get('questionType') and request.POST.get('questionCode'):
            saveQuestion = UserQuestion()

            user = UserRegister.objects.get(email=request.session['email'])

            saveQuestion.publisherId = user.id
            saveQuestion.publisherName = user.firstName + " " + user.lastName
            saveQuestion.title = request.POST.get('questionTitle')
            saveQuestion.description = request.POST.get(
                'qustionDescription')
            saveQuestion.type = request.POST.get('questionType')
            saveQuestion.code = request.POST.get('questionCode')

            if int(user.point) >= 10:
                user.point = str(int(user.point) - 10)

                user.save()

                saveQuestion.save()
                messages.success(
                    request, "Your question has been submitted!")
                return render(request, 'ask-question.html', {'user': user})
            else:
                messages.success(
                    request, "You don't have enough point! Please buy points.")
                return render(request, 'ask-question.html', {'user': user})
    else:
        try:
            user = UserRegister.objects.get(email=request.session['email'])
            return render(request, 'ask-question.html', {'user': user})
        except:
            messages.success(request, 'You need to login first')
            return redirect('login')


def postjob(request):
    try:
        user = UserRegister.objects.get(email=request.session['email'])
        if request.method == 'POST':
            if request.POST.get('jobTitle') and request.POST.get('companyName') and request.POST.get('jobDescription') and request.POST.get('jobType') and request.POST.get('paymentStatus') and request.POST.get('workPlace') and request.POST.get('minSalary') and request.POST.get('maxSalary'):
                saveJob = UserJobs()

                saveJob.publisherId = user.id
                saveJob.publisherName = user.firstName + " " + user.lastName
                saveJob.jobTitle = request.POST.get('jobTitle')
                saveJob.companyName = request.POST.get('companyName')
                saveJob.description = request.POST.get('jobDescription')
                saveJob.jobType = request.POST.get('jobType')
                saveJob.paymentStatus = request.POST.get('paymentStatus')
                saveJob.workPlace = request.POST.get('workPlace')
                saveJob.minSalary = request.POST.get('minSalary')
                saveJob.maxSalary = request.POST.get('maxSalary')

                if int(user.point) >= 20:
                    user.point = str(int(user.point) - 20)

                    user.save()

                    saveJob.save()
                    messages.success(
                        request, "Your job post has been submitted!")
                else:
                    messages.success(
                        request, "You don't have enough point! Please buy points.")
                return render(request, 'post-job.html', {'user': user})
        else:
            return render(request, 'post-job.html', {'user': user})
    except:
        messages.success(request, 'You need to login first')
        return redirect('login')


def postinternship(request):
    try:
        user = UserRegister.objects.get(email=request.session['email'])
        if request.method == 'POST':
            if request.POST.get('internshipTitle') and request.POST.get('companyName') and request.POST.get('internshipDescription') and request.POST.get('internshipType') and request.POST.get('paymentStatus') and request.POST.get('workPlace') and request.POST.get('minSalary') and request.POST.get('maxSalary'):
                saveInternship = UserInternships()

                saveInternship.publisherId = user.id
                saveInternship.publisherName = user.firstName + " " + user.lastName
                saveInternship.internshipTitle = request.POST.get(
                    'internshipTitle')
                saveInternship.companyName = request.POST.get(
                    'companyName')
                saveInternship.description = request.POST.get(
                    'internshipDescription')
                saveInternship.internshipType = request.POST.get(
                    'internshipType')
                saveInternship.paymentStatus = request.POST.get(
                    'paymentStatus')
                saveInternship.workPlace = request.POST.get('workPlace')
                saveInternship.minSalary = request.POST.get('minSalary')
                saveInternship.maxSalary = request.POST.get('maxSalary')

                if int(user.point) >= 20:
                    user.point = str(int(user.point) - 20)

                    user.save()

                    saveInternship.save()
                    messages.success(
                        request, "Your internship post has been submitted!")
                else:
                    messages.success(
                        request, "You don't have enough point! Please buy points.")
                return render(request, 'post-internship.html', {'user': user})
        else:
            return render(request, 'post-internship.html', {'user': user})
    except:
        messages.success(request, 'You need to login first')
        return redirect('login')


def viewquestion(request, token):
    cursor = connection.cursor()
    cursor.execute(
        'SELECT * FROM app_users au, users_questions uq WHERE au.id = uq.publisherId and uq.id = %s ORDER BY uq.id DESC', [token])

    questions = cursor.fetchall()
    cursor.close()

    try:
        user = UserRegister.objects.get(email=request.session['email'])
        if request.method == 'POST':
            if request.POST.get('inputCmnt'):
                cmnt = request.POST.get('inputCmnt')
                if cmnt == "":
                    cursor = connection.cursor()
                    cursor.execute(
                        'SELECT * FROM app_users au, questions_comments qc WHERE au.id = qc.publisherId and QSTNID = %s ORDER BY qc.id DESC', [token])
                    cmnts = cursor.fetchall()
                    cursor.close()
                    messages.success(
                        request, "You can't post an empty discussion")
                    return render(request, 'view-question.html', {'questions': questions, 'cmnts': cmnts, 'user': user})
                else:
                    saveCmnt = QstnCmnt()

                    saveCmnt.publisherId = user.id
                    saveCmnt.publisherName = user.firstName + " " + user.lastName
                    saveCmnt.qstnId = token
                    saveCmnt.cmnt = cmnt

                    saveCmnt.save()

                    if user.id != questions[0][0]:
                        user.point = str(int(user.point) + 10)
                        user.save()

                    cursor = connection.cursor()
                    cursor.execute(
                        'SELECT * FROM app_users au, questions_comments qc WHERE au.id = qc.publisherId and QSTNID = %s ORDER BY qc.id DESC', [token])
                    cmnts = cursor.fetchall()
                    cursor.close()
                    messages.success(request, "Your discussion posted.")
                    return render(request, 'view-question.html', {'questions': questions, 'cmnts': cmnts, 'user': user})
            else:
                cursor = connection.cursor()
                cursor.execute(
                    'SELECT * FROM app_users au, questions_comments qc WHERE au.id = qc.publisherId and QSTNID = %s ORDER BY qc.id DESC', [token])
                cmnts = cursor.fetchall()
                cursor.close()
                return render(request, 'view-question.html', {'questions': questions, 'cmnts': cmnts, 'user': user})
        else:
            cursor = connection.cursor()
            cursor.execute(
                'SELECT * FROM app_users au, questions_comments qc WHERE au.id = qc.publisherId and QSTNID = %s ORDER BY qc.id DESC', [token])
            cmnts = cursor.fetchall()
            cursor.close()

            return render(request, 'view-question.html', {'questions': questions, 'cmnts': cmnts, 'user': user})

    except:
        if request.method == 'POST':
            messages.success(
                request, "You need to login first.")
        return render(request, 'view-question.html', {'questions': questions})
