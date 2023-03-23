from django.shortcuts import render
from app8.models import *
from adminapp8.models import *
from django.http import HttpResponseRedirect
import os
from django.conf import settings
import string
import random
import hashlib
from django.core.mail import send_mail 
import datetime

# Create your views here.


def index(request):
	data=catagory_tb.objects.all()
	return render(request,'index.html',{"prd":data})
	

def about(request):
	return render(request,'about.html')



	
def contact(request):
	catagory=contact_tb.objects.raw('SELECT * FROM app8_contact_tb GROUP BY catagory')
	if request.method == "POST":
		cname=request.POST['Name']
		cmobileno=request.POST['Mobileno']
		csubject=request.POST['Subject']
		cemail=request.POST['Email']
		cmessage=request.POST['Message']
		check=contact_tb.objects.filter(name=cname,mobileno=cmobileno,subject=csubject,email=cemail,message=cmessage)
		if check:
			return render(request,'contact.html',{"error":"already registered mobileno"})
		else:
			add=contact_tb(name=cname,mobileno=cmobileno,subject=csubject,email=cemail,message=cmessage)
			add.save()
			x = ''.join(random.choices(cname + string.digits, k=8))
			y = ''.join(random.choices(string.ascii_letters + string.digits, k=7))
			subject = 'Contact Form'
			message = f'Hi a message from {cname} {cemail}, subjects is {csubject}, message is {cmessage} thank you .'
			email_from = settings.EMAIL_HOST_USER 
			recipient_list = ['navitha18123@gmail.com', ] 
			send_mail( subject, message, email_from, recipient_list ) 
			return render(request,'index.html',{"success":"email saved"})
	else:
		return render(request,'contact.html',{"catagory":catagory})
	




def services_details(request):
	sid=form_tb.objects.all()
	if request.method == 'POST':
		uname=request.POST['Name']
		uemail=request.POST['Email']
		umobileno=request.POST['Mobileno']
		udetails=request.POST['Details']
		# cid=form_tb.objects.get(id=cid)
		sid=request.GET['sid']
		data=form_tb.objects.filter(id=sid)
		sid_id=form_tb.objects.get(id=sid)

		# product=form_tb.objects.all()
		check=user_tb.objects.filter(name=uname)
		if check:	
			return render(request,'services_details.html',{"error":"already registered product","prd":data})
		else:
			add = user_tb(name=uname,email=uemail,mobileno=umobileno,details=udetails,sid=sid_id)
			add.save()
			return render(request,'index.html',{"success":'data saved'})
	else:
		sid=request.GET['sid']
		data=form_tb.objects.filter(id=sid)
		return render(request,'services_details.html',{"prd":data})


def catagory(request):
	cid=request.GET['cid']
	data=form_tb.objects.filter(catagory=cid)
	# product=form_tb.objects.all()
	return render(request,'catagory.html',{"prd":data})


def services(request):
	# cid=request.GET['sid']
	data=catagory_tb.objects.all() #filter(cid=cid)
	# product=form_tb.objects.all()
	return render(request,'services.html',{"prd":data})


def service_table(request):
	data=user_tb.objects.all()
	return render(request,'service_table.html')
 	
	

def our_services(request):
	return render(request,'our_services.html')

def projects_details(request):
	return render(request,'projects_details.html')

def projects(request):
	data=form_tb.objects.all()
	return render(request,'projects.html',{"prd":data})

def gallery(request):
	data=form_tb.objects.all()
	return render(request,'gallery.html',{"prd":data})



 	
















