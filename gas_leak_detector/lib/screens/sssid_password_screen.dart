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

import 'qr_code_scanner_screen.dart';

class SSIDNamePasswordScreen extends StatelessWidget {
 // const SSIDNamePasswordScreen({Key? key}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SSIDNamePasswordController>(
      init: SSIDNamePasswordController(),
      builder: (ssidcontroller) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children:[
               Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/connect your wifi bg.png'),
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
                              height: ScreenUtil().setHeight(208), //269
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
                                "Your Wifi Name",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontSize: ScreenUtil().setSp(18),
                                    color: Color(0xff1e1c1c),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(16), //269
                              ),
                              Container(
                                height: 60.h,
                                width: 306.w,
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 20,
                                      offset: Offset(0, 10),
                                    )
                                  ],
                                ),
                                child: TextFormField(
                                  controller: ssidcontroller.ssidnameController,
                                  keyboardType: TextInputType.text,
                                  validator: ssidcontroller.validationSSIDName,
                                  textInputAction: TextInputAction.next,
                                  onChanged: (value) {
                                    ssidcontroller.ssidName = value;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.person_outline),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Enter your WiFi name",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none,
                                    ),
                                    /*enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
                                        ),*/
                                  ),
                                ),
                              ),
                              ///////// //name//////end//////////////////////////
                              SizedBox(
                                height: ScreenUtil().setHeight(16), //269
                              ),
                              // Text(
                              //   "Your WiFi Password",
                              //   textAlign: TextAlign.left,
                              //   style: GoogleFonts.roboto(
                              //     textStyle: TextStyle(
                              //       fontSize: ScreenUtil().setSp(18),
                              //       color: Color(0xff1e1c1c),
                              //       fontWeight: FontWeight.w400,
                              //     ),
                              //   ),
                              // ),
                              // const SizedBox(
                              //   height: 24,
                              // ),
                              // Container(
                              //   height: 60.h,
                              //   width: 306.w,
                              //   decoration: const BoxDecoration(
                              //     boxShadow: [
                              //       BoxShadow(
                              //         color: Colors.black38,
                              //         blurRadius: 20,
                              //         offset: Offset(0, 10),
                              //       )
                              //     ],
                              //   ),
                              //   child: TextFormField(
                              //     controller: signupcontroller.emailController,
                              //     keyboardType: TextInputType.text,
                              //     validator: signupcontroller.validationEmail,
                              //     textInputAction: TextInputAction.next,
                              //     onChanged: (value) {
                              //       signupcontroller.email = value;
                              //     },
                              //     decoration: InputDecoration(
                              //       prefixIcon: const Icon(Icons.person_outline),
                              //       fillColor: Colors.white,
                              //       filled: true,
                              //       hintText: "Enter your email",
                              //       border: OutlineInputBorder(
                              //         borderRadius: BorderRadius.circular(20),
                              //         borderSide: BorderSide.none,
                              //       ),
                              //       /*enabledBorder: UnderlineInputBorder(
                              //             borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
                              //           ),*/
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                height: ScreenUtil().setHeight(16), //269
                              ),
                              
              
                             
                            
                              Text(
                                "Enter your password",
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
                          
                              Container(
                                height: 60.h,
                                width: 306.w,
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 20,
                                      offset: Offset(0, 10),
                                    )
                                  ],
                                ),
                                child: TextFormField(
                                  controller: ssidcontroller.ssidpasswordController,
                                  keyboardType: TextInputType.text,
                                  validator: ssidcontroller.validationSSIDPassword,
                                  textInputAction: TextInputAction.next,
                                  onChanged: (value) {
                                    ssidcontroller.ssidPassword = value;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.person_outline),
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Enter your password",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none,
                                    ),
                                    /*enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
                                        ),*/
                                  ),
                                ),
                              ),
              
                              //    Container(
                              //   height: 60.h,
                              //   width: 306.w,
                              //   decoration: const BoxDecoration(
                              //     boxShadow: [
                              //       BoxShadow(
                              //         color: Colors.black38,
                              //         blurRadius: 20,
                              //         offset: Offset(0, 10),
                              //       )
                              //     ],
                              //   ),
                              //   child: Obx(() => TextFormField(
                              //         keyboardType: TextInputType.text,
                              //         obscureText:
                              //             logincontroller.obscureText.value,
                              //         controller:
                              //             logincontroller.passwordController,
                              //         validator:
                              //             logincontroller.validationPassword,
                              //         textInputAction: TextInputAction.done,
                              //         onChanged: (value) {
                              //           logincontroller.password = value;
                              //         },
                              //         decoration: InputDecoration(
                              //             prefixIcon:
                              //                 const Icon(Icons.vpn_key_rounded),
                              //             hintText: "Enter your password",
                              //             hintStyle: TextStyle(
                              //               fontSize: ScreenUtil().setSp(16),
                              //               color: Color(0xff757171),
                              //               fontWeight: FontWeight.normal,
                              //             ),
                              //             suffixIcon: IconButton(
                              //               onPressed: () {
                              //                 logincontroller.toggleObscureText();
                              //               },
                              //               icon:
                              //                   logincontroller.obscureText.value
                              //                       ? const Icon(Icons.visibility)
                              //                       : const Icon(
                              //                           Icons.visibility_off),
                              //             ),
                              //             fillColor: Colors.white,
                              //             filled: true,
                              //             border: OutlineInputBorder(
                              //                 borderRadius:
                              //                     BorderRadius.circular(20),
                              //                 borderSide: BorderSide.none)),
                              //       )),
                              // ),
                              SizedBox(
                                height: ScreenUtil().setHeight(34), //269
                              ),
              
                              Center(
                                child: Container(
                                  height: 44.h,
                                  width: 144.w,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                  ),
                                  decoration: const ShapeDecoration(
                                    shape: StadiumBorder(),
                                  ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        //shape: const StadiumBorder(),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              5), // <-- Radius
                                        ),
                                        primary: AppColors.mainColor),
                                    onPressed: () async {
                                      if (AppKeys.ssidkey.currentState!
                                          .validate()) {
                                        AppKeys.ssidkey.currentState!.save();
                                         await ssidcontroller.setupWifi(
                         // Assuming you want to use the user ID from localData
                          );
                                        
                                      }
                                    },
                                    child: ssidcontroller.isLoading
                                        ? const ColorfulCircularProgressIndicator(
                                            colors: [
                                                Colors.blue,
                                                Colors.red,
                                                Colors.green,
                                                Colors.yellow
                                              ])
                                        : Text(
                                            "Connect".tr,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
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
