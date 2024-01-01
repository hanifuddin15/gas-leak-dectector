import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gas_leak_detector/core/urls/urls.dart';
import 'package:gas_leak_detector/models/profile_update_model.dart';
import 'package:gas_leak_detector/screens/gas_leak_detector_home_screen.dart';
import 'package:gas_leak_detector/screens/my_profile.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart'; 
import 'package:http/http.dart' as http ;
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

import '../core/local_data/local_data.dart';
import '../models/login_model.dart';
import '../models/profile_model.dart';
import 'profile_controller.dart';


class ProfileUpdateController extends GetxController{
  
  final _updateStreamController = StreamController<MyProfile>.broadcast();

  Stream<MyProfile> get updateStream => _updateStreamController.stream;

  bool loading = false;
var profilecontroller = ProfileScreenController();
 //MyProfile myProfile = Get.find();

  MyProfile myProfile = Get.put(MyProfile());
  MyUpdateProfile updateprofile = MyUpdateProfile();
  
   //DoctorProfile doctorProfile = DoctorProfile();
  LocalData localData = Get.find();
  //TextEditingController firstnameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();


  ImagePicker picker = ImagePicker();
  XFile? profileImage;

 bool snackbarShown = false;
 String base64ProfileImage = ""; //commented by hanif

  // XFile? bmdcImage;
  // File? proimgfile ;
  //String bmdcbase64Image = "";  //commented by hanif

  int gender = 0;

  changeGender(int index){
    gender = index;
    update();
  }


  void applyDefault() {
  // nameController.text = myProfile.name ?? '';
  // phoneController.text = myProfile.mobile ?? '';
  // emailController.text = myProfile.email ?? '';
  // addressController.text = myProfile.address ?? '';
  nameController.text = localData.name ?? '';
  phoneController.text = localData.mobile ?? '';
  emailController.text = localData.email ?? '';
  addressController.text = localData.addrss ?? '';
  update();
}


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    applyDefault();
  }

  void chooseImage(BuildContext context, bool profile){
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16))),
        isScrollControlled: true,
        context: context,
        builder: (context){
          return Container(
            width: double.infinity,
            height: 120,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: Ink(
                            decoration: const ShapeDecoration(
                              color: Colors.indigo,
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              onPressed: () {
                                pickImageFromGallery(profile);
                              },
                              icon: const Icon(
                                Icons.image_rounded,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8,),
                        const Text('Gallery')
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: Ink(
                            decoration: const ShapeDecoration(
                              color: Colors.indigo,
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              onPressed: () {
                                pickImageFromCamera(profile);
                              },
                              icon: const Icon(
                                Icons.camera,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8,),
                        const Text('Camera')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }

  void pickImageFromCamera(bool profile) async {
    XFile? image = await picker.pickImage(source: ImageSource.camera,imageQuality: 100);
    //File imageFile = File(image!.path);
    if(profile){
      if(image != null){
        profileImage = image;
       // myProfile.profilePhoto = image!.path!; //by hanif
        //base64ProfileImage = myProfile.profilePhoto! ;
         List<int> imageBytes = await profileImage!.readAsBytes(); // by hanif
        base64ProfileImage = base64Encode(imageBytes); //by hanif
      }
    }else{
      if(image != null){
       // bmdcImage = image;
       
       // List<int> imageBytes = await bmdcImage!.readAsBytes(); // by hanif
        //bmdcbase64Image = base64Encode(imageBytes); //by hanif
      }
    }

    update();
  }

  void pickImageFromGallery(bool profile) async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery,imageQuality: 100);

    if(profile){
      if(image != null){
         profileImage = image;
         myProfile.profilePhoto = profileImage!.path;
         //base64ProfileImage = profileImage!.path;
        //  doctorProfile.photo = profileImage!.path; 
        //proimgfile = File(profileImage!.path);
        
       List<int> imageBytes = await profileImage!.readAsBytes();
       base64ProfileImage = base64Encode(imageBytes); //by hanif
      }
    }else{
      if(image != null){
      //  bmdcImage = image;
      //  List<int> imageBytes = await bmdcImage!.readAsBytes();
      //  bmdcbase64Image = base64Encode(imageBytes); by hanif
      }
    }

    update();
  }

  deleteProfileImage(){
    profileImage = null;
   // base64ProfileImage = ""; // by hanif
    update();

  }

  deleteBmdcImage(){
    //bmdcImage = null;
    //bmdcbase64Image = ""; // by hanif
    update();
  }
 


  updateProfile()async{

    loading = true;
    update();

    Uri url = Uri.parse(Urls.baseUrl+Urls.profile_update);

    try{
//      //await saveDataToSharedPreferences();   
//  var request =  MultipartRequest("POST", url);
//   request.headers["Authorization"]= "Bearer ${localData.access_token}";
//    request.headers["Accept"]= "application/json";
//    // request.fields['user_id'] = myProfile.id.toString();
//     request.fields['name'] = nameController.text.trim();
//    // request.fields['last_name'] = lastnameController.text.trim();
//     request.fields['email'] = emailController.text.trim();
//     request.fields['phone'] = phoneController.text.trim();
//    // request.fields['date_of_birth'] = dateofBirthController.text.trim();
//     //request.fields['emergency_contact_number'] = emergencycontactController.text.trim();
//     //request.fields['image'] = 'blah';
//    // request.fields['gender'] = gender==0?"Male":"Female";
//     //request.fields['age'] = ageController.text.trim();
//     request.fields['address'] = addressController.text.trim();
//    // request.fields['zoom_id'] = zoomIdController.text.trim();
//    // request.fields['zoom_pass'] = zoomPasswordController.text.trim();
//    // request.fields['bmdc'] = bmdcController.text.trim();
   
//  if (proimgfile != null) {
     
//       request.files.add(http.MultipartFile.fromBytes(
//         'profile_photo',
//         await proimgfile!.readAsBytes(),
//         filename: "propic.jpg",
//         contentType: MediaType('image', 'jpg'),
//       ));
//     }
    ////request.send();

      var response = await http.post(
          url,
          //body for live pfoile update by hanif
        body: {
          //  "user_id":doctorProfile.id.toString(),
          "name":nameController.text.trim(),
         // "last_name":lastnameController.text.trim(),
          "email":emailController.text.trim(),
          "mobile":phoneController.text.trim(),
          //"date_of_birth" : dateofBirthController.text.trim(),
          
         // "emergency_contact_number":emergencycontactController.text.trim(),
          "profile_photo": base64ProfileImage,//base64ProfileImage,          //profileImage,              //base64ProfileImage, // by hanif
         // "gender":gender==0?"Male":"Female",
         // "age":ageController.text.trim(),
          "address":addressController.text.trim(),
         // "zoom_id":zoomIdController.text.trim(),
          //"zoom_pass":zoomPasswordController.text.trim(),
         // "bmdc":bmdcController.text.trim(),
         // "bmdc_certificate":      bmdcImage,     //bmdcbase64Image  // by hanif
        },
      //   // end of live profile update by hanif
      //   // body: {
      //   //     "id":doctorProfile.id.toString(),
      //   //   "firstname":firstnameController.text.trim(),
      //   //   "lastname":lastnameController.text.trim(),
      //   //   "email":emailController.text.trim(),
      //   //   "mobile":phoneController.text.trim(),
      //   //   "emergency_contact_number":emergencycontactController.text.trim(),
      //   //   "photo":base64ProfileImage,
      //   //   "gender":gender==0?"Male":"Female",
      //   //  // "age":ageController.text.trim(),
      //   //   "address":addressController.text.trim(),
      //   // //  "zoom_id":zoomIdController.text.trim(),
      //   //   "zoom_pass":zoomPasswordController.text.trim(),
      //   //   "bmdc":bmdcController.text.trim(),
      //   //   "bmdc_certificate":bmdcbase64Image,
      //   //   "date_of_birth": dateofBirthController.text.trim(),
      //   // },
        headers: {
          "Accept":"application/json",
         "Authorization": "Bearer ${localData.access_token}",
        }
      );
     // var streamedResponse = await request.send();
//var response = await http.Response.fromStream(streamedResponse);
//var response = ProfileUpdateModel.fromJson(json)
      loading = false;
      update();
      var responseBody = jsonDecode(response.body);
       final Map<String, dynamic> body = await json.decode(response.body);
      //final String body = await json.decode(response.body);
     // var model = ProfileModel.fromJson(body );
     var model = UserUpdate.fromJson(body);
      print(responseBody);
      if(model.updateUser !=null) {
        updateprofile = model.updateUser!;
      }
      update();
      // model.data

      if(response.statusCode==200){
 _updateStreamController.add(myProfile);
      //  Get.offAll(()=>DoctorHomeScreen());
if (!snackbarShown) {
        Get.showSnackbar(GetSnackBar(
          title: 'Success',
          message: '${responseBody['msg'].toString()}',
          backgroundColor: const Color.fromARGB(175, 37, 35, 36),
          duration: const Duration(seconds: 3),
        ));
snackbarShown = true;
}
 //Get.offAll(()=>GasLeakDetectorHomeScreen());
  Get.to(()=>MyProfileScreen());
      }else{
        Get.showSnackbar(GetSnackBar(
          title: 'Error',
          message: '${responseBody['msg']}',
          backgroundColor:  const Color.fromARGB(175, 37, 35, 36),
          duration: const Duration(seconds: 3),
        ));
      snackbarShown = true;
      }

    }catch(e){
      print(e);
      Get.showSnackbar(GetSnackBar(
        title: 'Error',
         backgroundColor:  const Color.fromARGB(175, 37, 35, 36),
        message: '$e',
        duration: const Duration(seconds: 3),
      ));
      loading = false;
      //update();
      
    }
    finally {
      update();
    }

  }
@override
  void onClose() {
    _updateStreamController.close();
    super.onClose();
  }
}