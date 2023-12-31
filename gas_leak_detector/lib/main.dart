import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gas_leak_detector/firebase_options.dart';
import 'package:gas_leak_detector/screens/qr_code_scanner_screen.dart';
import 'package:gas_leak_detector/screens/sign_up_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/local_data/local_data.dart';
import 'routes/routes.dart';
import 'screens/bluetooth_scanner.dart';
import 'screens/dashboard.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/gas_leak_detector_home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/my_profile.dart';
import 'screens/qr_code_result_screen.dart';
import 'screens/settings_screen.dart';

checkLocal()async{
  LocalData localData = LocalData();
  SharedPreferences localStorage = await SharedPreferences.getInstance();
await localStorage.clear(); 
String? user = localStorage.getString(LocalData.uiname);
  String? username = localStorage.getString(LocalData.mobileno);
  String? password = localStorage.getString(LocalData.pwd);
  String? address = localStorage.getString(LocalData.address);
  String? phone = localStorage.getString(LocalData.mobileno);
  int? userId = localStorage.getInt(LocalData.uid);
  int? Id = localStorage.getInt(LocalData.Id);
  String? token = localStorage.getString(LocalData.tkn);
  String? email = localStorage.getString(LocalData.mail);
  bool? isLoggedIn = localStorage.getBool(LocalData.ild);
  String?  mobileDeviceId = localStorage.getString(LocalData.mobileDeviceId);

  print(token);
  if(username!=null&&password!=null&&userId!=null&&token!=null&&isLoggedIn!=null){
    localData.userId = userId;
    localData.id = Id!;
    localData.username = username;
    localData.password = password;
    localData.email = email!;
    localData.mobile = phone!;
    localData.addrss = address!;
    localData.access_token = token;
    localData.mobile_device_id = mobileDeviceId!; 
    localData.isLoggedIn = isLoggedIn;
  }

  Get.put(localData);


}
void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  
  await initSharedPreferences();
  //HomeBinding().dependencies();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
   );
    await checkLocal();
  runApp(const MyApp());
}
Future<void> initSharedPreferences() async {
  await Get.putAsync(() async => await SharedPreferences.getInstance());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
     ScreenUtil.init(context);
    return ScreenUtilInit(
      designSize: const Size(375, 808),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
         
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: 
       // Get.find<LocalData>().isLoggedIn == true ? const GasLeakDetectorHomeScreen() : const Login(),
       // DashBoard(),
        Login(),
        //ForgotPasswordScreen(),
        //ScannedResultPage(),
        //GasLeakDetectorHomeScreen(),
       // SignUp(),
        // BluetoothApp(),
        // Obx(() {
        //     return Get.find<LocalData>().isLoggedIn == true ? const GasLeakDetectorHomeScreen() : const Login();
        //   }),
        
    //     initialRoute: '/',
    // getPages: [
    //   GetPage(name: '/', page: () => GasLeakDetectorHomeScreen()),
    //   GetPage(name: '/Profile', page: () => MyProfileScreen()),
    //   GetPage(name: '/Settings', page: () => Settings()),
    // ],
    initialRoute: AppPages.getnavbar(),
    getPages: AppPages.routes,
      );
        }
    );
  }
}

