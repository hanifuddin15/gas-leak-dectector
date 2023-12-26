
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:percent_indicator/percent_indicator.dart';

// import '../controllers/charttab_controller.dart';
// import '../core/values/colors.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// import 'card_widget.dart';
// import 'gas_leak_detector_home_screen.dart';

// class DashBoardIndicator extends StatefulWidget {
//   @override
//   State<DashBoardIndicator> createState() => _DashBoardIndicatorState();
// }

// class _DashBoardIndicatorState extends State<DashBoardIndicator> {
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double cardPadding = 5.0;
//    // double cardWidth = (screenWidth - cardPadding * 8) / 2; // Adjust the padding and card count as needed
//       final ChartTabController mycontroller = Get.put(ChartTabController());
//      //late final ChartTabController chartController;
//  @override
//   void initState() {
//     super.initState();
//     // Fetch data when the widget is created
//     Get.find<ChartTabController>().fetchSensorData();
//   }
//     return WillPopScope(
//        onWillPop: () async {
//         // Handle the back button press
//         // You can navigate to HomeScreen or perform any custom behavior here
//         Get.off(GasLeakDetectorHomeScreen()); // Replace HomeScreen() with your actual home screen widget
//         return false; // Return true to allow back navigation, return false to prevent it
//       },
//       child: GetBuilder<ChartTabController>(
//         init: ChartTabController(),
//         builder: (chartcontroller) {
      
//           return ModalProgressHUD(
//             inAsyncCall: chartcontroller.loading,
//             child: Scaffold(
//               appBar: AppBar(
//                 title:  Row(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(right: 16.0),
//                       child: CircleAvatar(
//                         backgroundImage: AssetImage('images/fire icon.png'),
//                         radius: 20.0,
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(right: 16.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Text(
//                           chartcontroller.localData.name,
//                             style: TextStyle(
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
                          
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 actions: [
//                   IconButton(
//                     icon: const Icon(Icons.notifications),
//                     onPressed: () {
//                       // Handle notification icon tap
//                     },
//                   ),
//                 ],
//               ),
//               body: SingleChildScrollView(
//                 child: Center(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                     //   Padding(
//                     //     padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
//                     //     child: Row(
//                     //       children: [
//                     //         Padding(
//                     //           padding: EdgeInsets.all(cardPadding),
//                     //           child:  CustomCard(
//                     //             iconPath: 'images/network icon.png',
//                     //             title: 'Internet Status',
//                     //             status: chartcontroller.deviceSensorData.value.sesnsorDevice?.deviceStatusData?.internetStatus ?? 'N/A',
//                     //           ),
//                     //         ),
//                     //         Padding(
//                     //           padding: EdgeInsets.all(cardPadding),
//                     //           child:  CustomCard(
//                     //             iconPath: 'images/electricity icon.png',
//                     //             title: 'Power Status',
//                     //             status: chartcontroller.deviceSensorData.value.sesnsorDevice?.deviceStatusData?.powerStatus ?? 'N/A',
//                     //           ),
//                     //         ),
//                     //         Padding(
//                     //           padding: EdgeInsets.all(cardPadding),
//                     //           child:  CustomCard(
//                     //             iconPath: 'images/network icon.png',
//                     //             title: 'GSM Status',
//                     //             status: chartcontroller.deviceSensorData.value.sesnsorDevice?.deviceStatusData?.gsmStatus ?? 'N/A'
//                     //                 //?.sesnsorDevice?.sensorData?.gsmStatus ??
//                     //                 'N/A',
//                     //           ),
//                     //         ),
//                     //       ],
//                     //     ),
//                     //   ),
//                     //   // Row(children: [
                  
                        
//                     //   // ],),
//                     //   Padding(
//                     //     padding: const EdgeInsets.all(30.0),
//                     //     child: Row(
                          
//                     //       children: [
//                     //      CircularPercentIndicator(
//                     //       radius: 70.0,
//                     //       lineWidth: 10.0,
//                     //       animation: true,
//                     //       percent: double.parse(chartcontroller.deviceSensorData.value
//                     //               ?.sesnsorDevice?.sensorData?.first.gasConcentrationLevel ?? '0') /
//                     //           100.0,
//                     //       center: new Text(
//                     //         chartcontroller.deviceSensorData.value
//                     //                 ?.sesnsorDevice?.sensorData?.first.gasConcentrationLevel ??
//                     //             'N/A',
//                     //         style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//                     //       ),
//                     //       header: new Text(
//                     //         "Gas Level",
//                     //         style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
//                     //       ),
//                     //       circularStrokeCap: CircularStrokeCap.round,
//                     //       progressColor: _getProgressColor(chartcontroller.deviceSensorData.value
//                     //           ?.sesnsorDevice?.sensorData?.first.gasConcentrationLevel ?? '0'),
//                     //     ),
//                     //     SizedBox(width:10),
//                     //                                        CircularPercentIndicator(
//                     //       radius: 70.0,
//                     //       lineWidth: 10.0,
//                     //       animation: true,
//                     //       percent: double.parse(chartcontroller.deviceSensorData.value
//                     //               ?.sesnsorDevice?.sensorData?.first.temperature ?? '0') /
//                     //           100.0,
//                     //       center: new Text(
//                     //         chartcontroller.deviceSensorData.value
//                     //                 ?.sesnsorDevice?.sensorData?.first.humidity ??
//                     //             'N/A',
//                     //         style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//                     //       ),
//                     //       header: new Text(
//                     //         "Humidity",
//                     //         style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
//                     //       ),
//                     //       circularStrokeCap: CircularStrokeCap.round,
//                     //       progressColor: _getProgressColor(chartcontroller.deviceSensorData.value
//                     //           ?.sesnsorDevice?.sensorData?.first.humidity ?? '0'),
//                     //     ),
                   
//                     //       ],
//                     //     ),
//                     //   ),
                  
                  
//                     //  Padding(
//                     //    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
//                     //    child: Row(
//                     //      children: [
//                     //                      CircularPercentIndicator(
//                     //      radius: 70.0,
//                     //      lineWidth: 10.0,
//                     //      animation: true,
//                     //      percent: double.parse(chartcontroller.deviceSensorData.value
//                     //              ?.sesnsorDevice?.sensorData?.first.temperature ?? '0') /
//                     //          100.0,
//                     //      center: new Text(
//                     //        chartcontroller.deviceSensorData.value
//                     //                ?.sesnsorDevice?.sensorData?.first.temperature ??
//                     //            'N/A',
//                     //        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//                     //      ),
//                     //      header: new Text(
//                     //        "Temperature",
//                     //        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
//                     //      ),
//                     //      circularStrokeCap: CircularStrokeCap.round,
//                     //      progressColor: _getProgressColor(chartcontroller.deviceSensorData.value
//                     //          ?.sesnsorDevice?.sensorData?.first.temperature ?? '0'),
//                     //    ),
//                     //      ],
//                     //    ),
//                     //  ),
//                            DefaultTabController(
//                     length: 3,
//                     child: Column(
//                       children: [
                       
//                         Container(
//                           height: MediaQuery.of(context).size.height - 300,
//                           child: TabBarView(
//                             children: [
//                               buildChart('Kitchen' ,0,),
//                               buildChart('Bedroom', 1),
//                               buildChart('Drawing Room', 2),
//                             ],
//                           ),
//                         ),
//                          const TabBar(
//                           tabs: [
//                             Tab(text: 'Kitchen',),
//                             Tab(text: 'Bedroom', ),
//                             Tab(text: 'Drawing Room', ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         //}
//         },
//       ),
//     );
//   }
// Widget buildChart(String roomName, int tabIndex) {
//   return GetBuilder<ChartTabController>(
//     builder: (chartcontroller) {
//       var data;
//       if (tabIndex == 0) {
//         data = chartcontroller.deviceSensorData.value?.sesnsorDevice?.sensorData?[0];
//       } else if (tabIndex == 1) {
//         data = chartcontroller.deviceSensorData.value?.sesnsorDevice?.sensorData?[1];
//       } else if (tabIndex == 2) {
//         // Assuming you have a third sensor data. If not, adjust accordingly.
//          data = chartcontroller.deviceSensorData.value?.sesnsorDevice?.sensorData?[2];
//       }

//       return Padding(
//         padding: const EdgeInsets.all(30.0),
//         child: Row(
//           children: [
//             CircularPercentIndicator(
//               radius: 70.0,
//               lineWidth: 10.0,
//               animation: true,
//               percent: double.parse(data?.gasConcentrationLevel ?? '0') / 100.0,
//               center: new Text(
//                 data?.gasConcentrationLevel ?? 'N/A',
//                 style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//               ),
//               header: new Text(
//                 "Gas Level",
//                 style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
//               ),
//               circularStrokeCap: CircularStrokeCap.round,
//               progressColor: _getProgressColor(data?.gasConcentrationLevel ?? '0'),
//             ),
//             SizedBox(width: 10),
//             CircularPercentIndicator(
//               radius: 70.0,
//               lineWidth: 10.0,
//               animation: true,
//               percent: double.parse(data?.temperature ?? '0') / 100.0,
//               center: new Text(
//                 data?.humidity ?? 'N/A',
//                 style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//               ),
//               header: new Text(
//                 "Humidity",
//                 style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
//               ),
//               circularStrokeCap: CircularStrokeCap.round,
//               progressColor: _getProgressColor(data?.humidity ?? '0'),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }



// }

// Color _getProgressColor(String gasConcentrationLevel) {
//   double level = double.parse(gasConcentrationLevel);
//   if (level <= 30) {
//     return Colors.green;
//   } else if (level <= 60) {
//     return Colors.orange;
//   } else {
//     return Colors.red;
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../controllers/charttab_controller.dart';
import '../core/values/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'card_widget.dart';
import 'gas_leak_detector_home_screen.dart';

class DashBoardIndicator extends StatefulWidget {
  @override
  State<DashBoardIndicator> createState() => _DashBoardIndicatorState();
}

class _DashBoardIndicatorState extends State<DashBoardIndicator> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardPadding = 5.0;
    final ChartTabController mycontroller = Get.put(ChartTabController());

    @override
    void initState() {
      super.initState();
      Get.find<ChartTabController>().fetchSensorData();
    }

    return WillPopScope(
      onWillPop: () async {
        Get.off(GasLeakDetectorHomeScreen());
        return false;
      },
      child: GetBuilder<ChartTabController>(
        init: ChartTabController(),
        builder: (chartcontroller) {
          return ModalProgressHUD(
            inAsyncCall: chartcontroller.loading,
            child: Scaffold(
              appBar: AppBar(
                title: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/fire icon.png'),
                        radius: 20.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            chartcontroller.localData.name,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: () {},
                  ),
                ],
              ),
              body: DefaultTabController(
                length: chartcontroller.deviceSensorData.value?.sesnsorDevice?.sensorData?.length ?? 0,
                child: Column(
                  children: [
                  
                   
                    Expanded(
                      child: TabBarView(
                        children: List.generate(
                          chartcontroller.deviceSensorData.value?.sesnsorDevice?.sensorData?.length ?? 0,
                          (index) => buildChart(chartcontroller.deviceSensorData.value
                              ?.sesnsorDevice?.sensorData?[index]?.childDeviceId ?? 'N/A', index),
                        ),
                      ),
                    ),
                    
                      TabBar(
                      indicatorColor: AppColors.cardbuttonColor,
                      labelColor: AppColors.cardbuttonColor,
                      unselectedLabelColor: Colors.grey,
                      tabs: List.generate(
                        chartcontroller.deviceSensorData.value?.sesnsorDevice?.sensorData?.length ?? 0,
                        (index) => Tab(
                          text: 'Room: ${index + 1}',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildChart(String roomName, int tabIndex) {
     double cardPadding = 5.0;
    return GetBuilder<ChartTabController>(
      builder: (chartcontroller) {
        var data = chartcontroller.deviceSensorData.value?.sesnsorDevice?.sensorData?[tabIndex];

        if (data != null) {
          // Now you can use 'data' to access the specific SensorData object
          return SingleChildScrollView(
            child: Column(
              children: [
                // Text('Battery Level: ${data.batteryLevel}'),
                // Text('Temperature: ${data.temperature}'),
                // Text('Humidity: ${data.humidity}'),
                // Text('Gas Concentration Level: ${data.gasConcentrationLevel}'),
                Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(cardPadding),
                                child: CustomCard(
                                  iconPath: 'images/network icon.png',
                                  title: 'Internet Status',
                                  status: chartcontroller.deviceSensorData.value.sesnsorDevice?.deviceStatusData?.internetStatus ?? 'N/A',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(cardPadding),
                                child: CustomCard(
                                  iconPath: 'images/electricity icon.png',
                                  title: 'Power Status',
                                  status: chartcontroller.deviceSensorData.value.sesnsorDevice?.deviceStatusData?.powerStatus ?? 'N/A',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(cardPadding),
                                child: CustomCard(
                                  iconPath: 'images/network icon.png',
                                  title: 'GSM Status',
                                  status: chartcontroller.deviceSensorData.value.sesnsorDevice?.deviceStatusData?.gsmStatus ?? 'N/A',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Row(
                            children: [
                              CircularPercentIndicator(
                                radius: 70.0,
                                lineWidth: 10.0,
                                animation: true,
                                percent: double.parse(
                                  // chartcontroller.deviceSensorData.value
                                  //       ?.sesnsorDevice?.sensorData?.first.gasConcentrationLevel ?? '0'
                                  "${data.gasConcentrationLevel}"
                                        ) /
                                    100.0,
                                center: new Text(
                                  // chartcontroller.deviceSensorData.value
                                  //         ?.sesnsorDevice?.sensorData?.first.gasConcentrationLevel ??
                                  //     'N/A',
                                  "${data.gasConcentrationLevel}",
                                  style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                ),
                                header: new Text(
                                  "Gas Level",
                                  style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: _getProgressColor(
                                  // chartcontroller.deviceSensorData.value
                                  //   ?.sesnsorDevice?.sensorData?.first.gasConcentrationLevel ?? '0'
                                   " ${data.gasConcentrationLevel}"
                                    ),
                              ),
                              SizedBox(width: 10),
                              CircularPercentIndicator(
                                radius: 70.0,
                                lineWidth: 10.0,
                                animation: true,
                                percent: double.parse(
                                  // chartcontroller.deviceSensorData.value
                                  //       ?.sesnsorDevice?.sensorData?.first.temperature ?? '0'
                                        ' ${data.humidity}'
                                        ) /
                                    100.0,
                                center: new Text(
                                  // chartcontroller.deviceSensorData.value
                                  //         ?.sesnsorDevice?.sensorData?.first.humidity ??
                                  //     'N/A',
                                  " ${data.humidity}",
                                  style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                ),
                                header: new Text(
                                  "Humidity",
                                  style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: _getProgressColor(
                                  
                                  // chartcontroller.deviceSensorData.value
                                  //   ?.sesnsorDevice?.sensorData?.first.humidity ?? '0'
                                  " ${data.humidity}"
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child: Row(
                            children: [
                              CircularPercentIndicator(
                                radius: 70.0,
                                lineWidth: 10.0,
                                animation: true,
                                percent: double.parse(
                                  
                                  // chartcontroller.deviceSensorData.value
                                  //       ?.sesnsorDevice?.sensorData?.first.temperature ?? '0'
                                        " ${data.temperature}"
                                        ) /
                                    100.0,
                                center: new Text(
                                  // chartcontroller.deviceSensorData.value
                                  //         ?.sesnsorDevice?.sensorData?.first.temperature ??
                                  //     'N/A',
                                    " ${data.temperature}",
                                  style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                ),
                                header: new Text(
                                  "Temperature",
                                  style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: _getProgressColor(
                                  
                                  // chartcontroller.deviceSensorData.value
                                  //   ?.sesnsorDevice?.sensorData?.first.temperature ?? '0'
                                      " ${data.temperature}"
                                    ),
                              ),
                              SizedBox(width: 10),
                              CircularPercentIndicator(
                                radius: 70.0,
                                lineWidth: 10.0,
                                animation: true,
                                percent: double.parse(
                                  " ${data.batteryLevel}"
                                        
                                        ) /
                                    100.0,
                                center: new Text(
                                  // chartcontroller.deviceSensorData.value
                                  //         ?.sesnsorDevice?.sensorData?.first.batteryLevel ??
                                  //     'N/A',
                                  "${data.batteryLevel}",
                                  style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                ),
                                header: new Text(
                                  "Battery Level",
                                  style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: _getProgressColor(
                                  // chartcontroller.deviceSensorData.value
                                  //   ?.sesnsorDevice?.sensorData?.first.batteryLevel ?? '0'
                                    "${data.batteryLevel}"
                                    ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                // Add more widgets to display other data as needed
              ],
            ),
          );
        } else {
          return Text('No data available for this tab.');
        }
      },
    );
  }

  Color _getProgressColor(String value) {
    double numericValue = double.parse(value);

    if (numericValue <= 30) {
      return Colors.green;
    } else if (numericValue > 30 && numericValue <= 70) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}

