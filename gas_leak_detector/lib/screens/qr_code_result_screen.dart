
// import 'dart:convert';


// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:gas_leak_detector/controllers/qrcode_scanner_controller.dart';
// import 'package:gas_leak_detector/models/qr_scan_model.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// import '../core/local_data/local_data.dart';
// import '../core/urls/urls.dart';
// import '../core/values/colors.dart';
// import '../models/device_add_model.dart';
// import 'qr_code_scanner_screen.dart';
// import 'sssid_password_screen.dart';




// class ScannedResultPage extends StatelessWidget {
//   final QRController qrController = Get.find();
//   LocalData localData = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     Map<String, List<DeviceData>> groupedData = {};

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Scanned Result'),
//       ),
//       body: Center(
//         child: Obx(() {
//           if (qrController.result.value != null) {
//             try {
//               Map<String, dynamic> jsonMap =
//                   json.decode(qrController.result.value!.code!);
//               DeviceData deviceData = DeviceData.fromJson(jsonMap);

//               final key = _generateKey(deviceData);

//               groupedData.putIfAbsent(key, () => []).add(deviceData);
//             } catch (e) {
//               print('Error parsing JSON data: $e');
//               print('Scanned JSON data: ${qrController.result.value!.code!}');
//               return ListTile(
//                 title: Text('Invalid QR Code Data'),
//               );
//             }

//             return ListView.builder(
//               itemCount: groupedData.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final key = groupedData.keys.elementAt(index);
//                 final deviceDataList = groupedData[key]!;

//                 return Column(
//                   children: deviceDataList.map((deviceData) {
//                     return Center(
//                       child: Card(
//                         elevation: 50,
//                         shadowColor: Colors.black,
//                         color: Colors.greenAccent[100],
//                         child: SizedBox(
//                           width: 300,
//                           height: 500,
//                           child: Padding(
//                             padding: const EdgeInsets.all(20.0),
//                             child: ListTile(
//                               subtitle: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   // ... (rest of your UI code)

//                                   Text('Organization: ${deviceData.organization}'),
//                                   Text('Device Name: ${deviceData.deviceName}'),
//                                   Text('Version Code: ${deviceData.versionCode}'),
//                                   Text('Device Type: ${deviceData.deviceType}'),
//                                   Text('Device ID: ${deviceData.deviceId}'),
//                                  Center(
//                               child: Container(
//                                 // height: 44.h,
//                                 // width: 144.w,
//                                 margin: const EdgeInsets.symmetric(
//                                   horizontal: 30,
//                                 ),
//                                 decoration: const ShapeDecoration(
//                                   shape: StadiumBorder(),
//                                 ),
//                                 child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                       // shape: const StadiumBorder(),
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(
//                                             5), // <-- Radius
//                                       ),
//                                       primary: AppColors.mainColor),
//                                   onPressed: () async {
//                                    await _saveDeviceToServer(groupedData);

//                                   },
//                                   child: Text(
//                                           "Save".tr,
//                                           style: const TextStyle(
//                                               color: Colors.white),
//                                         ),
//                                 ),
//                               ),
//                             ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 );
//               },
//             );
//           } else {
//             return const Text('No data');
//           }
//         }),
//       ),
//     );
//   }

//   String _generateKey(DeviceData deviceData) {
//     // You can choose which fields to include in the key for grouping
//     return '${deviceData.organization}_${deviceData.deviceName}_${deviceData.deviceType}_${deviceData.deviceId}_${deviceData.versionCode}';
//   }
//    Future<void> _saveDeviceToServer(Map<String, List<DeviceData>> groupedData) async {
//     // Assuming you want to send the first device's data in the list, you can modify this logic as needed
//     final deviceData = groupedData.values.first.first;

//     final url = Urls.baseUrl+Urls.addMasterDevice;
//     final headers = {'Content-Type': 'application/json'};

//     final body = {
//       'device_name': '${deviceData.deviceName}',
//       'master_device_id': '${deviceData.deviceId}',
//       'device_type': '${deviceData.deviceType}',
//       'user_id': '${localData.id}', 
//       'sync_mobile_id': '${localData.mobile_device_id}', 
//       'token': '${localData.access_token}', 
//     };

//     try {
//       final response = await http.post(
//         Uri.parse(url),
//         headers: headers,
//         body: jsonEncode(body),
//       );
// print(response.body);
//       if (response.statusCode == 200) {
    
//         final deviceAdd = DeviceAdd.fromJson(json.decode(response.body));
//         Get.snackbar(
//         'Success',
//         'Device registered successfully',
//         backgroundColor: Colors.green,
//         colorText: Colors.white,
//       );
      
//       Get.to(()=>SSIDNamePasswordScreen());
//       } else {
        
//         Get.snackbar(
//         'Failed',
//         'Device registration failed',
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//       Get.to(()=>ScanQrtoAddDevice()); 
//         print('Failed to save device. Status code: ${response.statusCode}');
//       }
//     } catch (error) {
//       print('Failed to save device: $error');
//       // Handle errors, show an error message, etc.
//     }
//   }
// }


// scanned_result_page.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gas_leak_detector/controllers/qrcode_scanner_controller.dart';
import 'package:gas_leak_detector/models/qr_scan_model.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/device_registration_controller.dart';
import '../core/values/colors.dart';
import 'qr_code_scanner_screen.dart';


class ScannedResultPage extends StatelessWidget {
  final QRController qrController = Get.find();
  final DeviceRegistrationController controller = Get.put(DeviceRegistrationController());

  @override
  Widget build(BuildContext context) {
    Map<String, List<DeviceData>> groupedData = {};

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Scanned Result'),
      // ),
      body: Stack(
        children: [
          Container(
             decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/Scanned Device Details Bg.png'),
                          fit: BoxFit.fill)),
            child: Center(
              child: Obx(() {
                if (qrController.result.value != null) {
                  try {
                    Map<String, dynamic> jsonMap =
                        json.decode(qrController.result.value!.code!);
                    DeviceData deviceData = DeviceData.fromJson(jsonMap);
            
                    final key = _generateKey(deviceData);
            
                    groupedData.putIfAbsent(key, () => []).add(deviceData);
                  } catch (e) {
                    print('Error parsing JSON data: $e');
                    print('Scanned JSON data: ${qrController.result.value!.code!}');
                    return ListTile(
                      title: Text('Invalid QR Code Data'),
                    );
                  }
            
                  return ListView.builder(
                    itemCount: groupedData.length,
                    itemBuilder: (BuildContext context, int index) {
                      final key = groupedData.keys.elementAt(index);
                      final deviceDataList = groupedData[key]!;
            
                      return Column(
          
                        children: deviceDataList.map((deviceData) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: ScreenUtil().setHeight(250) //269
                                  ),
                              Row(
                                children: [
                                  SizedBox(width: ScreenUtil().setWidth(40) //269
                                  ),
                                  Text("Device Details",
                                            style:GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(20),
                                      color: Color(0xff1e1c1c),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                                        
                                                        ),
                                ],
                              ),
                              Center(
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
                                            Text('Organization: ${deviceData.organization}',
                                            style:GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      color: Color(0xff1e1c1c),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  ),
                                            Text('Device Name: ${deviceData.deviceName}',
                                                      style:GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      color: Color(0xff1e1c1c),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),),
                                            Text('Version Code: ${deviceData.versionCode}',          style:GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      color: Color(0xff1e1c1c),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),),
                                            Text('Device Type: ${deviceData.deviceType}',          style:GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      color: Color(0xff1e1c1c),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),),
                                            Text('Device ID: ${deviceData.deviceId}',          style:GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      color: Color(0xff1e1c1c),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),),
                                            Center(
                                              child: Container(
                                                margin: const EdgeInsets.symmetric(horizontal: 30),
                                                decoration: const ShapeDecoration(
                                                  shape: StadiumBorder(),
                                                ),
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5),
                                                    ),
                                                    primary: AppColors.mainColor,
                                                  ),
                                                  onPressed: () async {
                                                    await controller.saveDeviceToServer(groupedData);
                                                  },
                                                  child: Text(
                                                    "Save".tr,
                                                    style: const TextStyle(color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      );
                    },
                  );
                } else {
                  return const Text('No data');
                }
              }),
            ),
          ),
            Positioned(
              top: 40,
              left: 20,
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
    );
  }

  String _generateKey(DeviceData deviceData) {
    return '${deviceData.organization}_${deviceData.deviceName}_${deviceData.deviceType}_${deviceData.deviceId}_${deviceData.versionCode}';
  }
}


