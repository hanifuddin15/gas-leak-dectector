import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gas_leak_detector/core/local_data/local_data.dart';
import 'package:gas_leak_detector/models/get_device_sensor_data_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../core/urls/urls.dart';

class ChartTabController extends GetxController with GetSingleTickerProviderStateMixin{
  late TabController tabcontroller;
bool loading = false;
 var deviceSensorData = DeviceSensorData().obs;
 var deviceStatusData = DeviceStatusData().obs;
 //List<SensorData>? sensorData = [].obs;
 //var sensorData = <SensorData>[].obs;
  // List <SensorData> sensorData = [];
  Rx<DeviceSensorData> sensorData = DeviceSensorData().obs;
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
  Future<void> fetchSensorData() async {
    try {
      loading = true;
  Uri url = Uri.parse("${Urls.baseUrl}${Urls.getDeviceSensorData}?token=${localData.access_token}");
    // final url = Uri.parse('https://gasleak.mrshuvo.xyz/api/get-sensor-data?token=${localData.access_token}');
     //final response = await http.get(Uri.parse(url));
final response = await http.get(url,
 headers: {
      'Accept': 'application/json',
       'Content-Type': 'application/x-www-form-urlencoded',
    },);
      if (response.statusCode == 200) {
        deviceSensorData.value = DeviceSensorData.fromJson(jsonDecode(response.body));
        deviceStatusData.value = DeviceStatusData.fromJson(jsonDecode(response.body));
      // sensorData = (jsonDecode(response.body)['data']['SensorData'] as List)
      //       .map((data) => SensorData.fromJson(data))
      //       .toList();


  update();

        print(response.body);
      } else {
        // Handle error cases, show error message, etc.
        print('Failed to fetch sensor data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle errors, show error message, etc.
      print('Failed to fetch sensor data: $error');
    } finally {
      loading = false;
    }
  }
   @override
  void onInit() {
    // Initialize the TabController when the controller is initialized
    tabcontroller = TabController(length: 5, vsync: this);
     fetchSensorData(); // Fetch data when the controller is initialized
     update(); // Update when the controller is initialized
   
    super.onInit();
  }
    @override
  void onClose() {
    // Dispose the TabController when the controller is closed
    tabcontroller.dispose();
    super.onClose();
  }
}