import 'package:flutter/material.dart';
import 'package:gas_leak_detector/core/local_data/local_data.dart';
import 'package:get/get.dart';

class ChartTabController extends GetxController with GetSingleTickerProviderStateMixin{
  late TabController tabcontroller;
bool loading = false;
 int currentTab = 0;
LocalData localData = Get.find();

   void startLoading(){
    loading = true;
    update();
  }
  void stopLoading(){
    loading = false;
    update();
  }
   _handleTab(){
    currentTab = tabcontroller.index;
    update();
  }
  changeTabs(){
    if(currentTab!=4){
      currentTab+=1;
      tabcontroller.index = currentTab;
      update();
    }
  }
   @override
  void onInit() {
    // Initialize the TabController when the controller is initialized
    tabcontroller = TabController(length: 5, vsync: this);
    super.onInit();
  }
    @override
  void onClose() {
    // Dispose the TabController when the controller is closed
    tabcontroller.dispose();
    super.onClose();
  }
}