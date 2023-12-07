import 'package:flutter/material.dart';
import 'package:gas_leak_detector/controllers/qrcode_scanner_controller.dart';
import 'package:gas_leak_detector/core/values/colors.dart';
import 'package:gas_leak_detector/screens/qr_view.dart';
import 'package:get/get.dart';

class ScanQrtoAddDevice extends StatefulWidget {
  const ScanQrtoAddDevice({super.key});

  @override
  State<ScanQrtoAddDevice> createState() => _ScanQrtoAddDeviceState();
}

class _ScanQrtoAddDeviceState extends State<ScanQrtoAddDevice> {
   final QRController qrController = Get.put(QRController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: Scaffold(
      resizeToAvoidBottomInset: false,
      body:Container(
         decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/Scan Device Qr.png'),
                      fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 250),
              Text("Scan Device Qr Code",
              style:TextStyle(
color: AppColors.fontColor,
                fontSize: 20,
                fontFamily: "Roboto",
              ),
              ),
SizedBox(height: 20),
              Image.asset('images/Qr Scanner Logo.png'), 
              SizedBox(height: 20),
               Center(
                
                child: Column(
              children: [
                  ElevatedButton(
                    style:ElevatedButton.styleFrom(
backgroundColor: AppColors.mainColor,
                    ),
              child: Text("Confirm",
              style: TextStyle(
                color: AppColors.white,
                fontFamily: "Inter",
                fontSize: 16,
              )
              ),
              onPressed: () {
                //qrScannerController.scanner();
                Get.to(() => QRViewPage());
              },
                  
                  )
              ],
                  )),
            ],
          ),
        ),
      ),)
    );
  }
}