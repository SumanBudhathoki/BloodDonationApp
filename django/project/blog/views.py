from unicodedata import name
from rest_framework.views import APIView
from rest_framework.response import Response
from .serializers import *
from .models import *
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import TokenAuthentication

# Create your views here.
class RegisterUser(APIView):    
    # To create the user
    def post(self, request):
        data = request.data
        serializer = UserSerializers(data = request.data)
        if serializer.is_valid():
            serializer.save()
            user = CustomUser.objects.get(username = serializer.data['username'])
            address = data['address']
            user = NormalUser.objects.create(
                user = user,
                address = address
            )
            user.save()
            return Response(
                serializer.data,
            )
        return Response(
            {
                "error" : True,
                "error_msg": serializer.error_messages,
            },
            
        )
class HospitalRegistration(APIView):
    # To create the user
    def post(self, request):
        data = request.data
        
        serializer = UserSerializers(data = request.data)
        # print(serializer)
        if serializer.is_valid():  
            serializer.save()
            user = CustomUser.objects.get(username = serializer.data['username'])
            address = data['address']
            hospital_name = data['hospital_name']
            
            hospital = Hospital.objects.create(
                user = user,
                address = address,
                hospital_name = hospital_name
            )            
            hospital.save()
            user_id = hospital.user.id            
            CustomUser.objects.filter(id = user_id).update(is_hospital = True)

            return Response(
                serializer.data,
                
            )
        return Response(
            {
                "error" : True,
                "error_msg": serializer.error_messages,
            },
            
        )


# class RegisterNow(APIView):
#     def post(self, request):
#         serializers = UserSerializers(data = request.data)
#         if serializers.is_valid():
#             serializers.save()
#             return Response({'error': False})
#         return Response ({'error': True})
        


class BloodView(APIView):
    def get(self, request):
        # grp = request.data
        blood = Blood.objects.all()
        serializers = BloodSerializer(blood, many = True)
        return Response(serializers.data)


class DonationViews(APIView):
    def get(self, request):
        donation = Donation.objects.all()
        serializers = DonationSerializer(donation, many = True)
        return_msg = {"error": False, "data": serializers.data}
        return Response(return_msg)

class PostRecordView(APIView):
    
    def post(self, request):
        try:
            data = request.data
            bloodbankname = data['bloodbankname']
            bloodgroup = data['bloodgroup']
            location = data['location']
            availablepints = data['availablepints']
            phone = data['phone']
            HospitalBloodRecord.objects.create(
                bloodbankname = bloodbankname,
                bloodgroup = bloodgroup,
                availablepints = availablepints, 
                phone = phone,
                location = location
            )
            response_msg = {"error": False, "message": "Record added successfully."}

        except:
            response_msg = {"error": True, "message": "Something is wrong! Please try again later."}

        return Response(response_msg)

class HospitalRecordView(APIView):
     def get(self,request):
        try:
            record = HospitalBloodRecord.objects.all()
            record_serializer = HospitalRecordSerializer(record, many = True)
            response_msg = {"error": False, "data": record_serializer.data}
        except:
            response_msg = {"error": True, "data": "There is some problem in hospital record"}
        return Response(response_msg)


class DonationApplicationView(APIView):

    def post(self, request):
        try:
            data = request.data
            fullname = data['fullname']
            email = data['email']
            bloodgroup = data['bloodgroup']
            phone = data['phone']
            BloodDonateApplication.objects.create(
                fullname = fullname,
                email = email,
                bloodgroup = bloodgroup,
                phone = phone,
            )
            response_msg = {"error": False, "message": "Record added successfully."}

        except:
            response_msg = {"error": True, "message": "Something is wrong! Please try again later."}

        return Response(response_msg)

 










