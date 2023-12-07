import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gas_leak_detector/controllers/qrcode_scanner_controller.dart';
import 'package:gas_leak_detector/screens/qr_code_result_screen.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

// class QRViewExample extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _QRViewExampleState();
// }

// class _QRViewExampleState extends State<QRViewExample> {
//   QRViewController? controller;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//    Barcode? result;
//     @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller!.pauseCamera();
//     }
//     controller!.resumeCamera();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<QRController>(
//       builder: (qrController) {
//         return Scaffold(
//           body: Column(
//             children: <Widget>[
//               Expanded(flex: 4, child: _buildQrView(context, qrController)),
//               Expanded(
//                 flex: 1,
//                 child: FittedBox(
//                   fit: BoxFit.contain,
//                   child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   if (result != null)
//                     Text(
//                         'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
//                   else
//                     const Text('Scan a code'),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Container(
//                         margin: const EdgeInsets.all(8),
//                         child: ElevatedButton(
//                             onPressed: () async {
//                               await controller?.toggleFlash();
//                               setState(() {});
//                             },
//                             child: FutureBuilder(
//                               future: controller?.getFlashStatus(),
//                               builder: (context, snapshot) {
//                                 return Text('Flash: ${snapshot.data}');
//                               },
//                             )),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.all(8),
//                         child: ElevatedButton(
//                             onPressed: () async {
//                               await controller?.flipCamera();
//                               setState(() {});
//                             },
//                             child: FutureBuilder(
//                               future: controller?.getCameraInfo(),
//                               builder: (context, snapshot) {
//                                 if (snapshot.data != null) {
//                                   return Text(
//                                       'Camera facing ${describeEnum(snapshot.data!)}');
//                                 } else {
//                                   return const Text('loading');
//                                 }
//                               },
//                             )),
//                       )
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Container(
//                         margin: const EdgeInsets.all(8),
//                         child: ElevatedButton(
//                           onPressed: () async {
//                             await controller?.pauseCamera();
//                           },
//                           child: const Text('pause',
//                               style: TextStyle(fontSize: 20)),
//                         ),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.all(8),
//                         child: ElevatedButton(
//                           onPressed: () async {
//                             await controller?.resumeCamera();
//                           },
//                           child: const Text('resume',
//                               style: TextStyle(fontSize: 20)),
//                         ),
//                       )
//                     ],
//                   ),
//                 ],
//                     //...
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildQrView(BuildContext context, QRController qrController) {
//     var scanArea = (MediaQuery.of(context).size.width < 400 ||
//             MediaQuery.of(context).size.height < 400)
//         ? 150.0
//         : 300.0;
//     return QRView(
//       key: qrKey,
//       onQRViewCreated: (controller) => _onQRViewCreated(controller, qrController),
//       overlay: QrScannerOverlayShape(
//          borderColor: Colors.red,
//           borderRadius: 10,
//           borderLength: 30,
//           borderWidth: 10,
//           cutOutSize: scanArea,
//       ),
//       onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
//     );
//   }

//   void _onQRViewCreated(QRViewController controller, QRController qrController) {
//     setState(() {
//       this.controller = controller;
//     });
//     controller.scannedDataStream.listen((scanData) {
//       qrController.startScanning(controller);
//       if (qrController.scannedResult.value != null) {
//         // Navigate to a new page to display the result
//         Get.to(() => ScanResultPage());
//       }
//     });
//   }

//   void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
//     if (!p) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('No Permission')),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }
/*
//qr_view_example.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:gas_leak_detector/controllers/qrcode_scanner_controller.dart';
import 'package:gas_leak_detector/screens/qr_code_result_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class QRViewExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }
  @override
  Widget build(BuildContext context) {
    return GetX<QRController>(
      builder: (qrController) {
        return Scaffold(
          body: Column(
            children: <Widget>[
              Expanded(flex: 4, child: _buildQrView(context, qrController)),
              Expanded(
                flex: 1,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Column(
                    
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (qrController.scannedResult.value != null)
                    Text(
                        'Barcode Type: ${describeEnum(qrController.scannedResult.value!.format)}   Data: ${qrController.scannedResult.value!.code}'),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.toggleFlash();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                return Text('Flash: ${snapshot.data}');
                              },
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.flipCamera();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getCameraInfo(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  return Text(
                                      'Camera facing ${describeEnum(snapshot.data!)}');
                                } else {
                                  return const Text('loading');
                                }
                              },
                            )),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.pauseCamera();
                          },
                          child: const Text('pause',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.resumeCamera();
                          },
                          child: const Text('resume',
                              style: TextStyle(fontSize: 20)),
                        ),
                      )
                    ],
                  ),
                ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

 Widget _buildQrView(BuildContext context, QRController qrController) {
  var scanArea = (MediaQuery.of(context).size.width < 400 ||
          MediaQuery.of(context).size.height < 400)
      ? 150.0
      : 300.0;
  return Container(
    width: double.infinity,
    height: double.infinity,
    child: QRView(
      key: qrKey,
      onQRViewCreated: (controller) => _onQRViewCreated(controller, qrController),
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    ),
  );
}


 void _onQRViewCreated(QRViewController controller, QRController qrController) {
  setState(() {
    this.controller = controller;
  });

  // Only start scanning if it's not already started
  // if (!qrController.isScanning.value) {
    controller.scannedDataStream.listen((scanData) {
      // Set the scanned result to the controller
      qrController.setScannedResult(scanData);
      // Navigate to the result screen
      Get.to(() => ScanResultPage());
    });

    // Start scanning
    qrController.startScanning(controller);
  // }
}


  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No Permission')),
      );
    }
   
    
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
*/
/* 2nd attemt
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class QRViewPage extends StatelessWidget {
  final QRController qrController = Get.find<QRController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: QRView(
          onQRViewCreated: (controller) {
            controller.scannedDataStream.listen((scanData) {
              qrController.setQRResult(scanData);
              // You can add additional logic if needed
            });
          }, key: null,
        ),
      ),
    );
  }
}
2nd attempt off */ 



/* 3rd attempt -------
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scanning_effect/scanning_effect.dart';

class QRViewPage extends StatelessWidget {
  final QRController qrController = Get.find<QRController>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Container(
          width: double.infinity,
          height: double.infinity,
         child: AnimatedContainer(
          width: 200,
          height: 200,
          duration: Duration(milliseconds: 500), 
          // decoration: BoxDecoration(
          //   border: Border.all(color: Colors.green, width: 5),
          //   borderRadius: BorderRadius.circular(10),
          // ),
          child: ScanningEffect(
            scanningColor: Colors.red,
    borderLineColor: Colors.green,
    delay: Duration(milliseconds: 1000),
    duration: Duration(milliseconds: 500),
            child: QRView(
              onQRViewCreated: (controller) {
                controller.scannedDataStream.listen((scanData) {
                  qrController.setQRResult(scanData);
                  Get.to(() => ScannedResultPage());
                });
              },
              key: qrKey,
            ),
          ),
        ),
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:your_app_name/qr_controller.dart';

class QRViewPage extends StatelessWidget {
  final QRController qrController = Get.find();
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          // Expanded(
          //   flex: 1,
          //   child: FittedBox(
          //     fit: BoxFit.contain,
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: <Widget>[
          //         Obx(() => qrController.result.value != null
          //             ? Text(
          //                 'Barcode Type: ${describeEnum(qrController.result.value!.format)}   Data: ${qrController.result.value!.code}')
          //             : const Text('Scan a code')),
          //         // ... Other buttons and UI elements
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
Widget _buildQrView(BuildContext context) {
  // For this example, we check how wide or tall the device is and change the scanArea and overlay accordingly.
  var scanArea = (MediaQuery.of(context).size.width < 500 ||
          MediaQuery.of(context).size.height < 550)
      ? 300.0
      : 500.0;

  // To ensure the Scanner view is properly sized after rotation
  // we need to listen for Flutter SizeChanged notification and update controller
  return QRView(
    key: qrKey,
    onQRViewCreated: _onQRViewCreated,
    overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 50,
        borderWidth: 10,
        cutOutSize: scanArea,
        
        
        ),
    onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
  );
}
void _onQRViewCreated(QRViewController controller) {
  this.controller = controller;

  controller.scannedDataStream.listen((scanData) {
    qrController.setScannedResult(scanData);

    // Navigate to the ScannedResultPage when a QR code is scanned
    if (scanData != null) {
      Get.to(() => ScannedResultPage());
    }
  });
}

void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
  if (!p) {
    // Show a snackbar indicating that permission is not granted
    Get.snackbar('Permission Error', 'No Camera Permission',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM);
  }
}

}
//