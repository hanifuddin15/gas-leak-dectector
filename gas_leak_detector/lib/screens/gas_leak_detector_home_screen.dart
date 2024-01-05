import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gas_leak_detector/screens/dashboard_indicator_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/bottom_nav_bar_controller.dart';
import 'bottom_navbar_screen.dart';
import 'custom_card _homescreen.dart';
import 'login_screen.dart';
import 'qr_code_scanner_screen.dart';
import 'registered_device_list.dart';

class GasLeakDetectorHomeScreen extends StatefulWidget {
  const GasLeakDetectorHomeScreen({super.key});

  @override
  State<GasLeakDetectorHomeScreen> createState() => _GasLeakDetectorHomeScreenState();
}

class _GasLeakDetectorHomeScreenState extends State<GasLeakDetectorHomeScreen> {
   final BottomNavigationBarController _bottomNavigationBarController =
      Get.put(BottomNavigationBarController());
      logout()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    Get.offAll(()=>Login());
  }
   double cardPadding = 5.0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
       child: Scaffold(
         resizeToAvoidBottomInset: false,
          bottomNavigationBar: BottomNavigationBarView(),
        body:Stack(
          children: [
            Container(
               decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/Gas Leak Home.png'),
                        fit: BoxFit.fill)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                      SizedBox(height: ScreenUtil().setHeight(250)), //269
                 Row(
                   children: [
                     Padding(
                                    padding: EdgeInsets.all(cardPadding),
                                    child:  CustomCardHome(
                                      onPressed: (){
                                        Get.offAll(ScanQrtoAddDevice());
                                      },
                                      iconPath: 'images/add_new_icon.png',
                                      title: 'Register New Device',
                                     // status: chartcontroller.deviceSensorData.value.sesnsorDevice?.deviceStatusData?.internetStatus ?? 'N/A',
                                    ),
                                    
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(cardPadding),
                                    child:  CustomCardHome(
                                       onPressed: (){
                                        Get.offAll(DashBoardIndicator());
                                      },
                                      iconPath: 'images/dashboard_icon.png',
                                      title: 'DashBoard',
                                     // status: chartcontroller.deviceSensorData.value.sesnsorDevice?.deviceStatusData?.internetStatus ?? 'N/A',
                                    ),
                                  ),
                   ],
                 ),
                   Row(
                     children: [
                       Padding(
                                        padding: EdgeInsets.all(cardPadding),
                                        child:  CustomCardHome(
                                           onPressed: (){
                                            Get.offAll(UserDevicesScreen());
                                          },
                                          iconPath: 'images/list_icon.png',
                                          title: 'Registered Device List',
                                         // status: chartcontroller.deviceSensorData.value.sesnsorDevice?.deviceStatusData?.internetStatus ?? 'N/A',
                                        ),
                                      ),
                     ],
                   ),
                
                
                        ],),
              ),
            ),
            
             Positioned(
              top: 20,
              right: 10,
              child: IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                onPressed: () {
                 logout();
                 //Get.back();
                },
              ),
            ),
          ],
        )
        
     // bottomNavigationBar: BottomNavigationBarView();   
       ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gas_leak_detector/screens/dashboard_indicator_screen.dart';
// import 'package:get/get.dart';

// import 'custom_card _homescreen.dart';

// import 'qr_code_scanner_screen.dart';
// import 'registered_device_list.dart';

// class GasLeakDetectorHomeScreen extends StatelessWidget {
//   final RxInt currentIndex = 0.obs;

//   void onItemTapped(int index) {
//     currentIndex.value = index;
//     switch (index) {
//       case 0:
//         // Home screen (current screen)
//         break;
//       case 1:
//         // Profile screen
//         Get.toNamed('/profile');
//         break;
//       case 2:
//         // Settings screen
//         Get.toNamed('/settings');
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Container(
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('images/Gas Leak Home.png'),
//               fit: BoxFit.fill,
//             ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Column(
//               children: [
//                 SizedBox(height: ScreenUtil().setHeight(250)), //269
//                 Row(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.all(5.0),
//                       child: CustomCardHome(
//                         onPressed: () {
//                           Get.offAll(ScanQrtoAddDevice());
//                         },
//                         iconPath: 'images/add_new_icon.png',
//                         title: 'Register New Device',
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(5.0),
//                       child: CustomCardHome(
//                         onPressed: () {
//                           Get.offAll(DashBoardIndicator());
//                         },
//                         iconPath: 'images/dashboard_icon.png',
//                         title: 'DashBoard',
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.all(5.0),
//                       child: CustomCardHome(
//                         onPressed: () {
//                           Get.offAll(RegisteredDeviceList());
//                         },
//                         iconPath: 'images/list_icon.png',
//                         title: 'Registered Device List',
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: currentIndex.value,
//           onTap: onItemTapped,
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: 'Profile',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.settings),
//               label: 'Settings',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
