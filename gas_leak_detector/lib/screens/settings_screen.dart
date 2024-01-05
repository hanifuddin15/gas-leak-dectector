import 'package:colorful_circular_progress_indicator/colorful_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gas_leak_detector/controllers/login_controller.dart';
import 'package:gas_leak_detector/core/local_data/utils/keys.dart';
import 'package:gas_leak_detector/screens/login_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/values/colors.dart';
import '../controllers/signup_controller.dart';
import '../controllers/ssidnamepass_controller.dart';
import '../core/local_data/local_data.dart';
import 'package:get/get.dart';

import 'bottom_navbar_screen.dart';
import 'qr_code_scanner_screen.dart';

class Settings extends StatelessWidget {
 // const SSIDNamePasswordScreen({Key? key}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SSIDNamePasswordController>(
      init: SSIDNamePasswordController(),
      builder: (ssidcontroller) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            bottomNavigationBar: BottomNavigationBarView(),
            body: Stack(
              children:[
               Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/Settings bg.png'),
                        fit: BoxFit.fill)),
              
                child: CustomScrollView(
                  scrollDirection: Axis.vertical,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        decoration: const BoxDecoration(
                            //color: AppColors.mainColor
                            ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: ScreenUtil().setHeight(400), //269
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      sliver: SliverToBoxAdapter(
                        child: Form(
                          key: AppKeys.ssidkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Setting Page is Under Development",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontSize: ScreenUtil().setSp(18),
                                    color: Color(0xff1e1c1c),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              
              
                          
                           
                              const SizedBox(
                                height: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                //),
                //),
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
                  Get.offAll(ScanQrtoAddDevice());
                 //Get.back();
                },
              ),
            ),
              ],
            ),
          ),
        );
      },
    );
  }
}
