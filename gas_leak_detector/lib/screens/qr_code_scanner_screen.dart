
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gas_leak_detector/controllers/qrcode_scanner_controller.dart';
import 'package:gas_leak_detector/core/values/colors.dart';
import 'package:gas_leak_detector/screens/qr_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'gas_leak_detector_home_screen.dart';

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
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/Scan Device Qr.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 250),
                  AppBar(
                    automaticallyImplyLeading: false,
                    title: Text(
                      "Scan Device Qr Code",
                               style:GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: ScreenUtil().setSp(20),
                                  color: Color(0xff1e1c1c),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  SizedBox(height: 20),
                  Image.asset('images/Qr Scanner Logo.png'),
                  SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.mainColor,
                          ),
                          child: Text(
                            "Confirm",
                            style: TextStyle(
                              color: AppColors.white,
                              fontFamily: "Inter",
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            Get.to(() => QRViewPage());
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20,
              left: 10,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Get.offAll(GasLeakDetectorHomeScreen());
                 //Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
