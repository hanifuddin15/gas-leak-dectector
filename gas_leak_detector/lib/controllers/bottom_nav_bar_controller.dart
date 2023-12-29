import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  // var currentIndex = 0.obs;

  // void changePage(int index) {
  //   currentIndex.value = index;
  // }
  var currentIndex = 0;
  void changeTabIndex(int index){
    currentIndex = index;
  }
}