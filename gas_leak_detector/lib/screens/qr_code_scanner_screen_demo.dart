// // // // main.dart
// // // main.dart
// // import 'package:flutter/material.dart';
// // import 'package:gas_leak_detector/controllers/qrcode_scanner_controller.dart';
// // import 'package:gas_leak_detector/screens/qr_code_result_screen.dart';
// // import 'package:get/get.dart';
// // import 'package:qr_code_scanner/qr_code_scanner.dart';
// // //import 'controllers/qr_controller.dart';



// // class QrScannerScreen extends StatelessWidget {
// //   final QRController qrController = Get.put(QRController());
// //   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('QR Code Scanner'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Expanded(
// //               child: QRView(
// //                 key: qrKey,
// //                 onQRViewCreated: (controller) {
// //                   controller.scannedDataStream.listen((scanData) {
                    
// //                     qrController.addScannedCode(scanData);
// //                   });
// //                 },
// //               ),
// //             ),
// //             ElevatedButton(
// //               onPressed: () {
// //                 Get.to(() => ScanResultScreen());
// //               },
// //               child: Text('View Scanned Results'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:gas_leak_detector/screens/qr_code_result_screen.dart';
// import 'package:get/get.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// import '../controllers/qrcode_scanner_controller.dart';

// class QrScannerScreen extends StatelessWidget {
//   final QRController qrController = Get.put(QRController());
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   final RxBool isScanning = false.obs;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('QR Code Scanner'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               height: 300, // Adjust the height as needed
//               width: double.infinity,
//               child: QRView(
//                 key: qrKey,
//                 onQRViewCreated: (controller) {
//                   controller.scannedDataStream.listen((scanData) {
//                     if (isScanning.value) {
//                       isScanning.value = false;
//                       qrController.addScannedCode(scanData);
//                       Get.to(() => ScanResultScreen());
//                       Get.snackbar(
//                         'Scan Complete',
//                         'Scanned: ${scanData.code}',
//                       );
//                     }
//                   });
//                 },
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 isScanning.value = true;
//               },
//               child: Text('Scan QR'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


/*  

import 'package:flutter/material.dart';
import 'package:gas_leak_detector/screens/qr_code_result_screen.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scanning_effect/scanning_effect.dart';

import '../controllers/qrcode_scanner_controller.dart';

class QrScannerScreen extends StatelessWidget {
  final QRController qrController = Get.put(QRController());
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final RxBool isScanning = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  isScanning.value = true;
                  _startScanningAnimation();
                },
                child: ScanningEffect(
                   scanningColor: Colors.red,
    borderLineColor: Colors.green,
    delay: Duration(seconds: 1),
    duration: Duration(seconds: 2),
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: (controller) {
                      controller.scannedDataStream.listen((scanData) {
                        if (isScanning.value) {
                          isScanning.value = false;
                          _stopScanningAnimation();
                          qrController.addScannedCode(scanData);
                          Get.to(() => ScanResultScreen());
                          Get.snackbar(
                            'Scan Complete',
                            'Scanned: ${scanData.code}',
                          );
                        }
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  isScanning.value = true;
                  _startScanningAnimation();
                },
                child: Text('Scan QR'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _startScanningAnimation() {
 qrController.isScanningColor.value = Colors.green;
  }

  void _stopScanningAnimation() {
    qrController.isScanningColor.value = Colors.transparent;
  }
}
*/

/* Qr scanner result with wifi list generator button and save button


// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:gas_leak_detector/controllers/qrcode_scanner_controller.dart';
// import 'package:gas_leak_detector/models/device_add_model.dart';
// import 'package:gas_leak_detector/models/qr_scan_model.dart';
// import 'package:gas_leak_detector/screens/sign_up_screen.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

// import '../core/local_data/local_data.dart';
// import '../core/urls/urls.dart';
// import 'sssid_password_screen.dart';
// import 'wifi_list_screen.dart';

// // ScannedResultPage.dart

// // ... Existing imports ...

// class ScannedResultPage extends StatelessWidget {
//   final QRController qrController = Get.find();
//   final _savedDevicesKey = 'savedDevices';
//   DeviceAdd adddevice = DeviceAdd();
//   DeviceSpec devicespecification = DeviceSpec();
// LocalData localdata = Get.find();

//   @override
//   Widget build(BuildContext context) {
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

//               // Check if the device is saved
//               if (_isDeviceSaved(deviceData)) {
//                 // Device is saved, display the saved card
//                 return _buildSavedDeviceCard(deviceData, context);
//               } else {
//                 // Device is not saved, display the scanned result
//                 return _buildScannedResultCard(deviceData, context);
//               }
//             } catch (e) {
//               print('Error parsing JSON data: $e');
//               print('Scanned JSON data: ${qrController.result.value!.code!}');
//               return ListTile(
//                 title: Text('Invalid QR Code Data'),
//               );
//             }
//           } else {
//             return const Text('No data');
//           }
//         }),
//       ),
//     );
//   }

//   bool _isDeviceSaved(DeviceData deviceData) {
//     // Check if the device is saved in local storage
//     final savedDevices = _loadSavedDevices();
//     return savedDevices.contains(deviceData.toString());
//   }

//   Set<String> _loadSavedDevices() {
//     // Load saved devices from local storage
//     SharedPreferences prefs = Get.find();
//     return prefs.getStringList(_savedDevicesKey)?.toSet() ?? {};
//   }

//   // Future<void> _saveDevice(DeviceData deviceData) async {
//   //   // Save the device to local storage
//   //   SharedPreferences prefs = Get.find();
//   //   Set<String> savedDevices = await _loadSavedDevices(); // Use await here
//   //   savedDevices.add(deviceData.toString());
//   //   await prefs.setStringList(_savedDevicesKey, savedDevices.toList());
//   // }

//  Future<void> _saveDevice(DeviceData deviceData) async {
//     // Save the device to local storage
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     Set<String> savedDevices = Set.from(prefs.getStringList(_savedDevicesKey) ?? []);
//     savedDevices.add(deviceData.toString());
//     await prefs.setStringList(_savedDevicesKey, savedDevices.toList());
//  try {
//       await _postDeviceToServer(deviceData);
//       Get.snackbar(
//         'Success',
//         'Device registered successfully',
//         backgroundColor: Colors.green,
//         colorText: Colors.white,
//       );
//       // Navigate to another screen
//       Get.to(()=>SSIDNamePasswordScreen());
//     } catch (error) {
//       Get.snackbar(
//         'Error',
//         'Failed to register device: $error',
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     }

//     // Refresh the UI
//     qrController.update();
//   }
//     Future<void> _postDeviceToServer(DeviceData deviceData) async {
//     final url = Urls.baseUrl + Urls.addMasterDevice;
//     final headers = {
    
            
//            "Authorization": "Bearer ${localdata.access_token}",
//             "Accept": "application/json",
//           };
//     final body = {
//        'device_name': "${deviceData.deviceName}",
//       'device_type': "${deviceData.deviceType}",
//       'master_device_id': "${deviceData.deviceId}",
     
//       'sync_mobile_id' : "${localdata.mobile_device_id}",
//       'user_id': "${localdata.id}", // Replace with the actual user ID
//       'token' : "${localdata.access_token}",
//     };

//     try {
//       final response = await http.post(
//         Uri.parse(url),
//         headers: headers,
//         body: jsonEncode(body),
//       );
// print(response.body);
//       if (response.statusCode == 200) {
//         adddevice = DeviceAdd.fromJson(response.body as Map<String, dynamic>);
//       }
//     } catch (error) {

//       throw 'Failed to register device: $error';
//     }
//   }
//   Widget _buildSavedDeviceCard(DeviceData deviceData, BuildContext context) {
//     return Center(
//       child: Card(
//         elevation: 50,
//         shadowColor: Colors.black,
//         color: Colors.greenAccent[100],
//         child: SizedBox(
//           width: 300,
//           height: 500,
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 ListTile(
//                   subtitle: _buildDeviceDataWidgets(deviceData),
                  
//                 ),
//                  ElevatedButton(
//                 onPressed: () {
//                   // Navigate to the Wi-Fi List page
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => WiFiListPage(),
//                     ),
//                   );
//                 },
//                 child: Text('View Wi-Fi List'),
//               ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildScannedResultCard(DeviceData deviceData, BuildContext context) {
//     return Center(
//       child: Card(
//         elevation: 50,
//         shadowColor: Colors.black,
//         color: Colors.greenAccent[100],
//         child: SizedBox(
//           width: 300,
//           height: 500,
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 ListTile(
//                   subtitle: _buildDeviceDataWidgets(deviceData),
                  
//                 ),
//                  ElevatedButton(
//                     onPressed: () async {
//                       // Save the device when the save button is pressed
//                       await _saveDevice(deviceData);
//                       // Refresh the UI
//                       qrController.update();
//                     },
//                     child: Text('Save '),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildDeviceDataWidgets(DeviceData deviceData) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Organization: ${deviceData.organization}'),
//         Text('Device Name: ${deviceData.deviceName}'),
//         Text('Version Code: ${deviceData.versionCode}'),
//         Text('Device Type: ${deviceData.deviceType}'),
//         Text('Device ID: ${deviceData.deviceId}'),
//       ],
//     );
//   }
// }

*/