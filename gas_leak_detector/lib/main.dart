import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gas_leak_detector/screens/qr_code_scanner_screen.dart';
import 'package:gas_leak_detector/screens/sign_up_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/local_data/local_data.dart';
import 'screens/bluetooth_scanner.dart';
import 'screens/login_screen.dart';

checkLocal()async{
  LocalData localData = LocalData();
  SharedPreferences localStorage = await SharedPreferences.getInstance();
await localStorage.clear(); 
String? user = localStorage.getString(LocalData.uiname);
  String? username = localStorage.getString(LocalData.mobileno);
  String? password = localStorage.getString(LocalData.pwd);
  int? userId = localStorage.getInt(LocalData.uid);
  int? Id = localStorage.getInt(LocalData.Id);
  String? token = localStorage.getString(LocalData.tkn);
  bool? isLoggedIn = localStorage.getBool(LocalData.ild);

  print(token);
  if(username!=null&&password!=null&&userId!=null&&token!=null&&isLoggedIn!=null){
    localData.userId = userId;
    localData.id = Id!;
    localData.username = username;
    localData.password = password;
    localData.access_token = token;
    localData.isLoggedIn = isLoggedIn;
  }

  Get.put(localData);


}
void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await initSharedPreferences();
  //HomeBinding().dependencies();
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: 
      Login(),
      // BluetoothApp(),
    );
  }
}

