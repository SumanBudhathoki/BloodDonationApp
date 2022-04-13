from attr import field
from rest_framework import serializers
from .models import *
from django.contrib.auth import get_user_model
from rest_framework.authtoken.models import Token

User = get_user_model()

class UserSerializers(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ('id', 'username', 'password', 'email',)
        extra_kwargs = {'password': {'write_only': True, 'required': True}}

    def create(self, validated_data):
        user = User.objects.create_user(**validated_data)
        Token.objects.create(user = user)
        return user


class BloodSerializer(serializers.ModelSerializer):
    class Meta:
        model = Blood
        fields = "__all__"

# class BloodCollectionSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = BloodCollection
#         fields = "__all__"
#         depth = 1

class DonationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Donation
        fields = "__all__"
        depth = 1

class HospitalRecordSerializer(serializers.ModelSerializer):
    class Meta:
        model = HospitalBloodRecord
        fields = "__all__"
        depth = 1

