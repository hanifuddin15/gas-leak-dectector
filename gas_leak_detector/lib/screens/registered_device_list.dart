import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/get_user_devices_controller.dart';
import '../models/get_user_devices_model.dart';
import 'gas_leak_detector_home_screen.dart';



class UserDevicesScreen extends StatelessWidget {
  final UserDevicesController controller = Get.put(UserDevicesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Devices"),
        leading:  IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black),
    onPressed: () => Get.off(GasLeakDetectorHomeScreen()),
  ), 
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.userDevices.value.error != null &&
            controller.userDevices.value.error!) {
          return Center(
            child: Text("Error loading data"),
          );
        } else {
          return ListView.builder(
            itemCount: controller.userDevices.value.deviceInfo?.masterDevices?.length ?? 0,
            itemBuilder: (context, index) {
              MasterDevices? masterDevice =
                  controller.userDevices.value.deviceInfo?.masterDevices?[index];

              // return ListTile(
              //   title: Text(masterDevice?.deviceName ?? 'N/A'),
              //   subtitle: Text(masterDevice?.deviceLocation ?? 'N/A'),
              //   // Add more details as needed
              // );
                       return  Center(
                                child: Card(
                                  elevation: 50,
                                  shadowColor: Colors.black,
                                  color: Colors.greenAccent[100],
                                  child: SizedBox(
                                    width: 300.w,
                                    height: 300.h,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: ListTile(
                                        subtitle: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Master Device Id: ${masterDevice?.masterDeviceId ?? 'None'}',
                                            style:GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      color: Color(0xff1e1c1c),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  ),
                                            Text('Device Name: ${masterDevice?.deviceName ?? 'None'}',
                                                      style:GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      color: Color(0xff1e1c1c),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),),
                                            Text('Device Type: ${masterDevice?.deviceType ?? 'None'}',          style:GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      color: Color(0xff1e1c1c),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),),
                                            Text('Device Location: ${masterDevice?.deviceLocation ?? 'None'}',          style:GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      color: Color(0xff1e1c1c),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),),
                                            Text('Wifi Name: ${masterDevice?.ssid ?? 'None'}',          style:GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      color: Color(0xff1e1c1c),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),),
                                       Text('Wifi Password: ${masterDevice?.ssidPass ?? 'None'}',          style:GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      color: Color(0xff1e1c1c),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),),
                                            // Center(
                                            //   child: Container(
                                            //     margin: const EdgeInsets.symmetric(horizontal: 30),
                                            //     decoration: const ShapeDecoration(
                                            //       shape: StadiumBorder(),
                                            //     ),
                                            //     child: ElevatedButton(
                                            //       style: ElevatedButton.styleFrom(
                                            //         shape: RoundedRectangleBorder(
                                            //           borderRadius: BorderRadius.circular(5),
                                            //         ),
                                            //         primary: AppColors.mainColor,
                                            //       ),
                                            //       onPressed: () async {
                                            //         await controller.saveDeviceToServer(groupedData);
                                            //       },
                                            //       child: Text(
                                            //         "Save".tr,
                                            //         style: const TextStyle(color: Colors.white),
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                       );
            },
          );
        }
      }),
    );
  }
}
