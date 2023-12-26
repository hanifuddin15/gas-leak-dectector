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

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      init: SignUpController(),
      builder: (signupcontroller) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/SignUp_bg.png'),
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
                        key: AppKeys.signupKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your Name",
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
                                controller: signupcontroller.nameController,
                                keyboardType: TextInputType.text,
                                validator: signupcontroller.validationName,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {
                                  signupcontroller.name = value;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.person_outline),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Enter your name",
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
                            Text(
                              "Your Email",
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
                                controller: signupcontroller.emailController,
                                keyboardType: TextInputType.text,
                                validator: signupcontroller.validationEmail,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {
                                  signupcontroller.email = value;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.person_outline),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Enter your email",
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
                            SizedBox(
                              height: ScreenUtil().setHeight(16), //269
                            ),
                            Text(
                              "Your Phone Number",
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
                                controller:
                                    signupcontroller.mobilenumberController,
                                keyboardType: TextInputType.text,
                                validator: signupcontroller.validationMobile,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {
                                  signupcontroller.mobilenumber = value;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.person_outline),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Enter your phone number",
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

                            SizedBox(
                              height: ScreenUtil().setHeight(16), //269
                            ),
                            Text(
                              "Your Address",
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
                                controller: signupcontroller.addressController,
                                keyboardType: TextInputType.text,
                                validator: signupcontroller.validationAddress,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {
                                  signupcontroller.address = value;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.person_outline),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Enter your address",
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
                            // Container(
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
                            //         obscureText: controller.obscureText.value,
                            //         controller: controller.passwordController,

                            //         // validator: controller.validationPassword,
                            //         textInputAction: TextInputAction.done,
                            //         onChanged: (value) {
                            //           controller.password = value;
                            //         },
                            //         decoration: InputDecoration(
                            //             prefixIcon:
                            //                 const Icon(Icons.vpn_key_rounded),
                            //                 hintText: "Enter your password",
                            //             suffixIcon: IconButton(
                            //               onPressed: () {
                            //                 controller.toggleObscureText();
                            //               },
                            //               icon: controller.obscureText.value
                            //                   ? const Icon(Icons.visibility)
                            //                   : const Icon(
                            //                       Icons.visibility_off),
                            //             ),

                            //             fillColor: Colors.white,
                            //             filled: true,
                            //             border: OutlineInputBorder(
                            //                 borderRadius:
                            //                     BorderRadius.circular(20),
                            //                 borderSide: BorderSide.none)),
                            //       )),
                            // ),
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
                                controller: signupcontroller.passwordController,
                                keyboardType: TextInputType.text,
                                validator: signupcontroller.validationPassword,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {
                                  signupcontroller.password = value;
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
                                    if (AppKeys.signupKey.currentState!
                                        .validate()) {
                                      AppKeys.signupKey.currentState!.save();
                                      await signupcontroller.signup();
                                    }
                                  },
                                  child: signupcontroller.isLoading
                                      ? const ColorfulCircularProgressIndicator(
                                          colors: [
                                              Colors.blue,
                                              Colors.red,
                                              Colors.green,
                                              Colors.yellow
                                            ])
                                      : Text(
                                          "Sign Up".tr,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),

                            // TextButton(
                            //   onPressed: () {
                            //     Get.offAll(()=>Login());
                            //   },
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account?",
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      color: Color(0xff000000),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.offAll(() => const Login());
                                  },
                                  child: Text(
                                    " Sign In".tr,
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                        fontSize: ScreenUtil().setSp(14),
                                        color: Color(0xff1366D9),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // ),
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
          ),
        );
      },
    );
  }
}
