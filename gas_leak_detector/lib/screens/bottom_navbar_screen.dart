// import 'package:flutter/material.dart';
// import 'package:gas_leak_detector/screens/gas_leak_detector_home_screen.dart';
// import 'package:gas_leak_detector/screens/my_profile.dart';
// import 'package:get/get.dart';
// import '../controllers/bottom_nav_bar_controller.dart';
// import 'settings_screen.dart';

// class BottomNavigationBarView extends StatelessWidget {
//   final BottomNavigationBarController controller = Get.put(BottomNavigationBarController());

//   @override
//   Widget build(BuildContext context) {
//     // return Obx(
//     //   () => BottomNavigationBar(
//     //     currentIndex: controller.currentIndex.value,
//     //     onTap: (index) => _onItemTapped(index),
//     //     items: [
//     //       BottomNavigationBarItem(
//     //         icon: Icon(Icons.home),
//     //         label: 'Home',
//     //       ),
//     //       BottomNavigationBarItem(
//     //         icon: Icon(Icons.person),
//     //         label: 'Profile',
//     //       ),
//     //       BottomNavigationBarItem(
//     //         icon: Icon(Icons.settings),
//     //         label: 'Settings',
//     //       ),
//     //     ],
//     //   ),
//     // );
//     return GetBuilder<BottomNavigationBarController>(builder: (context){
// return Scaffold(
//   body:IndexedStack(
// index: controller.currentIndex,
// children: const[
//  GasLeakDetectorHomeScreen(), MyProfileScreen(), Settings()

// ],


// ),

// bottomNavigationBar: BottomNavigationBar(
//   selectedItemColor: Colors.green,
//   unselectedItemColor: Colors.grey,
//   currentIndex: controller.currentIndex,
//   onTap: controller.changeTabIndex,

  
//   items: [
//     _bottomNavBarItem(Icons.home, "Home"),
//    _bottomNavBarItem(Icons.person, "Profile"),
//    _bottomNavBarItem(Icons.settings, "Settings"),
//   ]
  
//   ),

// );
      
//     });
//   }
// _bottomNavBarItem(IconData icon, String label){
//   return BottomNavigationBarItem(icon: Icon(icon), label: label);
// }
//   //  final RxInt currentIndex = 0.obs;

//   // void _onItemTapped(int index) {
//   //   currentIndex.value = index;
//   //   switch (index) {
//   //     case 0:
//   //       // Home screen (current screen)
//   //       break;
//   //     case 1:
//   //       // Profile screen
//   //       Get.toNamed('/profile');
//   //       break;
//   //     case 2:
//   //       // Settings screen
//   //       Get.toNamed('/settings');
//   //       break;
//   //   }
//   // }
// }
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gas_leak_detector/controllers/bottom_nav_bar_controller.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';

class BottomNavigationBarView extends StatelessWidget {
  final BottomNavigationBarController _controller =
      Get.find<BottomNavigationBarController>();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _controller.currentIndex,
      onTap: (index) {
        _controller.changeTabIndex(index);
        // Handle navigation based on the selected index
        switch (index) {
          case 0:
            // Handle home navigation
            Get.toNamed(AppPages.gethome());
            break;
          case 1:
            // Handle profile navigation
            Get.toNamed(AppPages.getprofile());
            break;
          case 2:
            // Handle settings navigation
            Get.toNamed(AppPages.getsettings());
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
