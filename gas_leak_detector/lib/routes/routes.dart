import 'package:gas_leak_detector/screens/gas_leak_detector_home_screen.dart';
import 'package:gas_leak_detector/screens/my_profile.dart';
import 'package:gas_leak_detector/screens/settings_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../screens/bottom_navbar_screen.dart';

class AppPages{
  static List <GetPage> routes =[
GetPage(name: navbar, page: ( )=>  BottomNavigationBarView()),
GetPage(name: home, page: ( )=> const GasLeakDetectorHomeScreen()),
GetPage(name: profile, page: ( )=> const MyProfileScreen()),
GetPage(name: settings, page: ( )=> const Settings()),
    
  ];


static getnavbar() => navbar;
static gethome() => home;
static  getprofile() => profile;
static getsettings() => settings;

static String navbar ='/';
static String home ='/home';
static String profile ='/profile';
static String settings ='/settings';
}