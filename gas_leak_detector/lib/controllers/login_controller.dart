import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:gas_leak_detector/core/urls/urls.dart';
import 'package:gas_leak_detector/models/login_model.dart';
import 'package:gas_leak_detector/models/sign_up_model.dart';
import 'package:device_info/device_info.dart';
import 'package:gas_leak_detector/screens/dashboard.dart';
import 'package:gas_leak_detector/screens/dashboard_indicator_screen.dart';

import 'package:gas_leak_detector/screens/qr_code_scanner_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
//import 'package:kambaii_provider/module/doctor/doctor_home/doctor_home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../core/local_data/local_data.dart';
import '../screens/gas_leak_detector_home_screen.dart';
//import '../../core/utils/urls.dart';
//import '../../model/doctor/login_model/login_result_model.dart';


class LoginController extends GetxController{
   var isLoading = false;
   final userController = TextEditingController();
  //final passwordController = TextEditingController();
  late TextEditingController passwordController;
// Observe the boolean value
 final obscureText = true.obs;
 LoginResult? loginResult;

  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  String mobiledeviceId = '';

  // void toggleObscureText() {
  //  // obscureText.value = !obscureText.value;
  // obscureText.toggle();
  // }

   String user = '';
  String password = '';

   String? validationUser(String? value){
    if(value == null || value.isEmpty){
      return "Enter User";
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


// Future<void> loginWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//       if (googleUser == null) {
//         // User canceled the sign-in process
//         return;
//       }

//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       // Now you can use the credential to sign in with Firebase or your backend

//       // For demonstration, print the user's Google account details
//       print('Google Sign-In Successful:');
//       print('ID: ${googleUser.id}');
//       print('Name: ${googleUser.displayName}');
//       print('Email: ${googleUser.email}');

//       // You can add logic to handle the sign-in with Google data as needed

//       // Example: Navigate to a different screen after successful login
//       Get.offAll(() => ScanQrtoAddDevice());
//     } catch (error) {
//       print('Google Sign-In Error: $error');
//       // Handle error as needed
//     }
//   }

// Future<void> signInWithGoogle() async {
//        Future<User?> signInWithGoogle({required BuildContext context}) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;
// isLoading = true;
//   update();
//     final GoogleSignIn googleSignIn = GoogleSignIn();

//     try {
//       final GoogleSignInAccount? googleSignInAccount =
//           await googleSignIn.signIn();

//       if (googleSignInAccount != null) {
//         final GoogleSignInAuthentication googleSignInAuthentication =
//             await googleSignInAccount.authentication;

//         final AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleSignInAuthentication.accessToken,
//           idToken: googleSignInAuthentication.idToken,
//         );

//         final UserCredential userCredential =
//             await auth.signInWithCredential(credential);

//         user = userCredential.user;
//  Uri url = Uri.parse(Urls.baseUrl + Urls.googlelogin);
//         // Call your API with user details
//         final Map<String, dynamic> apiBody = {
//           'name': user!.displayName ?? '',
//           'email': user.email ?? '', 
//           'register_with': 'GoogleLogin',
//         };

//         final response = await post(
//           url,
//           body: json.encode(apiBody),
//           headers: {'Content-Type': 'application/json'},
//         );

//         final Map<String, dynamic> responseData = json.decode(response.body);
//         print(responseData);

//         if (!responseData['error']) {
//           // API login successful, extract JWT token and navigate to the dashboard
//           final jwtToken = responseData['data']['jwt_token']['access_token'];
//            if (response.statusCode == 200) {
//     if (responseData['error'] == false &&
//         responseData['msg'] == 'Login Successfull!') {
//       try {
//          loginResult = LoginResult.fromJson(responseData);
//         if (loginResult!.data != null ) {
//            // Convert empty string age to null
  

//   // Update the age property
  
//           await setLocalData(loginResult!.data!.user!);
//           UserProfile userProfile = loginResult!.data!.user!;
//         Get.put(userProfile); //y hanif

//           isLoading = false;
//           update();
//           Get.offAll(() => ScanQrtoAddDevice());
//         } else {
//           isLoading = false;
//           update();
//           Get.snackbar('Login', 'Invalid user type');
//         }
//       } catch (e) {
//         isLoading = false;
//         update();
//         Get.snackbar('Login', 'Invalid Credentials');
//         print(e);
//       }
//     } else {
//       isLoading = false;
//       update();
//       Get.snackbar('Login', responseData['msg']);
//     }
//   } else {
//     isLoading = false;
//     update();
//     Get.snackbar('Login', 'Server Error');
//   }
          
//           // You can save the token for future API requests or use it as needed
//           // For now, let's just print it
//           print('JWT Token: $jwtToken');

//           // Navigate to the dashboard screen
//           Navigator.pushReplacementNamed(context, '/ScanQrtoAddDevice');
//         } else {
//           // Handle API login error
//           print('API Login Error: ${responseData['msg']}');
//         }
//       }
//     } on FirebaseAuthException catch (e) {
//       // Handle FirebaseAuthException
//       print('FirebaseAuthException: ${e.message}');
//     } catch (e) {
//       // Handle other exceptions
//       print('Error: $e');
//     }

//     return user;
//   }
//   }
 Future<void> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    isLoading = true;
    update();

    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;

        Uri url = Uri.parse(Urls.baseUrl + Urls.googlelogin);
        // Call your API with user details
        final Map<String, dynamic> apiBody = {
          'name': user!.displayName ?? '',
          'email': user.email ?? '',
          'register_with': 'GoogleLogin',
        };

        final response = await post(
          url,
          body: json.encode(apiBody),
          headers: {'Content-Type': 'application/json'},
        );

        final Map<String, dynamic> responseData = json.decode(response.body);
        print(responseData);

        if (!responseData['error']) {
          // API login successful, extract JWT token and navigate to the dashboard
          final jwtToken = responseData['data']['jwt_token']['access_token'];

          if (response.statusCode == 200) {
            if (responseData['error'] == false &&
                responseData['msg'] == 'Login Successful!') {
              try {
                // Parse the login result
                LoginResult loginResult = LoginResult.fromJson(responseData);
                
                if (loginResult.data != null) {
                  await setLocalData(loginResult.data!.user!);
                  UserProfile userProfile = loginResult.data!.user!;
                  Get.put(userProfile); //y hanif

                  isLoading = false;
                  update();
                  // Get.offAll(() => ScanQrtoAddDevice());
                  //Get.offAll(() => DashBoard());
                  Get.to(ScanQrtoAddDevice());
                } else {
                  isLoading = false;
                  update();
                  Get.snackbar('Login', 'Invalid user type');
                }
              } catch (e) {
                isLoading = false;
                update();
                Get.snackbar('Login', 'Invalid Credentials');
                print(e);
              }
            } else {
              isLoading = false;
              update();
              Get.snackbar('Login', responseData['msg']);
            }
          } else {
            isLoading = false;
            update();
            Get.snackbar('Login', 'Server Error');
          }

         
          print('JWT Token: $jwtToken');

         Get.offAll(() => ScanQrtoAddDevice());
          //Get.offAll(() => DashBoard());
        } else {
          // Handle API login error
          print('API Login Error: ${responseData['msg']}');
        }
      }
    } on FirebaseAuthException catch (e) {
      // Handle FirebaseAuthException
      print('FirebaseAuthException: ${e.message}');
    } catch (e) {
      // Handle other exceptions
      print('Error: $e');
    } finally {
      isLoading = false;
      update();
    }
  }



login() async {
  user = userController.text.trim();
  password = passwordController.text.trim();

  isLoading = true;
  update();

  Uri url = Uri.parse(Urls.baseUrl + Urls.login);


  /* Device Id */

 
  
  try {
    if (GetPlatform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      mobiledeviceId = androidInfo.androidId;
    } else if (GetPlatform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      mobiledeviceId = iosInfo.identifierForVendor;
    }
  } catch (e) {
    print('Error getting device ID: $e');
  }



//newly developed by hanif

try {
  var response = await post(
    url,
    body: {
      'username': user,
      'password': password,
    },
    headers: {
      'Accept': 'application/json',
    },
  );

  var responseBody = jsonDecode(response.body);
  print('Response: $responseBody');

  if (response.statusCode == 200) {
    if (responseBody['error'] == false &&
        responseBody['msg'] == 'Login Successfull!') {
      try {
         loginResult = LoginResult.fromJson(responseBody);
        if (loginResult!.data != null ) {
           // Convert empty string age to null
  

  // Update the age property
  
          await setLocalData(loginResult!.data!.user!);
          UserProfile userProfile = loginResult!.data!.user!;
        Get.put(userProfile); //y hanif

          isLoading = false;
          update();
         ////Get.offAll(() => ScanQrtoAddDevice()); //DashBoardIndicator
          //Get.offAll(() => DashBoard());
           //Get.offAll(() => DashBoardIndicator()); //GasLeakDetectorHomeScreen
             Get.offAll(() => GasLeakDetectorHomeScreen()); 
        } else {
          isLoading = false;
          update();
          Get.snackbar('Login', 'Invalid user type');
        }
      } catch (e) {
        isLoading = false;
        update();
        Get.snackbar('Login', 'Invalid Credentials');
        print(e);
      }
    } else {
      isLoading = false;
      update();
      Get.snackbar('Login', responseBody['msg']);
    }
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


setLocalData(UserProfile userInfo) async {
  LocalData localData = Get.find<LocalData>();
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  
  if (userInfo != null) {
    // If personalInfo is not null, set the data and mark as logged in
    await localStorage.setString(LocalData.uname, userController.value.text.trim());
    await localStorage.setString(LocalData.uiname, userInfo.name!);
    await localStorage.setString(LocalData.pwd, passwordController.value.text.trim());
    await localStorage.setInt(LocalData.Id, userInfo.id!);
    await localStorage.setString(LocalData.tkn, loginResult!.data!.jwtToken!.accessToken!);
    await localStorage.setBool(LocalData.ild, true);
     await localStorage.setString(LocalData.mobileDeviceId, mobiledeviceId); 

    localData.id = userInfo.id!;
    localData.username = userController.value.text.trim();
    localData.password = passwordController.value.text.trim();
    localData.access_token = loginResult!.data!.jwtToken!.accessToken!;
    localData.mobile_device_id = mobiledeviceId;
    localData.name = userInfo.name!;
    localData.isLoggedIn = true;
  } else {
    // If personalInfo is null, clear the local storage and mark as logged out
    await localStorage.clear();
    localData.isLoggedIn = false;
  }

  Get.put(localData);
  update();  // Make sure to call update here to trigger a re-render
}
@override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    
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