from django.urls import path
from .views import *
from rest_framework.authtoken.views import obtain_auth_token
urlpatterns = [
    path ('blood/',BloodView.as_view()),
    path ('hospitalrecord/',HospitalRecordView.as_view()),
    path ('blooddonationapplication/',DonationApplicationView.as_view()),
    path ('addhospitalrecord/',PostRecordView.as_view()),
    path ('donation/',DonationViews.as_view()),
    path('login/', obtain_auth_token),
    path('register/', RegisterUser.as_view()),
    path('register_hospital/',HospitalRegistration.as_view()),
]
