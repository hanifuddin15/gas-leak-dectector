import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gas_leak_detector/core/urls/urls.dart';
import 'package:gas_leak_detector/models/login_model.dart';
import 'package:gas_leak_detector/models/sign_up_model.dart';
import 'package:gas_leak_detector/screens/dashboard.dart';
import 'package:gas_leak_detector/screens/qr_code_scanner_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
//import 'package:kambaii_provider/module/doctor/doctor_home/doctor_home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/local_data/local_data.dart';
//import '../../core/utils/urls.dart';
//import '../../model/doctor/login_model/login_result_model.dart';


class SignUpController extends GetxController{
  var isLoading = false;
   final mobilenumberController = TextEditingController();
   final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //late TextEditingController passwordController;
  final nameController = TextEditingController();
// Observe the boolean value
 final obscureText = true.obs;
final addressController = TextEditingController();
  // void toggleObscureText() {
  //  // obscureText.value = !obscureText.value;
  // obscureText.toggle();
  // }

   String mobilenumber = '';
  String password = '';
  String address ='';
  String  name ='';
  String email = '';
  String register_with = 'App';
    LoginResult? signupresult;

   String? validationName(String? value){
    if(value == null || value.isEmpty){
      return "Enter Your Name";
    } else {
      return null;
    }
  }
   String? validationAddress(String? value){
    if(value == null || value.isEmpty){
      return "Enter Your Address";
    } else {
      return null;
    }
  }
  String? validationMobile(String? value){
    if(value == null || value.isEmpty){
      return "Enter Mobile Number";
    } else if(value.length < 10){
      return "Enter Valid Number";
    } else {
      return null;
    }
  }
String? validationEmail(String? value){
    if(value == null || value.isEmpty){
      return "Enter Email";
    } else if(!GetUtils.isEmail(value)){
      return "Enter Valid Email";
    } else {
      return null;
    }
  }
   String? validationPassword(String? value){
    if(value == null || value.isEmpty){
      return "Enter Password";
    } else if(value.length < 5){
      return "Password too short";
    } else {
      return null;
    }
  }





signup() async {
  name = nameController.text.trim();
  password = passwordController.text.trim();
  address = addressController.text.trim();
  mobilenumber = mobilenumberController.text.trim();
   

  isLoading = true;
  update();

  Uri url = Uri.parse(Urls.baseUrl + Urls.signup);


//newly developed by hanif

try {
  var response = await post(
    url,
    body: {
      'name': name,
      'password': password,
      'mobile' : mobilenumber,
      'address' : address,
      'register_with': register_with,
    },
    headers: {
      'Accept': 'application/json',
    },
  );

  var responseBody = jsonDecode(response.body);
  print('Response: $responseBody');

  if (response.statusCode == 200) {
    // if (responseBody['error'] == false &&
    //     responseBody['msg'] == 'Login Successfull!') {
      try {
         signupresult = LoginResult.fromJson(responseBody);
        if (signupresult!.data != null ) {
           // Convert empty string age to null
  

  // Update the age property
  
          await setLocalData(signupresult!.data!.user!);
         // await login();
        //   DoctorProfile doctorProfile = loginResult.data!;
        // Get.put(doctorProfile); //y hanif

          isLoading = false;
          update();
          Get.offAll(() => ScanQrtoAddDevice());
        } else {
          isLoading = false;
          update();
          Get.snackbar('SignUp', 'Invalid user type');
        }
      } catch (e) {
        isLoading = false;
        update();
        Get.snackbar('SignUp', 'Invalid Credentials');
        print(e);
      }
    // } else {
    //   isLoading = false;
    //   update();
    //   Get.snackbar('Login', responseBody['msg']);
    // }
  } else {
    isLoading = false;
    update();
    Get.snackbar('Login', 'Server Error');
  }
} catch (e) {
  isLoading = false;
  update();
  Get.snackbar('Login', 'Error: $e');
  print(e);
}
}


setLocalData(UserProfile userinfo) async {
  LocalData localData = Get.find<LocalData>();
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  
  if (userinfo != null) {
    // If personalInfo is not null, set the data and mark as logged in
   await localStorage.setString(LocalData.uiname, userinfo.name!);
        await localStorage.setString(LocalData.uname, userinfo.mobile!);
    await localStorage.setString(LocalData.pwd, passwordController.value.text.trim());
    await localStorage.setInt(LocalData.Id, userinfo.id!);
    //await localStorage.setString(LocalData.tkn, userinfo.jwtToken!.original!.accessToken!);
    await localStorage.setBool(LocalData.ild, true);

    localData.id = userinfo.id!;
    localData.name = userinfo.name!;
    localData.username = userinfo.mobile!;
    localData.mobile =userinfo.mobile!;
    localData.password = passwordController.value.text.trim();
   localData.access_token =  signupresult!.data!.jwtToken!.accessToken!;
    localData.isLoggedIn = true;
    update();
  } else {
    // If personalInfo is null, clear the local storage and mark as logged out
    await localStorage.clear();
    localData.isLoggedIn = false;
  }

  Get.put(localData);
  update();  // Make sure to call update here to trigger a re-render
}

 login()async{
    LocalData localData = Get.find();
    final uname = localData.username;
    final pass = localData.password;

    isLoading = true;
    update();
    Uri url = Uri.parse(Urls.baseUrl+Urls.login);

    try{
      var response = await post(url, body:
      {
        'username': uname,
        "password": pass
      },
          headers: {
            "Accept":"application/json"
          });

      var body = jsonDecode(response.body);
      print(body);


      if(response.statusCode==200){
        try{
          LoginResult loginResult = LoginResult.fromJson(jsonDecode(response.body));
          UserProfile userProfile = loginResult.data!.user!;

          isLoading = false;
          Get.put(userProfile);
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


@override
  void onInit() {
    super.onInit();
    // passwordController = TextEditingController();
    
   // update();
  }

 
   void toggleObscureText() {
    obscureText.toggle();
  }

  @override
  void onClose() {
    passwordController.dispose();
    super.onClose();
  }

}