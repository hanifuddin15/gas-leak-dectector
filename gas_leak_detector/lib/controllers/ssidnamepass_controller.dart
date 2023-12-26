// scanned_result_controller.dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gas_leak_detector/screens/dashboard_indicator_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../core/local_data/local_data.dart';
import '../core/urls/urls.dart';
import '../models/device_add_model.dart';
import '../models/qr_scan_model.dart';
import '../models/ssid_setup_model.dart';
import '../screens/dashboard.dart';
import '../screens/qr_code_scanner_screen.dart';
import '../screens/sssid_password_screen.dart';

class SSIDNamePasswordController extends GetxController {
  final LocalData localData = Get.find();
 final ssidnameController = TextEditingController();
  final ssidpasswordController = TextEditingController();
   Rx<WifiSettingsResponse?> wifiSettingsResult = Rx<WifiSettingsResponse?>(null);
   String  ssidName ='';
  String ssidPassword = '';
  bool isLoading = false;

   String? validationSSIDName(String? value){
    if(value == null || value.isEmpty){
      return "Enter Your WiFi Name";
    } else {
      return null;
    }
  }

   String? validationSSIDPassword(String? value){
    if(value == null || value.isEmpty){
      return "Enter WiFi Password";
    } else if(value.length < 5){
      return "Password too short";
    } else {
      return null;
    }
  }
  
  // Future<void> setupWifi() async {
  //      ssidName = ssidnameController.text.trim();
  //  ssidPassword  = ssidpasswordController.text.trim();
  //    try {
  //     isLoading = true;

  //     final url = 'https://gasleak.mrshuvo.xyz/api/device/set_settings';

  //     final headers = {
  //                       //'application/json',
  //     'Authorization': 'Bearer ${localData.access_token}'
  //     };
  //     final body = {
  //       'ssid': ssidName,
  //       'ssid_pass': ssidPassword,
  //       'user_id': '${localData.id}',
  //     };

  //     final response = await http.post(
  //       Uri.parse(url),
  //       headers: headers,
  //       body: jsonEncode(body),
  //     );
  //     print(response.body);

  //     if (response.statusCode == 200) {
  //       wifiSettingsResult.value = WifiSettingsResponse.fromJson(json.decode(response.body));
  //     } else {
  //       // Handle error cases, show error message, etc.
  //       print('Failed to set WiFi settings. Status code: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     // Handle errors, show error message, etc.
  //     print('Failed to set WiFi settings: $error');
  //   } finally {
  //     isLoading = false;
  //   }
  
  // }

  Future<void> setupWifi() async {
  ssidName = ssidnameController.text.trim();
  ssidPassword = ssidpasswordController.text.trim();

  try {
    isLoading = true;

    final url = 'https://gasleak.mrshuvo.xyz/api/device/set_settings';

    final headers = {
      'Authorization': 'Bearer ${localData.access_token}',
    };

    // Create a multipart request
    var request = http.MultipartRequest('POST', Uri.parse(url))
      ..headers.addAll(headers)
      ..fields.addAll({
        'ssid': ssidName,
        'ssid_pass': ssidPassword,
        'user_id': '${localData.id}',
      });

    // Send the request
    var response = await request.send();

    // Read the response
    var responseBody = await response.stream.bytesToString();

    print(responseBody);

    // ignore: unrelated_type_equality_checks
    if (response.statusCode == 200 ) {
      wifiSettingsResult.value =
          WifiSettingsResponse.fromJson(json.decode(responseBody));
          Get.to(DashBoardIndicator());
    } else {
      // Handle error cases, show error message, and print response body
      print('Failed to set WiFi settings. Status code: ${response.statusCode}');
      print('Response body: $responseBody');
    }
  } catch (error) {
    // Handle errors, show error message, etc.
    print('Failed to set WiFi settings: $error');
  } finally {
    isLoading = false;
  }
}

}

