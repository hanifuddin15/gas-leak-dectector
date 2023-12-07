
// import 'dart:convert';


// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:gas_leak_detector/controllers/qrcode_scanner_controller.dart';
// import 'package:gas_leak_detector/models/qr_scan_model.dart';
// import 'package:get/get.dart';

// import '../core/values/colors.dart';
// //import 'package:your_app_name/qr_controller.dart';

// // ... (other imports)

// class ScannedResultPage extends StatelessWidget {
//   final QRController qrController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     Map<String, List<DeviceData>> groupedData = {};

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Scanned Result'),
//       ),
//       body: Center(
//         child: Obx(() {
//           if (qrController.result.value != null) {
//             try {
//               Map<String, dynamic> jsonMap =
//                   json.decode(qrController.result.value!.code!);
//               DeviceData deviceData = DeviceData.fromJson(jsonMap);

//               final key = _generateKey(deviceData);

//               groupedData.putIfAbsent(key, () => []).add(deviceData);
//             } catch (e) {
//               print('Error parsing JSON data: $e');
//               print('Scanned JSON data: ${qrController.result.value!.code!}');
//               return ListTile(
//                 title: Text('Invalid QR Code Data'),
//               );
//             }

//             return ListView.builder(
//               itemCount: groupedData.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final key = groupedData.keys.elementAt(index);
//                 final deviceDataList = groupedData[key]!;

//                 return Column(
//                   children: deviceDataList.map((deviceData) {
//                     return Center(
//                       child: Card(
//                         elevation: 50,
//                         shadowColor: Colors.black,
//                         color: Colors.greenAccent[100],
//                         child: SizedBox(
//                           width: 300,
//                           height: 500,
//                           child: Padding(
//                             padding: const EdgeInsets.all(20.0),
//                             child: ListTile(
//                               subtitle: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   // ... (rest of your UI code)

//                                   Text('Organization: ${deviceData.organization}'),
//                                   Text('Device Name: ${deviceData.deviceName}'),
//                                   Text('Version Code: ${deviceData.versionCode}'),
//                                   Text('Device Type: ${deviceData.deviceType}'),
//                                   Text('Device ID: ${deviceData.deviceId}'),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 );
//               },
//             );
//           } else {
//             return const Text('No data');
//           }
//         }),
//       ),
//     );
//   }

//   String _generateKey(DeviceData deviceData) {
//     // You can choose which fields to include in the key for grouping
//     return '${deviceData.organization}_${deviceData.deviceName}_${deviceData.deviceType}';
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gas_leak_detector/controllers/qrcode_scanner_controller.dart';
import 'package:gas_leak_detector/models/qr_scan_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'wifi_list_screen.dart';

// ScannedResultPage.dart

// ... Existing imports ...

class ScannedResultPage extends StatelessWidget {
  final QRController qrController = Get.find();
  final _savedDevicesKey = 'savedDevices';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scanned Result'),
      ),
      body: Center(
        child: Obx(() {
          if (qrController.result.value != null) {
            try {
              Map<String, dynamic> jsonMap =
                  json.decode(qrController.result.value!.code!);
              DeviceData deviceData = DeviceData.fromJson(jsonMap);

              // Check if the device is saved
              if (_isDeviceSaved(deviceData)) {
                // Device is saved, display the saved card
                return _buildSavedDeviceCard(deviceData, context);
              } else {
                // Device is not saved, display the scanned result
                return _buildScannedResultCard(deviceData, context);
              }
            } catch (e) {
              print('Error parsing JSON data: $e');
              print('Scanned JSON data: ${qrController.result.value!.code!}');
              return ListTile(
                title: Text('Invalid QR Code Data'),
              );
            }
          } else {
            return const Text('No data');
          }
        }),
      ),
    );
  }

  bool _isDeviceSaved(DeviceData deviceData) {
    // Check if the device is saved in local storage
    final savedDevices = _loadSavedDevices();
    return savedDevices.contains(deviceData.toString());
  }

  Set<String> _loadSavedDevices() {
    // Load saved devices from local storage
    SharedPreferences prefs = Get.find();
    return prefs.getStringList(_savedDevicesKey)?.toSet() ?? {};
  }

  Future<void> _saveDevice(DeviceData deviceData) async {
    // Save the device to local storage
    SharedPreferences prefs = Get.find();
    Set<String> savedDevices = await _loadSavedDevices(); // Use await here
    savedDevices.add(deviceData.toString());
    await prefs.setStringList(_savedDevicesKey, savedDevices.toList());
  }

  Widget _buildSavedDeviceCard(DeviceData deviceData, BuildContext context) {
    return Center(
      child: Card(
        elevation: 50,
        shadowColor: Colors.black,
        color: Colors.greenAccent[100],
        child: SizedBox(
          width: 300,
          height: 500,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                ListTile(
                  subtitle: _buildDeviceDataWidgets(deviceData),
                  
                ),
                 ElevatedButton(
                onPressed: () {
                  // Navigate to the Wi-Fi List page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WiFiListPage(),
                    ),
                  );
                },
                child: Text('View Wi-Fi List'),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScannedResultCard(DeviceData deviceData, BuildContext context) {
    return Center(
      child: Card(
        elevation: 50,
        shadowColor: Colors.black,
        color: Colors.greenAccent[100],
        child: SizedBox(
          width: 300,
          height: 500,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                ListTile(
                  subtitle: _buildDeviceDataWidgets(deviceData),
                  
                ),
                 ElevatedButton(
                    onPressed: () async {
                      // Save the device when the save button is pressed
                      await _saveDevice(deviceData);
                      // Refresh the UI
                      qrController.update();
                    },
                    child: Text('Save '),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeviceDataWidgets(DeviceData deviceData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Organization: ${deviceData.organization}'),
        Text('Device Name: ${deviceData.deviceName}'),
        Text('Version Code: ${deviceData.versionCode}'),
        Text('Device Type: ${deviceData.deviceType}'),
        Text('Device ID: ${deviceData.deviceId}'),
      ],
    );
  }
}
