

from tkinter import CASCADE
from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.

class CustomUser(AbstractUser):
    is_user = models.BooleanField('Is user', default=True)
    is_hospital = models.BooleanField('Is hospital', default=False)


class NormalUser(models.Model):
    user = models.OneToOneField(CustomUser, on_delete=models.CASCADE)
    address = models.CharField(max_length=200)

class Hospital(models.Model):
    user = models.OneToOneField(CustomUser, on_delete=models.CASCADE)
    hospital_name = models.CharField(max_length=200)
    address = models.CharField(max_length=200)

class BloodBank(models.Model):
    title = models.CharField(max_length=150)
    location = models.CharField(max_length=150)
    
    def __str__(self):
        return self.title

class Blood(models.Model):
    title = models.CharField(max_length=150)
    def __str__(self):
        return self.title

class BloodDonateApplication(models.Model):
    fullname = models.CharField(max_length=150)
    bloodgroup = models.CharField(max_length=100)
    phone = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    def __str__(self):
        return f"Full name = {self.fullname} | | Phone = {self.phone}"
    
class Donation(models.Model):
    bloodbank = models.ForeignKey(BloodBank,on_delete=models.CASCADE)
    location = models.TextField()
    date = models.DateField()
    time = models.TimeField(auto_now=False, auto_now_add=False)
    
    def __str__(self):
        return f"Benificiary = {self.bloodbank.title} || Location = {self.location} || Date = {self.date}  || Time = {self.time} "

class HospitalBloodRecord(models.Model):
    bloodbankname = models.CharField(max_length=100)
    location = models.TextField()
    bloodgroup = models.ForeignKey(Blood, on_delete=models.CASCADE)
    availablepints = models.CharField(max_length=100)
    phone = models.CharField(max_length=100)
    
    def __str__(self):
        return f"Bloodbank = {self.bloodbankname} || Location = {self.location} "








