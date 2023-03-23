from django.shortcuts import render
from django.shortcuts import render
from app8.models import *
from adminapp8.models import *
from django.http import HttpResponseRedirect
import os
from django.conf import settings
import string
import random
from django.contrib.auth.models import User
import hashlib 

# Create your views here.

def admin_index(request):
	if request.session.has_key('aid'):
		return render(request,'admin/index.html')
	else:
		return HttpResponseRedirect('/admin_login/')


def admin_signup(request):
	if request.method == 'POST':
		cfname = request.POST['fname']
		clname = request.POST['lname']
		cemail = request.POST['email']
		cpassword = request.POST['password']
		cpassword2 = request.POST['password2']
		hashpass=hashlib.md5(cpassword.encode('utf8')).hexdigest()
		check=admin_tb.objects.filter(email=cemail)
		if cpassword == cpassword2:
			if check:
				return render(request,'admin/signup.html', {"error":"error already registered email"})
			else:
				add=admin_tb(fname=cfname,lname=clname,email=cemail,password=cpassword,hashpassword=hashpass)
				add.save()
				return render(request,'admin/index.html',{"success":"email saved"})
		else:
			return render(request,'admin/signup.html',{"error":"password does not match"})
	else:
		return render(request,'admin/signup.html')


def admin_login(request):
	if request.method == "POST":
		cemail=request.POST['email']
		cpassword=request.POST['password']
		login=admin_tb.objects.filter(email=cemail,password=cpassword)
		if login:
			for x in login:
				request.session["aid"]=x.id
				request.session["aemail"]=x.email
			return render(request,'admin/index.html',{"success":"successfully logined"})
		else:
			return render(request,'admin/login.html',{"error":"invalid details"})
	else:
		return render(request,'admin/login.html')


def admin_logout(request):
	if request.session.has_key('aid'):
		del request.session['aid']
		del request.session['aemail']
	return render(request,'admin/index.html')





def admin_forms(request):
	if request.session.has_key('aid'):
		catagory=catagory_tb.objects.all()
		if request.method == "POST":
			cname=request.POST['Name']
			cprice=request.POST['Price']
			coffprice=request.POST['Offprice']
			cdetails=request.POST['Details']
			ccatagory=request.POST["catagory"]
			ccatagory=catagory_tb.objects.get(id=ccatagory)
			cproimage=request.FILES['Proimage']
			check=form_tb.objects.filter(name=cname)
			if check:
				return render(request,'admin/forms.html',{"error":"already registered product"})
			else:
				add=form_tb(name=cname,price=cprice,offprice=coffprice,details=cdetails,catagory=ccatagory,proimage=cproimage)
				add.save()
				return render(request,'admin/index.html',{"success":'data saved'})
		else:
			return render(request,'admin/forms.html',{"data":catagory})
	else:
		return render(request,"admin/login.html")



def admin_cat_form(request):
	if request.method=="POST":
		ccatagory=request.POST['catagory']
		check=catagory_tb.objects.filter(catagory=ccatagory)
		if check:
			return render(request,'admin/cat_form.html',{'error':'already registered'})
		else:
			add=catagory_tb(catagory=ccatagory)
			add.save()
			return render(request,'admin/index.html',{'success':'data saved'})
	else:
		return render(request,'admin/cat_form.html')





def admin_cat_table(request):
	data=catagory_tb.objects.all()
	return render(request,'admin/cat_table.html',{"cat":data})





	



def admin_product_tables(request):
	data=form_tb.objects.all()
	return render(request,'admin/product_tables.html',{"prd":data})



def admin_product_update(request):
	if request.method == "POST":
		cname=request.POST['Name']
		cprice=request.POST['Price']
		coffprice=request.POST['Offprice']
		cdetails=request.POST['Details']
		prdid=request.GET['pid']
		ccatagory=request.POST['Catagory']
		imgup=request.POST['imgup']
		if imgup == "yes":
			cproimage=request.FILES['Proimage']
			oldrec=form_tb.objects.filter(id=prdid)
			updrec=form_tb.objects.get(id=prdid)
			for x in oldrec:
				imgurl=x.proimage.url
				pathtoimage=os.path.dirname(os.path.dirname(os.path.abspath(__file__)))+imgurl
				if os.path.exists(pathtoimage):
					os.remove(pathtoimage)
					print('Successfully deleted')
			updrec.proimage=cproimage
			updrec.save()


		data=form_tb.objects.filter(id=prdid).update(name=cname,price=cprice,offprice=coffprice,details=cdetails,catagory=ccatagory)
		return HttpResponseRedirect('/myadmin/forms/')
	else:
		prdid=request.GET['pid']
		data=form_tb.objects.filter(id=prdid)
		catagory=catagory_tb.objects.all()
		return render(request,'admin/product_update.html',{"details":data,"data":catagory})

	
def admin_product_delete(request):
	prdid=request.GET['pid']
	oldrec=form_tb.objects.filter(id=prdid)
	for x in oldrec:
		imgurl=x.proimage.url
		pathtoimage=os.path.dirname(os.path.dirname(os.path.abspath(__file__)))+imgurl
		if os.path.exists(pathtoimage):
			os.remove(pathtoimage)
			print('Successfully deleted')
	data=form_tb.objects.filter(id=prdid).delete()
	return HttpResponseRedirect('/myadmin/product_tables/')


def admin_userform(request):
	data=user_tb.objects.all()
	return render(request,'admin/userform.html',{"prd":data})
	

def admin_contact_details(request):
	contact=contact_tb.objects.all()
	return render(request,'admin/contact_details.html',{"contact":contact})





	