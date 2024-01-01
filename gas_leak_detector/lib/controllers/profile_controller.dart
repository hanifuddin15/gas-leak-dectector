


import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/local_data/local_data.dart';
import '../core/urls/urls.dart';
import '../models/login_model.dart';
import '../models/profile_model.dart';
import '../screens/login_screen.dart';
import 'profile_update_controller.dart';

class ProfileScreenController extends GetxController{
   static ProfileScreenController get instance =>
      Get.find<ProfileScreenController>();
 StreamSubscription<MyProfile>? _updateStreamSubscription;
  MyProfile myProfile = MyProfile();
  //UserProfile myProfile = UserProfile();
  bool isLoading = false;

  LocalData localData = Get.find();

 void updateProfile(UserProfile updatedProfile, ProfileModel profile) {
   // myProfile = updatedProfile;
   updatedProfile.id =profile.myprofile!.id ;
   updatedProfile.mobile =profile.myprofile!.mobile ;
   updatedProfile.address =profile.myprofile!.address ;
   updatedProfile.email =profile.myprofile!.email ;
   updatedProfile.name =profile.myprofile!.name ;
   //updatedProfile.childDevice =profile.myprofile!.chi ;
   updatedProfile.username =profile.myprofile!.username ;
   updatedProfile.profilePhoto =profile.myprofile!.profilePhoto ;
   
    update();
  }


  fetchProfile()async{
    try{
      ProfileModel profile = Get.find();
     myProfile = profile.myprofile!;
      update();
      print(profile.msg);
    }catch(e){
      await login();
      print("have to import");
    }

  }

  login()async{
    final uname = localData.username;
    final pass = localData.password;

    isLoading = true;
    update();
    Uri url = Uri.parse("${Urls.baseUrl}${Urls.profieShow}?token=${localData.access_token}");

    try{
      var response = await get(url, 
      // body:
      // {
      //   'username': uname,
      //   "password": pass
      // },
          headers: {
            "Accept":"application/json"
          });

      var body = jsonDecode(response.body);
      print(body);


      if(response.statusCode==200){
        try{
         // LoginResult loginResult = LoginResult.fromJson(jsonDecode(response.body));
             ProfileModel profile  = ProfileModel.fromJson(jsonDecode(response.body));
         myProfile = profile.myprofile!;

          isLoading = false;
         // Get.put(doctorProfile);
          update();

        }catch(e){
          isLoading = false;
          update();
          Get.snackbar("Error", "${body["msg"]}");
          print(e);

        }
      }else{
        Get.snackbar("Error", body["msg"]);
      }

    }catch(e){
      isLoading = false;
      update();
      Get.snackbar("Error", "Server Error");
      print(e);

    }
    //01824713029
    //12345678
  }


  logout()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    Get.offAll(()=>Login());
  }
  @override
  void onInit() {
    // TODO: implement onInit
     final updateController = Get.find<ProfileUpdateController>();

//final updateController = Get.put(ProfileUpdateController());

    // Subscribe to the update stream
    _updateStreamSubscription = updateController.updateStream.listen((updatedProfile) {
      myProfile = updatedProfile;
      update();
    });
    fetchProfile();
    super.onInit();
  }
   @override
  void onClose() {
    // Cancel the stream subscription when the controller is closed
    _updateStreamSubscription?.cancel();

    super.onClose();
  }

}

// import 'dart:async';

// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:kambaii_provider/model/doctor/login_model/login_result_model.dart';

// class DoctorProfileScreenController extends GetxController {
//   final _updateStreamController = StreamController<DoctorProfile>.broadcast();

//   Stream<DoctorProfile> get updateStream => _updateStreamController.stream;
//   DoctorProfile doctorProfile = DoctorProfile();

//   @override
//   void onInit() {
//     // Subscribe to the update stream in onInit
//     _updateStreamController.stream.listen((updatedProfile) {
//       doctorProfile = updatedProfile;
//       update();
//     });

//     super.onInit();
//   }

//   @override
//   void onClose() {
//     // Close the stream controller when the controller is closed
//     _updateStreamController.close();

//     super.onClose();
//   }
// }
