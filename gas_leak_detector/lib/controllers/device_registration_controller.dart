// scanned_result_controller.dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../core/local_data/local_data.dart';
import '../core/urls/urls.dart';
import '../models/device_add_model.dart';
import '../models/qr_scan_model.dart';
import '../screens/qr_code_scanner_screen.dart';
import '../screens/sssid_password_screen.dart';

class DeviceRegistrationController extends GetxController {
  final LocalData localData = Get.find();

  Future<void> saveDeviceToServer(Map<String, List<DeviceData>> groupedData) async {
    try {
      final deviceData = groupedData.values.first.first;

      final url = Urls.baseUrl + Urls.addMasterDevice;
      final headers = {'Content-Type': 'application/json'};

      final body = {
        'device_name': '${deviceData.deviceName}',
        'master_device_id': '${deviceData.deviceId}',
        'device_type': '${deviceData.deviceType}',
        'user_id': '${localData.id}',
        'sync_mobile_id': '${localData.mobile_device_id}',
        'token': '${localData.access_token}',
      };

      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );
print(response.body);
      if (response.statusCode == 200) {
        final deviceAdd = DeviceAdd.fromJson(json.decode(response.body));
        Get.snackbar(
          'Success',
          'Device registered successfully',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // Navigate to SSIDNamePasswordScreen after successful registration
        Get.to(() => SSIDNamePasswordScreen());
      } else {
        Get.snackbar(
          'Failed',
          'Device registration failed',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );

        // Navigate back to ScanQrtoAddDevice after registration failure
        Get.to(() => ScanQrtoAddDevice());
        print('Failed to save device. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Failed to save device: $error');
    }
  }
}

