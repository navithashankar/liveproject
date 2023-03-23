from django.urls import path
from app8 import views

urlpatterns = [
	
	path('',views.index),
	path('contact/',views.contact),
	path('about/',views.about),
	path('services_details/',views.services_details),
	path('services/',views.services),
	path('projects/',views.projects),
	path('projects_details/',views.projects_details),
	path('gallery/',views.gallery),
	path('catagory/',views.catagory),
	path('service_table/',views.service_table),
	path('our_services/',views.our_services)
	
	



]