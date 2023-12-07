import 'package:colorful_circular_progress_indicator/colorful_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gas_leak_detector/controllers/login_controller.dart';
import 'package:gas_leak_detector/core/local_data/utils/keys.dart';
import 'package:gas_leak_detector/screens/login_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 16,
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
                            const Text(
                              "Your Name",
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Container(
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
                            const SizedBox(
                              height: 16,
                            ),
                             const Text(
                              "Your Email",
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Container(
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
                            const SizedBox(
                              height: 16,
                            ),
                             const Text(
                              "Your Phone Number",
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Container(
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
                                controller: signupcontroller.mobilenumberController,
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

                             const SizedBox(
                              height: 16,
                            ),
                             const Text(
                              "Your Address",
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Container(
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
                            const SizedBox(
                              height: 16,
                            ),
                            const Text(
                              "Enter your password",
                              textAlign: TextAlign.left,
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
                            const SizedBox(
                              height: 24,
                            ),
                           
                            Container(
                              height: 50,
                              width: double.infinity,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              decoration: const ShapeDecoration(
                                shape: StadiumBorder(),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    primary: AppColors.mainColor),
                                onPressed: () async {
                                  if (AppKeys.signupKey.currentState!.validate()) {
                                    AppKeys.signupKey.currentState!.save();
                                    await signupcontroller.signup();
                                  }
                                },
                                child:
                                    signupcontroller.isLoading ? const ColorfulCircularProgressIndicator(colors: [
                                      Colors.blue, Colors.red, Colors.green, Colors.yellow
                                    ]) :
                                    Text(
                                  "Sign Up".tr,
                                  style: const TextStyle(color: Colors.white),
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
                                  const Text(
                                    "Already have an account?",
                                    style: TextStyle(
                                      color: Colors.black,
                                    )
                                  ),
                                 
                                  TextButton(
                                                             onPressed: () {
                                Get.offAll(()=>const Login());
                                                             },
                                   child: Text(
                                    " Sign In".tr,
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
