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