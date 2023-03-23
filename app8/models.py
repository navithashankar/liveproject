from django.db import models

# Create your models here.




class contact_tb(models.Model):
	name=models.CharField(max_length=255)
	mobileno=models.CharField(max_length=255)
	subject=models.CharField(max_length=255)
	email=models.CharField(max_length=255)
	message=models.TextField()


class admin_tb(models.Model):
	fname=models.CharField(max_length=255)
	lname=models.CharField(max_length=255)
	email=models.CharField(max_length=255)
	password=models.CharField(max_length=255)
	password2=models.CharField(max_length=255)
	hashpassword=models.TextField()


class catagory_tb(models.Model):
	catagory=models.CharField(max_length=225)



class form_tb(models.Model):
	name=models.CharField(max_length=255)
	price=models.CharField(max_length=255)
	offprice=models.CharField(max_length=255)
	details=models.TextField()
	catagory=models.ForeignKey(catagory_tb, on_delete=models.CASCADE)
	proimage=models.ImageField(upload_to="product/")




class user_tb(models.Model):
	name=models.CharField(max_length=255)
	email=models.CharField(max_length=255)
	mobileno=models.CharField(max_length=255)
	details=models.CharField(max_length=255)
	sid=models.ForeignKey(form_tb, on_delete=models.CASCADE)