// import 'package:colorful_circular_progress_indicator/colorful_circular_progress_indicator.dart';
// import 'package:flutter/material.dart';
// import 'package:gas_leak_detector/controllers/login_controller.dart';
// import 'package:gas_leak_detector/core/local_data/utils/keys.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../../core/values/colors.dart';
// import '../controllers/signup_controller.dart';

// class SignUp extends StatelessWidget {
//   const SignUp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<SignUpController>(
//       init: SignUpController(),
//       builder: (controller) {
//         return SafeArea(
//           child: Scaffold(
//             resizeToAvoidBottomInset: false,
//             body: Container(
//               decoration: const BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage('images/SignUp_bg.png'),
//                       fit: BoxFit.fill)),

//               child: CustomScrollView(
//                 scrollDirection: Axis.vertical,
//                 slivers: [
//                   SliverToBoxAdapter(
//                     child: Container(
//                       decoration: const BoxDecoration(
//                           //color: AppColors.mainColor
//                           ),
//                       child: const Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           SizedBox(
//                             height: 30,
//                           ),
//                           SizedBox(
//                             height: 16,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SliverPadding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 20, vertical: 30),
//                     sliver: SliverToBoxAdapter(
//                       child: Form(
//                         key: AppKeys.loginKey,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               "Your Name",
//                               textAlign: TextAlign.left,
//                             ),
//                             const SizedBox(
//                               height: 24,
//                             ),
//                             Container(
//                               decoration: const BoxDecoration(
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black38,
//                                     blurRadius: 20,
//                                     offset: Offset(0, 10),
//                                   )
//                                 ],
//                               ),
//                               child: TextFormField(
//                                 controller: controller.userController,
//                                 keyboardType: TextInputType.text,
                                
//                                 validator: controller.validationUser,
//                                 textInputAction: TextInputAction.next,
//                                 onChanged: (value) {
//                                   controller.user = value;
//                                 },
//                                 decoration: InputDecoration(
//                                   prefixIcon: const Icon(Icons.person_outline),
//                                   fillColor: Colors.white,
//                                   filled: true,
//                                  hintText: "Enter your name",
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(20),
//                                     borderSide: BorderSide.none,
//                                   ),
//                                   /*enabledBorder: UnderlineInputBorder(
//                                         borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
//                                       ),*/
//                                 ),
//                               ),
//                             ),
//                            ///////// //name//////end//////////////////////////
//                             const SizedBox(
//                               height: 16,
//                             ),
//                              const Text(
//                               "Your Email",
//                               textAlign: TextAlign.left,
//                             ),
//                             const SizedBox(
//                               height: 24,
//                             ),
//                             Container(
//                               decoration: const BoxDecoration(
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black38,
//                                     blurRadius: 20,
//                                     offset: Offset(0, 10),
//                                   )
//                                 ],
//                               ),
//                               child: TextFormField(
//                                 controller: controller.userController,
//                                 keyboardType: TextInputType.text,
                                
//                                 validator: controller.validationUser,
//                                 textInputAction: TextInputAction.next,
//                                 onChanged: (value) {
//                                   controller.user = value;
//                                 },
//                                 decoration: InputDecoration(
//                                   prefixIcon: const Icon(Icons.person_outline),
//                                   fillColor: Colors.white,
//                                   filled: true,
//                                  hintText: "Enter your email",
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(20),
//                                     borderSide: BorderSide.none,
//                                   ),
//                                   /*enabledBorder: UnderlineInputBorder(
//                                         borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
//                                       ),*/
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 16,
//                             ),
//                              const Text(
//                               "Your Phone Number",
//                               textAlign: TextAlign.left,
//                             ),
//                             const SizedBox(
//                               height: 24,
//                             ),
//                             Container(
//                               decoration: const BoxDecoration(
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black38,
//                                     blurRadius: 20,
//                                     offset: Offset(0, 10),
//                                   )
//                                 ],
//                               ),
//                               child: TextFormField(
//                                 controller: controller.userController,
//                                 keyboardType: TextInputType.text,
                                
//                                 validator: controller.validationUser,
//                                 textInputAction: TextInputAction.next,
//                                 onChanged: (value) {
//                                   controller.user = value;
//                                 },
//                                 decoration: InputDecoration(
//                                   prefixIcon: const Icon(Icons.person_outline),
//                                   fillColor: Colors.white,
//                                   filled: true,
//                                  hintText: "Enter your phone number",
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(20),
//                                     borderSide: BorderSide.none,
//                                   ),
//                                   /*enabledBorder: UnderlineInputBorder(
//                                         borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
//                                       ),*/
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 16,
//                             ),
//                             const Text(
//                               "Enter your password",
//                               textAlign: TextAlign.left,
//                             ),
//                             const SizedBox(
//                               height: 24,
//                             ),
//                             Container(
//                               decoration: const BoxDecoration(
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black38,
//                                     blurRadius: 20,
//                                     offset: Offset(0, 10),
//                                   )
//                                 ],
//                               ),
//                               child: Obx(() => TextFormField(
//                                     keyboardType: TextInputType.text,
//                                     obscureText: controller.obscureText.value,
//                                     controller: controller.passwordController,

//                                     // validator: controller.validationPassword,
//                                     textInputAction: TextInputAction.done,
//                                     onChanged: (value) {
//                                       controller.password = value;
//                                     },
//                                     decoration: InputDecoration(
//                                         prefixIcon:
//                                             const Icon(Icons.vpn_key_rounded),
//                                             hintText: "Enter your password",
//                                         suffixIcon: IconButton(
//                                           onPressed: () {
//                                             controller.toggleObscureText();
//                                           },
//                                           icon: controller.obscureText.value
//                                               ? const Icon(Icons.visibility)
//                                               : const Icon(
//                                                   Icons.visibility_off),
//                                         ),
                                       
//                                         fillColor: Colors.white,
//                                         filled: true,
//                                         border: OutlineInputBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(20),
//                                             borderSide: BorderSide.none)),
//                                   )),
//                             ),
//                             const SizedBox(
//                               height: 24,
//                             ),
//                             Row(
//                               children: [
//                                 const SizedBox(
//                                   width: 160,
//                                 ),
//                                 TextButton(
//                                     onPressed: () {
//                                       // Get.to(()=>ForgotPasswordScreen());
//                                     },
//                                     child: Text(
//                                       "Forgot Password".tr,
//                                     )),
//                               ],
//                             ),
//                             Container(
//                               height: 50,
//                               width: double.infinity,
//                               margin: const EdgeInsets.symmetric(
//                                 horizontal: 30,
//                               ),
//                               decoration: const ShapeDecoration(
//                                 shape: StadiumBorder(),
//                               ),
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                     shape: const StadiumBorder(),
//                                     primary: AppColors.mainColor),
//                                 onPressed: () async {
//                                   // if (AppKeys.loginKey.currentState!.validate()) {
//                                   //   AppKeys.loginKey.currentState!.save();
//                                   //   await controller.login();
//                                   // }
//                                 },
//                                 child:
//                                     // controller.isLoading ? const ColorfulCircularProgressIndicator(colors: [
//                                     //   Colors.blue, Colors.red, Colors.green, Colors.yellow
//                                     // ]) :
//                                     Text(
//                                   "SignIn".tr,
//                                   style: const TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 16,
//                             ),
//                             ElevatedButton(
//                               onPressed: () {},
//                               style: ElevatedButton.styleFrom(
//                                 primary:
//                                     Colors.white, // Button background color
//                                 onPrimary: Colors.black, // Text color
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8.0),
//                                 ),
//                                 padding:
//                                     const EdgeInsets.all(12), // Button padding
//                               ),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Image.asset(
//                                     'images/google icon.png', // Path to your Google logo asset
//                                     height:
//                                         24, // Adjust the height according to your design
//                                     width:
//                                         24, // Adjust the width according to your design
//                                   ),
//                                   const SizedBox(
//                                       width:
//                                           16), // Adjust the spacing between icon and text
//                                   const Text(
//                                     'Continue with Google',
//                                     style: TextStyle(fontSize: 16),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             TextButton(
//                               onPressed: () {
//                                 // Get.offAll(()=>Signup());
//                               },
//                               child: Text(
//                                 "Don't have account? Register".tr,
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 24,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               //),
//               //),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
