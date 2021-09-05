
from techhelper.helpers import send_comment_mail, send_point_purchase_mail, send_point_success_mail
from home.models import QstnCmnt
from home.models import UserInternships
from home.models import UserJobs
from home.models import UserContact
from home.models import UserQuestion
from home.models import BkashPayment
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
        messages.error(request, 'You need to login first')
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
    cursor = connection.cursor()
    cursor.execute(
        'SELECT * FROM app_users au, users_jobs uj WHERE au.id = uj.publisherId ORDER BY uj.id DESC')

    jobs = cursor.fetchall()
    cursor.close()
    try:
        user = UserRegister.objects.get(email=request.session['email'])
        return render(request, 'job.html', {'jobs': jobs, 'user': user})
    except:
        return render(request, 'job.html', {'jobs': jobs})


def internship(request):
    cursor = connection.cursor()
    cursor.execute(
        'SELECT * FROM app_users au, users_internships ui WHERE au.id = ui.publisherId ORDER BY ui.id DESC')

    internships = cursor.fetchall()
    cursor.close()
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
                messages.error(
                    request, "You don't have enough point! Please buy points.")
                return render(request, 'ask-question.html', {'user': user})
    else:
        try:
            user = UserRegister.objects.get(email=request.session['email'])
            return render(request, 'ask-question.html', {'user': user})
        except:
            messages.error(request, 'You need to login first')
            return redirect('login')


def postjob(request):
    try:
        user = UserRegister.objects.get(email=request.session['email'])
        if request.method == 'POST':
            if request.POST.get('jobTitle') and request.POST.get('companyName') and request.POST.get('jobDescription') and request.POST.get('jobType') and request.POST.get('paymentStatus') and request.POST.get('workPlace') and request.POST.get('minSalary') and request.POST.get('maxSalary') and request.POST.get('applyLink'):
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
                saveJob.applyLink = request.POST.get('applyLink')

                if int(user.point) >= 20:
                    user.point = str(int(user.point) - 20)

                    user.save()

                    saveJob.save()
                    messages.success(
                        request, "Your job post has been submitted!")
                else:
                    messages.error(
                        request, "You don't have enough point! Please buy points.")
                return render(request, 'post-job.html', {'user': user})
        else:
            return render(request, 'post-job.html', {'user': user})
    except:
        messages.error(request, 'You need to login first')
        return redirect('login')


def postinternship(request):
    try:
        user = UserRegister.objects.get(email=request.session['email'])
        if request.method == 'POST':
            if request.POST.get('internshipTitle') and request.POST.get('companyName') and request.POST.get('internshipDescription') and request.POST.get('internshipType') and request.POST.get('paymentStatus') and request.POST.get('workPlace') and request.POST.get('minSalary') and request.POST.get('maxSalary') and request.POST.get('applyLink'):
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
                saveInternship.applyLink = request.POST.get('applyLink')

                if int(user.point) >= 20:
                    user.point = str(int(user.point) - 20)

                    user.save()

                    saveInternship.save()
                    messages.success(
                        request, "Your internship post has been submitted!")
                else:
                    messages.error(
                        request, "You don't have enough point! Please buy points.")
                return render(request, 'post-internship.html', {'user': user})
        else:
            return render(request, 'post-internship.html', {'user': user})
    except:
        messages.error(request, 'You need to login first')
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
                    messages.error(
                        request, "You can't post an empty discussion")
                    return render(request, 'view-question.html', {'questions': questions, 'cmnts': cmnts, 'user': user})
                else:
                    saveCmnt = QstnCmnt()

                    saveCmnt.publisherId = user.id
                    saveCmnt.publisherName = user.firstName + " " + user.lastName
                    saveCmnt.qstnId = token
                    saveCmnt.cmnt = cmnt

                    saveCmnt.save()

                    send_comment_mail(
                        questions[0][6], user.firstName + ' ' + user.lastName, token)

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
            messages.error(
                request, "You need to login first.")
        return render(request, 'view-question.html', {'questions': questions})


def editquestion(request, token):
    cursor = connection.cursor()
    cursor.execute(
        'SELECT * FROM app_users au, users_questions uq WHERE au.id = uq.publisherId and uq.id = %s ORDER BY uq.id DESC', [token])

    questions = cursor.fetchall()
    cursor.close()

    if request.method == 'POST':
        if request.POST.get('editQuestionTitle') and request.POST.get('editQustionDescription') and request.POST.get('editQuestionType') and request.POST.get('editQuestionCode'):

            qstn = UserQuestion.objects.get(id=token)

            user = UserRegister.objects.get(email=request.session['email'])

            qstn.title = request.POST.get('editQuestionTitle')
            qstn.description = request.POST.get('editQustionDescription')
            qstn.type = request.POST.get('editQuestionType')
            qstn.code = request.POST.get('editQuestionCode')

            qstn.save()
            messages.success(
                request, "Your question has been updated!")
            return render(request, 'ask-question.html', {'questions': questions, 'user': user})
    else:
        try:
            user = UserRegister.objects.get(email=request.session['email'])
            return render(request, 'edit-question.html', {'questions': questions, 'user': user})
        except:
            messages.error(request, 'You need to login first')
            return redirect('login')


def viewjob(request, token):
    cursor = connection.cursor()
    cursor.execute(
        'SELECT * FROM app_users au, users_jobs uj WHERE au.id = uj.publisherId and uj.id = %s ORDER BY uj.id DESC', [token])

    jobs = cursor.fetchall()
    cursor.close()
    try:
        user = UserRegister.objects.get(email=request.session['email'])
        return render(request, 'view-job.html', {'jobs': jobs, 'user': user})
    except:
        return render(request, 'view-job.html', {'jobs': jobs})


def editjob(request, token):
    cursor = connection.cursor()
    cursor.execute(
        'SELECT * FROM app_users au, users_jobs uj WHERE au.id = uj.publisherId and uj.id = %s ORDER BY uj.id DESC', [token])

    jobs = cursor.fetchall()
    cursor.close()

    if request.method == 'POST':
        if request.POST.get('editJobTitle') and request.POST.get('editCompanyName') and request.POST.get('editJobDescription') and request.POST.get('editJobType') and request.POST.get('editPaymentStatus') and request.POST.get('editWorkPlace') and request.POST.get('editMinSalary') and request.POST.get('editMaxSalary') and request.POST.get('editApplyLink'):

            job = UserJobs.objects.get(id=token)

            user = UserRegister.objects.get(email=request.session['email'])

            job.jobTitle = request.POST.get('editJobTitle')
            job.companyName = request.POST.get('editCompanyName')
            job.description = request.POST.get('editJobDescription')
            job.jobType = request.POST.get('editJobType')
            job.paymentStatus = request.POST.get('editPaymentStatus')
            job.workPlace = request.POST.get('editWorkPlace')
            job.minSalary = request.POST.get('editMinSalary')
            job.maxSalary = request.POST.get('editMaxSalary')
            job.applyLink = request.POST.get('editApplyLink')

            job.save()
            messages.success(
                request, "Your job post has been updated!")
            return render(request, 'edit-job.html', {'jobs': jobs, 'user': user})
    else:
        try:
            user = UserRegister.objects.get(email=request.session['email'])
            return render(request, 'edit-job.html', {'jobs': jobs, 'user': user})
        except:
            messages.error(request, 'You need to login first')
            return redirect('login')


def viewinternship(request, token):
    cursor = connection.cursor()
    cursor.execute(
        'SELECT * FROM app_users au, users_internships ui WHERE au.id = ui.publisherId and ui.id = %s ORDER BY ui.id DESC', [token])

    internships = cursor.fetchall()
    cursor.close()
    try:
        user = UserRegister.objects.get(email=request.session['email'])
        return render(request, 'view-internship.html', {'internships': internships, 'user': user})
    except:
        return render(request, 'view-internship.html', {'internships': internships})


def editinternship(request, token):
    cursor = connection.cursor()
    cursor.execute(
        'SELECT * FROM app_users au, users_internships ui WHERE au.id = ui.publisherId and ui.id = %s ORDER BY ui.id DESC', [token])

    internships = cursor.fetchall()
    cursor.close()

    if request.method == 'POST':
        if request.POST.get('editInternshipTitle') and request.POST.get('editCompanyName') and request.POST.get('editInternshipDescription') and request.POST.get('editInternshipType') and request.POST.get('editPaymentStatus') and request.POST.get('editWorkPlace') and request.POST.get('editMinSalary') and request.POST.get('editMaxSalary') and request.POST.get('editApplyLink'):

            intern = UserInternships.objects.get(id=token)

            user = UserRegister.objects.get(email=request.session['email'])

            intern.jobTitle = request.POST.get('editInternshipTitle')
            intern.companyName = request.POST.get('editCompanyName')
            intern.description = request.POST.get('editInternshipDescription')
            intern.jobType = request.POST.get('editInternshipType')
            intern.paymentStatus = request.POST.get('editPaymentStatus')
            intern.workPlace = request.POST.get('editWorkPlace')
            intern.minSalary = request.POST.get('editMinSalary')
            intern.maxSalary = request.POST.get('editMaxSalary')
            intern.applyLink = request.POST.get('editApplyLink')

            intern.save()
            messages.success(
                request, "Your internship post has been updated!")
            return render(request, 'edit-internship.html', {'internships': internships, 'user': user})
    else:
        try:
            user = UserRegister.objects.get(email=request.session['email'])
            return render(request, 'edit-internship.html', {'internships': internships, 'user': user})
        except:
            messages.error(request, 'You need to login first')
            return redirect('login')


def deletequestion(request, token):
    try:
        qstn = UserQuestion.objects.get(id=token)
        qstn.delete()
        messages.success(
            request, "Your question has been deleted successfully.")
    except:
        messages.error(request, "An error occurred. Try again.")
        return redirect('/')
    return redirect('/')


def deletejob(request, token):
    try:
        job = UserJobs.objects.get(id=token)
        job.delete()
        messages.success(
            request, "Your job post has been deleted successfully.")
    except:
        messages.error(request, "An error occurred. Try again.")
        return redirect('/')
    return redirect('/')


def deleteinternship(request, token):
    try:
        internship = UserInternships.objects.get(id=token)
        internship.delete()
        messages.success(
            request, "Your internship post has been deleted successfully.")
    except:
        messages.error(request, "An error occurred. Try again.")
        return redirect('/')
    return redirect('/')


def userprofile(request, token):
    suser = UserRegister.objects.get(id=token)
    try:
        user = UserRegister.objects.get(email=request.session['email'])
        return render(request, 'user-profile.html', {'user': user, 'suser': suser})
    except:
        return render(request, 'user-profile.html', {'user': user, 'suser': suser})


def pointpurchase(request):
    try:
        user = UserRegister.objects.get(email=request.session['email'])

        if request.method == 'POST':
            if request.POST.get('inputName') and request.POST.get('inputUsername') and request.POST.get('inputEmail') and request.POST.get('bkashNumber') and request.POST.get('bkashTransaction') and request.POST.get('inputPoint'):

                savePayment = BkashPayment()

                savePayment.name = request.POST.get('inputName')
                savePayment.username = request.POST.get('inputUsername')
                savePayment.email = request.POST.get('inputEmail')
                savePayment.status = 'Pending'
                savePayment.bkashNumber = request.POST.get('bkashNumber')
                savePayment.bkashTransaction = request.POST.get(
                    'bkashTransaction')
                savePayment.point = request.POST.get('inputPoint')

                savePayment.save()
                send_point_purchase_mail(request.POST.get('inputName'))
                messages.success(
                    request, "Your point purchase request has been submitted. We will confirm you by email within an hour.")
                return render(request, 'point-purchase.html', {'user': user})
        else:
            return render(request, 'point-purchase.html', {'user': user})
    except:
        messages.error(request, 'You need to login first')
        return redirect('login')


def adminpanel(request):
    try:
        user = UserRegister.objects.get(email=request.session['email'])

        if user.email == 'techhelper72428@gmail.com':
            pendings = BkashPayment.objects.raw(
                'SELECT * FROM bkash_payment WHERE STATUS = %s', ['Pending'])
            return render(request, 'admin-panel.html', {'user': user, 'pendings': pendings})
        else:
            messages.error(request, "Restricted! Only admin users can access.")
            return redirect('/', {'user': user})
    except:
        messages.error(request, 'You need to login first')
        return redirect('login')


def pointadd(request, token):
    cursor = connection.cursor()
    cursor.execute(
        'SELECT * FROM app_users au, bkash_payment bp WHERE au.email = bp.email and bp.id = %s ORDER BY bp.id DESC', [token])

    puser = cursor.fetchall()
    cursor.close()
    try:
        user = UserRegister.objects.get(email=request.session['email'])

        if user.email == 'techhelper72428@gmail.com':

            tuser = UserRegister.objects.get(email=puser[0][14])

            tuser.point = str(int(tuser.point) + int(puser[0][17]))
            tuser.save()

            pend = BkashPayment.objects.get(id=token)
            pend.status = "Done"
            pend.save()

            send_point_success_mail(puser[0][14])

            pendings = BkashPayment.objects.raw(
                'SELECT * FROM bkash_payment WHERE STATUS = %s', ['Pending'])

            messages.success(request, "Point added to " +
                             puser[0][12] + " user successfully.")
            return redirect('/', {'user': user})
        else:
            messages.error(request, "Restricted! Only admin users can access.")
            return redirect('/', {'user': user})
    except:
        messages.error(request, 'You need to login first')
        return redirect('login')
