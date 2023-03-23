from django.urls import path
from adminapp8 import views


urlpatterns = [
	path('index/',views.admin_index),
	path('signup/',views.admin_signup),
	path('',views.admin_login),
	path('logout/',views.admin_logout),
	path('forms/',views.admin_forms),
	path('product_tables/',views.admin_product_tables),
	path('product_update/',views.admin_product_update),
	path('product_delete/',views.admin_product_delete),
	path('userform/',views.admin_userform),
	path('cat_form/',views.admin_cat_form),
	path('cat_table/',views.admin_cat_table),
	path('contact_details/',views.admin_contact_details)
	
	




]