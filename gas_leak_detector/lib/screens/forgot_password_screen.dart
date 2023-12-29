import 'package:colorful_circular_progress_indicator/colorful_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gas_leak_detector/controllers/login_controller.dart';
import 'package:gas_leak_detector/core/local_data/utils/keys.dart';
import 'package:gas_leak_detector/screens/login_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../core/values/colors.dart';
import '../controllers/forgot_password_contoller.dart';
import '../controllers/signup_controller.dart';
import '../controllers/ssidnamepass_controller.dart';
import '../core/local_data/local_data.dart';
import 'package:get/get.dart';

import 'new_password_screen.dart';
import 'qr_code_scanner_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
      init: ForgotPasswordController(),
      builder: (forgotpasscontroller) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/Forgot pass bg.png'),
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
                            key: AppKeys.forgotPasswordKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Verify Your\nPhone Number",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(32),
                                      color: Color(0xff1e1c1c),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: ScreenUtil().setHeight(16), //269
                                ),

                                RichText(
                                  text: TextSpan(
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        fontSize: ScreenUtil().setSp(14),
                                        color: Color(0xff757171),
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'We have sent you an ',
                                        // style: TextStyle(color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: 'One Time Password (OTP)',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: ' on this mobile number',
                                        //style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: ScreenUtil().setHeight(16), //269
                                ),

                                Text(
                                  "Enter your phone number",
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
                                //    // controller: forgotpasscontroller.ssidnameController,
                                //     keyboardType: TextInputType.number,
                                //    // validator: forgotpasscontroller.validationSSIDName,
                                //     textInputAction: TextInputAction.next,
                                //     onChanged: (value) {
                                //      // forgotpasscontroller.ssidName = value;
                                //     },
                                //     decoration: InputDecoration(
                                //       prefixIcon: const Icon(Icons.person_outline),
                                //       fillColor: Colors.white,
                                //       filled: true,
                                //       hintText: "Enter your phone number",
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

                                Container(
                                  //     height: 60.h,
                                  // width: 306.w,
                                  // decoration: const BoxDecoration(
                                  //   boxShadow: [
                                  //     BoxShadow(
                                  //       color: Colors.black38,
                                  //       blurRadius: 20,
                                  //       offset: Offset(0, 10),
                                  //     )
                                  //   ],
                                  // ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Obx(() {
                                        return InternationalPhoneNumberInput(
                                          
                                          searchBoxDecoration: InputDecoration(
                                            fillColor: Colors.green
                                           ),
                                          onInputChanged: (PhoneNumber number) {
                                            print(number.phoneNumber);
                                          },
                                          onInputValidated: (bool value) {
                                            print(value);
                                          },
                                          selectorConfig: SelectorConfig(
                                            selectorType:
                                                PhoneInputSelectorType.DIALOG,
                                            useBottomSheetSafeArea: true,
                                          ),
                                          inputDecoration: InputDecoration(
                                            labelText: '1943888047',
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors
                                                      .blue), // Border color for phone number field
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  color: Colors
                                                      .greenAccent), // Focused border color for phone number field
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  color: Colors
                                                      .blue), // Enabled border color for phone number field
                                            ),
                                           
                                          ),
                                          ignoreBlank: false,
                                          autoValidateMode:
                                              AutovalidateMode.disabled,
                                          selectorTextStyle:
                                              TextStyle(color: Colors.black),
                                          initialValue:
                                              forgotpasscontroller.number.value,
                                          textFieldController:
                                              forgotpasscontroller
                                                  .phonenumbercontroller,
                                          formatInput: true,
                                          keyboardType:
                                              TextInputType.numberWithOptions(
                                                  signed: true, decimal: true),
                                          inputBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                color: Color(0xff1366D9),
                                                style: BorderStyle.solid,
                                                width: 5,
                                              )),
                                          onSaved: (PhoneNumber number) {
                                            print('On Saved: $number');
                                          },
                                        );
                                      }),
                                      // ElevatedButton(
                                      //   onPressed: () {
                                      //     AppKeys.forgotPasswordKey.currentState?.validate();
                                      //   },
                                      //   child: Text('Validate'),
                                      // ),
                                      // ElevatedButton(
                                      //   onPressed: () {
                                      //     forgotpasscontroller.updatePhoneNumber('+15417543010');
                                      //   },
                                      //   child: Text('Update'),
                                      // ),
                                      // ElevatedButton(
                                      //   onPressed: () {
                                      //     AppKeys.forgotPasswordKey.currentState?.save();
                                      //   },
                                      //   child: Text('Save'),
                                      // ),
                                    ],
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
                                                      if (AppKeys.forgotPasswordKey.currentState!
                                                          .validate()) {
                                                        AppKeys.forgotPasswordKey.currentState!.save();
                                        //                  await ssidcontroller.setupWifi(
                                        //  // Assuming you want to use the user ID from localData
                                        //   );

                                                      }
                                       await Get.to(NewPasswordScreen());
                                      },
                                      child:
                                          //  ssidcontroller.isLoading?
                                          //        const ColorfulCircularProgressIndicator(
                                          //           colors: [
                                          //               Colors.blue,
                                          //               Colors.red,
                                          //               Colors.green,
                                          //               Colors.yellow
                                          //             ])
                                          //       :
                                          Text(
                                        "Get OTP".tr,
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
                      Get.offAll(Login());
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
