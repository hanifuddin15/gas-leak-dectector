
// import 'package:flutter/material.dart';
// import 'package:gas_leak_detector/controllers/qrcode_scanner_controller.dart';
// import 'package:get/get.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// //import 'controllers/qr_controller.dart';







// class ScanResultScreen extends StatelessWidget {
//   final QRController qrController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Scan Results'),
//       ),
//       body: Obx(
//         () => ListView.builder(
//           itemCount: qrController.scannedCodes.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//              title: Text(qrController.scannedCodes[index].code ?? 'Unknown'),

//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:gas_leak_detector/controllers/qrcode_scanner_controller.dart';
// import 'package:gas_leak_detector/models/qr_scan_model.dart';
// import 'package:get/get.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// class ScanResultScreen extends StatelessWidget {
//   final QRController qrController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Scan Results'),
//       ),
//       body: Obx(
//         () => ListView.builder(
//           itemCount: qrController.scannedCodes.length,
//           itemBuilder: (context, index) {
//             Barcode? scanResult = qrController.scannedCodes[index];
            
//             // Convert the JSON data to Dart model
//             DeviceData deviceData;
//             try {
//               Map<String, dynamic> jsonMap = json.decode(scanResult.code!);
//               deviceData = DeviceData.fromJson(jsonMap);
//             } catch (e) {
//               // Handle JSON parsing error
//               print('Error parsing JSON data: $e');
//                 print('Scanned JSON data: ${scanResult.code}');
//               return ListTile(
//                 title: Text('Invalid QR Code Data'),
//               );
//             }

//             return ListTile(
//               title: Text('Device Name: ${deviceData.deviceName}'),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Device Type: ${deviceData.deviceType}'),
//                   Text('Device ID: ${deviceData.deviceId}'),
//                   Text('Organization: ${deviceData.organization}'),
//                   // Add more lines for other key-value pairs if needed
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
/* 2nd attemt
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:gas_leak_detector/controllers/qrcode_scanner_controller.dart';
// import 'package:get/get.dart';

// class ScanResultPage extends StatelessWidget {
//   final QRController qrController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Scan Result'),
//       ),
//       body: Center(
//         child: Obx(() {
//           final result = qrController.scannedResult.value;
//           return result != null
//               ? Text(
//                   'Barcode Type: ${describeEnum(result.format)}   Data: ${result.code}')
//               : Text('No Scan Result');
//         }),
//       ),
//     );
//   }
// }
2nd attemt end*/
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../controllers/qrcode_scanner_controller.dart';

// class ScannedResultPage extends StatelessWidget {
//   final QRController qrController = Get.find<QRController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Scanned Result'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('QR Result: ${qrController.qrResult.value}'),
//           ],
//         ),
//       ),
//     );
//   }
// }