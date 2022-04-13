from django.contrib import admin
from .models import *

# Register your models here 
admin.site.register([CustomUser, NormalUser,Hospital,  Blood, BloodBank, BloodDonateApplication, Donation,HospitalBloodRecord])