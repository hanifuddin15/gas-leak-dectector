
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// class QRController extends GetxController {
//   var scannedCodes = <Barcode>[].obs;
//   var isScanningColor = Colors.transparent.obs; // Observable color variable

//   void addScannedCode(Barcode code) {
//     scannedCodes.add(code);
//   }

//   void clearScannedCodes() {
//     scannedCodes.clear();
//   }
// }
/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gas_leak_detector/screens/qr_code_result_screen.dart';
//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRController extends GetxController {

String scannedQrcode ="";

@override
void onInit(){
  super.onInit();
}
@override
void onReady(){
  super.onReady();
}
@override
void onClose(){
  super.onReady();
}

RxBool isScanning = false.obs;
  Rx<Barcode?> scannedResult = Rx<Barcode?>(null);

  void startScanning(QRViewController controller) {
    isScanning.value = true;
    scannedResult.value = null;

    controller.scannedDataStream.listen((scanData) {
      if (isScanning.value) {
        isScanning.value = false;
        scannedResult.value = scanData;
         Get.to(() => ScanResultPage());
      }
    });
  }
 void setScannedResult(Barcode? result) {
    scannedResult.value = result;
  }



}
*/
/*
3rd attemmpt
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../screens/qr_code_result_screen.dart';

class QRController extends GetxController {
  
  var qrResult = "".obs;
  RxBool isScanning = false.obs;

  

  void setQRResult(Barcode scanData) {
    // Assuming scanData has a 'code' property
    qrResult.value = scanData.code!;
  }
  
}
*/
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

// class QRController extends GetxController {
//   var result = Rxn<Barcode>();

//   void setScannedResult(Barcode? scanData) {
//     result.value = scanData;
//   }
// }
class QRController extends GetxController {
  var result = Rxn<Barcode>();
  var uniqueScannedCodes = <String>{}.obs;

  void setScannedResult(Barcode? scanData) {
    if (scanData != null) {
      final scannedCode = scanData.code;
      final nonNullableCode = scannedCode ?? ""; // Convert nullable to non-nullable
      if (!uniqueScannedCodes.contains(nonNullableCode)) {
        // If the code is not already scanned, update the result and add it to the set
        result.value = scanData;
        uniqueScannedCodes.add(nonNullableCode);
      }
    }
  }
}


