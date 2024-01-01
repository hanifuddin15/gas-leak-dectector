import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gas_leak_detector/controllers/profile_update_controller.dart';
import 'package:gas_leak_detector/core/values/colors.dart';
import 'package:gas_leak_detector/screens/forgot_password_screen.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';
import 'bottom_navbar_screen.dart';
import 'profile_update_screen.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileUpdateController proupdatecontroller = Get.put(ProfileUpdateController());
    return GetBuilder<ProfileScreenController>(
      init: ProfileScreenController(),
      builder: (procontroller) {
        //  return GetBuilder<DoctorProfileUpdateController>(
        //   init: DoctorProfileUpdateController(),
        //   builder: (profileupdateController) {
        
        return Scaffold(

          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            titleTextStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text("My Profile", ),
            // actions: [
            //   IconButton(onPressed: (){}, icon: SvgPicture.asset('images/logout.svg'))

            // ],
          ),
          bottomSheet: BottomNavigationBarView(),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                    padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white
                    ),
                    child: Column(
                      children: [

                        Container(
                          decoration: const BoxDecoration(
                          ),
                          child: CircleAvatar(
                            radius: Get.width*.4*.5+5,
                            backgroundColor: AppColors.cardbuttonColor,
                            child: 
                            procontroller.myProfile.profilePhoto==null||procontroller.myProfile!.profilePhoto!.isEmpty ?CircleAvatar(
                              radius: Get.width*.4*.5,
                                backgroundColor: Colors.white,
                                child: SvgPicture.asset('images/avatar.svg', fit: BoxFit.cover,)

                            ):CircleAvatar(
                                radius: Get.width*.4*.5,
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage("${procontroller.myProfile.profilePhoto}"),

                            ),
                          ),
                        ),

                        const SizedBox(height: 10,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${procontroller.myProfile.name}", style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              letterSpacing: 1
                            ))
                          ],
                        ),

                        const SizedBox(height: 30,),

                        Row(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              child: SvgPicture.asset('images/contact_svg.svg'),
                            ),
                            const SizedBox(width: 20,),
                            Text("${procontroller.myProfile.mobile}", style: const TextStyle(
                                fontSize: 18,

                                color: Colors.black
                            ))
                          ],
                        ),


                        const SizedBox(height: 15,),


                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              child: SvgPicture.asset('images/gmail_svg.svg'),
                            ),
                            const SizedBox(width: 20,),
                            Text("${procontroller.myProfile.email}", style: const TextStyle(
                                fontSize: 18,

                                color: Colors.black
                            ))
                          ],
                        ),

                        const SizedBox(height: 15,),

                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     Container(
                        //       height: 35,
                        //       width: 35,
                        //       child: SvgPicture.asset('images/emergency.svg'),
                        //     ),
                        //     const SizedBox(width: 20,),
                        //     Text("${procontroller.myProfile.mobile??"--"} (emergency)", style: const TextStyle(
                        //         fontSize: 18,

                        //         color: Colors.black
                        //     ))
                        //   ],
                        // ),

                        // const SizedBox(height: 15,),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              child: SvgPicture.asset('images/location_svg.svg'),
                            ),
                            const SizedBox(width: 20,),
                            Text("${procontroller.myProfile.address??"--"}", style: const TextStyle(
                                fontSize: 18,

                                color: Colors.black
                            ))
                          ],
                        ),

                        const SizedBox(height: 15,),

                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     Container(
                        //       height: 35,
                        //       width: 35,
                        //       child: SvgPicture.asset('images/gender.svg'),
                        //     ),
                        //     const SizedBox(width: 20,),
                        //     Text("${procontroller.myProfile.gender??"--"}", style: const TextStyle(
                        //         fontSize: 18,

                        //         color: Colors.black
                        //     ))
                        //   ],
                        // ),
                        //SizedBox(height: 15,),

                        /*Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              child: SvgPicture.asset('images/zoom.svg'),
                            ),
                            SizedBox(width: 20,),
                            Text("${controller.doctorProfile} (zoom id)", style: TextStyle(
                                fontSize: 18,

                                color: Colors.black
                            ))
                          ],
                        ),

                        SizedBox(height: 15,),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              child: Image.asset('images/bmdc.png'),
                            ),
                            SizedBox(width: 20,),
                            Text("${controller.doctorProfile} (BMDC)", style: TextStyle(
                                fontSize: 18,

                                color: Colors.black
                            ))
                          ],
                        ),*/
                        const SizedBox(height: 15,),

                        // Row(
                        //   children: [
                        //     ElevatedButton(onPressed: (){
                        //       Get.to(()=>ForgotPasswordScreen());
                        //     }, child: const Text('Change Password'),
                        //       style: ButtonStyle(
                        //         backgroundColor: MaterialStateProperty.all(Color(0xffFDB441))//FDB441
                        //       ),
                        //     ),
                        //   ],
                          
                        // ),
                         Center(
                                  child: Container(
                                    height: 44.h,
                                    width: 200.w,
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
                                          primary:   Color(0xffFDB441) // AppColors.mainColor//FDB441
                                          
                                          ),
                                      onPressed: () async {
                                        //               if (AppKeys.forgotPasswordKey.currentState!
                                        //                   .validate()) {
                                        //                 AppKeys.forgotPasswordKey.currentState!.save();
                                        // //                  await ssidcontroller.setupWifi(
                                        //  // Assuming you want to use the user ID from localData
                                        //   );

                                                      //}
                                       await Get.to(ForgotPasswordScreen());
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
                                        "Change Password".tr,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height:20),
                //          ElevatedButton(onPressed: (){
                //  // Get.to(()=>const DoctorProfileUpdateScreen());
                // }, child: const Text("Edit"), style: ElevatedButton.styleFrom(
                //     backgroundColor: AppColors.mainColor,

                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(5)
                //     )
                // ),)
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
                                        //               if (AppKeys.forgotPasswordKey.currentState!
                                        //                   .validate()) {
                                        //                 AppKeys.forgotPasswordKey.currentState!.save();
                                        // //                  await ssidcontroller.setupWifi(
                                        // //  // Assuming you want to use the user ID from localData
                                        // //   );

                                        //               }
                                       await Get.to(ProfileUpdateScreen());
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
                                        "Update".tr,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),

                      ],
                    ),
                  ),
                ),
              )
            ],
          ),

          // bottomNavigationBar: Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       // ElevatedButton(onPressed: (){
          //       //   Get.back();
          //       // }, child: const Text("Back"), style: ElevatedButton.styleFrom(
          //       //   backgroundColor: Colors.teal,

          //       //   shape: RoundedRectangleBorder(
          //       //     borderRadius: BorderRadius.circular(15)
          //       //   )
          //       // ),),

          //       //IconButton(onPressed: (){}, icon: const Icon(Icons.calendar_month, color: Colors.teal,)),

          //       ElevatedButton(onPressed: (){
          //        // Get.to(()=>const DoctorProfileUpdateScreen());
          //       }, child: const Text("Edit"), style: ElevatedButton.styleFrom(
          //           backgroundColor: Colors.teal,

          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(15)
          //           )
          //       ),)
          //     ],
          //   ),
          // ),

        );
      }
    );

    // });
  }
}
