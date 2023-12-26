// /* ******** 1st successful attempt  ******************

// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// // import '../controllers/charttab_controller.dart';
// // import '../core/values/colors.dart';
// // import 'package:syncfusion_flutter_charts/charts.dart';




// // class DashBoard extends StatefulWidget {
   

// //   @override
// //   State<DashBoard> createState() => _DashBoardState();
// // }

// // class _DashBoardState extends State<DashBoard> {
// //   @override
// //   Widget build(BuildContext context) {
// //      return GetBuilder<ChartTabController>(
// //       init: ChartTabController(),
// //       builder: (mycontroller) {
// //     return DefaultTabController(
// //       length: 5,
// //       child: ModalProgressHUD(
// //         inAsyncCall: mycontroller.loading,
// //         child: SafeArea(
// //         top: false,
// //         bottom: false,
// //           child: Scaffold(
// //             appBar: AppBar(
// //               title:   Row(
// //                 children: [
// //                     Padding(
// //                   padding: EdgeInsets.only(right: 16.0),
// //                   child: CircleAvatar(
// //                     backgroundImage: AssetImage('images/fire icon.png'), // Replace with your image
// //                     radius: 20.0,
// //                   ),
// //                 ),
              
// //                   Padding(
// //                       padding: EdgeInsets.only(right: 16.0),
// //                       child: Column(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         crossAxisAlignment: CrossAxisAlignment.end,
// //                         children: [
// //                           Text(
// //                             'John Doe', // Replace with the user's name
// //                             style: TextStyle(
// //                               fontSize: 16.0,
// //                               fontWeight: FontWeight.bold,
// //                             ),
// //                           ),
// //                           Text(
// //                             'Online', // You can add additional status information here
// //                             style: TextStyle(
// //                               fontSize: 12.0,
// //                               color: Colors.grey,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                 ],
// //               ),
// //               actions: [
              
// //                 IconButton(
// //                   icon: Icon(Icons.notifications),
// //                   onPressed: () {
// //                     // Handle notification icon tap
// //                   },
// //                 ),
// //               ],
              
// //             ),
            
// //             body: Column(
// //               children: [
// //                 Expanded(
// //                   child: Center(
// //                     child: Padding(
// //                   padding: EdgeInsets.all(16.0),
// //                   child: buildCardList(),
// //                             ),
// //                   ),
// //                 ),
// //                  TabBar(
// //                   tabs: [
// //                     Tab(text: 'Kitchen'),
// //                     Tab(text: 'Bedroom'),
// //                     Tab(text: 'Drawing Room'),
// //                   ],
// //                 ),
// //                   Expanded(
// //                   child: TabBarView(
// //                     children: [
// //                       // Content for the Kitchen tab
// //                       buildChart('Kitchen'),

// //                       // Content for the Bedroom tab
// //                       buildChart('Bedroom'),

// //                       // Content for the Drawing Room tab
// //                       buildChart('Drawing Room'),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

 
  
// //      );
// //   }

// //    Widget buildCardList() {
// //     return ListView.builder(
// //     //  shrinkWrap: true,
// //       itemCount: 1,
// //       itemBuilder: (BuildContext context, int index) {
// //         return buildCardRow(
// //           'images/fire icon.png', 'Gas Level ', '50%',
// //           'images/temparature icon.png', 'Temaparature', '60%',
// //           'images/cylinder icon.png', 'Oxygen Level', '70%',
// //         );
// //       },
// //     );
// //   }
// // // Widget buildChart(String roomName) {
// // //     // TODO: Implement logic to fetch data for the chart based on roomName
// // //     // You can use the SfCartesianChart from the syncfusion_flutter_charts package here
// // //     // Customize the chart based on your requirements
// // //     return SfCartesianChart(
// // //       // Chart configuration goes here
// // //       title: ChartTitle(text: '$roomName Pressure Chart'),
// // //       // Add series and other configurations as needed
// // //       series: <ChartSeries>[
// // //         LineSeries<dynamic, int>(
// // //           dataSource: /* Your data source for the chart */,
// // //           xValueMapper: (dynamic data, _) => /* Mapping logic for x-axis */,
// // //           yValueMapper: (dynamic data, _) => /* Mapping logic for y-axis */,
// // //         ),
// // //       ],
// // //     );
// // //   }
// //  Widget buildChart(String roomName) {
// //     return Container(
// //       margin: EdgeInsets.only(bottom: 16.0),
// //       child: SfCartesianChart(
// //         primaryXAxis: NumericAxis(),
// //         primaryYAxis: NumericAxis(),
// //         series: <ChartSeries>[
// //           LineSeries<double, double>(
// //             dataSource: <double>[1, 2, 3, 4, 5], // Your graph data here
// //             xValueMapper: (double sales, _) => sales,
// //             yValueMapper: (double sales, _) => sales,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //   Widget buildCardRow(
// //     String iconPath1, String title1, String percentage1,
// //     String iconPath2, String title2, String percentage2,
// //     String iconPath3, String title3, String percentage3,
// //   ) {
// //     return Container(
// //       margin: EdgeInsets.only(bottom: 16.0),
// //       child: Row(
// //         children: <Widget>[
// //           buildCard(iconPath1, title1, percentage1),
// //           SizedBox(width: 16.0),
// //           buildCard(iconPath2, title2, percentage2),
// //           SizedBox(width: 16.0),
// //           buildCard(iconPath3, title3, percentage3),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget buildCard(String iconPath, String title, String percentage) {
// //      //final ChartTabController chartTabController = Get.put(ChartTabController());

// //     return Expanded(
// //       child: Container(
// //         height: 40.0,
// //         width: 90,
// //         decoration: BoxDecoration(
// //           color: AppColors.cardbuttonColor,
// //           borderRadius: BorderRadius.circular(10.0),
// //         ),
// //         child: Center(
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               Expanded(
// //                 child: Row(
// //                   children: [
// //                     Image.asset(
// //                       iconPath,
// //                       width: 20.0, // Adjust the width as needed
// //                       height: 20.0, // Adjust the height as needed
// //                     ),
// //                     SizedBox(width:5),
// //                     Column(children: [
// //                        Text(
// //                   title,
// //                   style: TextStyle(
// //                     color: Colors.white,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //                 Text(
// //                   percentage,
// //                   style: TextStyle(
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //                     ],)
// //                   ],
// //                 ),
// //               ),
// //               SizedBox(height: 8.0),
            
             
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// */ /* ***********End Here 1st attemmption  ***************************/


// /* ******** 2nd successful attempt  ******************

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// import '../controllers/charttab_controller.dart';
// import '../core/values/colors.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class DashBoard extends StatefulWidget {
//   @override
//   State<DashBoard> createState() => _DashBoardState();
// }

// class _DashBoardState extends State<DashBoard> {
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ChartTabController>(
//       init: ChartTabController(),
//       builder: (mycontroller) {
//         return ModalProgressHUD(
//           inAsyncCall: mycontroller.loading,
//           child: Scaffold(
//             appBar: AppBar(
//               title: Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(right: 16.0),
//                     child: CircleAvatar(
//                       backgroundImage: AssetImage('images/fire icon.png'),
//                       radius: 20.0,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(right: 16.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Text(
//                           'John Doe',
//                           style: TextStyle(
//                             fontSize: 16.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           'Online',
//                           style: TextStyle(
//                             fontSize: 12.0,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               actions: [
//                 IconButton(
//                   icon: Icon(Icons.notifications),
//                   onPressed: () {
//                     // Handle notification icon tap
//                   },
//                 ),
//               ],
//             ),
//             body: Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: buildCardList(),
//                 ),
//                 DefaultTabController(
//                   length: 3,
//                   child: Column(
//                     children: [
//                       TabBar(
//                         tabs: [
//                           Tab(text: 'Kitchen'),
//                           Tab(text: 'Bedroom'),
//                           Tab(text: 'Drawing Room'),
//                         ],
//                       ),
//                       Container(
//                         height: MediaQuery.of(context).size.height - 300, // Adjust the height as needed
//                         child: TabBarView(
//                           children: [
//                             // Content for the Kitchen tab
//                             buildChart('Kitchen'),

//                             // Content for the Bedroom tab
//                             buildChart('Bedroom'),

//                             // Content for the Drawing Room tab
//                             buildChart('Drawing Room'),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget buildCardList() {
//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: 2,
//       itemBuilder: (BuildContext context, int index) {
//         return buildCardRow(
//           'images/fire icon.png',
//           'Gas Level ',
//           '50%',
//           'images/temparature icon.png',
//           'Temperature',
//           '60%',
//           'images/cylinder icon.png',
//           'Oxygen Level',
//           '70%',
//         );
//       },
//     );
//   }

//   Widget buildChart(String roomName) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 16.0),
//       child: SfCartesianChart(
//         primaryXAxis: NumericAxis(),
//         primaryYAxis: NumericAxis(),
//         series: <ChartSeries>[
//           LineSeries<double, double>(
//             dataSource: <double>[1, 2, 3, 4, 5], // Your graph data here
//             xValueMapper: (double sales, _) => sales,
//             yValueMapper: (double sales, _) => sales,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildCardRow(
//     String iconPath1,
//     String title1,
//     String percentage1,
//     String iconPath2,
//     String title2,
//     String percentage2,
//     String iconPath3,
//     String title3,
//     String percentage3,
//   ) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 16.0),
//       child: Row(
//         children: <Widget>[
//           buildCard(iconPath1, title1, percentage1),
//           SizedBox(width: 16.0),
//           buildCard(iconPath2, title2, percentage2),
//           SizedBox(width: 16.0),
//           buildCard(iconPath3, title3, percentage3),
//         ],
//       ),
//     );
//   }

//   Widget buildCard(String iconPath, String title, String percentage) {
//     return Expanded(
//       child: Container(
//         height: 40.0,
//         width: 90,
//         decoration: BoxDecoration(
//           color: Colors.blue, // Change the color as needed
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: Row(
//                   children: [
//                     Image.asset(
//                       iconPath,
//                       width: 20.0,
//                       height: 20.0,
//                     ),
//                     SizedBox(width: 5),
//                     Column(
//                       children: [
//                         Text(
//                           title,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           percentage,
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(height: 8.0),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// */ /* ***********End Here 2nd attemmption  ***************************/

// /* *********** 3rd attemmption  ***************************/
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// import '../controllers/charttab_controller.dart';
// import '../core/values/colors.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// import 'card_widget.dart';

// class DashBoard extends StatefulWidget {
//   @override
//   State<DashBoard> createState() => _DashBoardState();
// }

// class _DashBoardState extends State<DashBoard> {
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ChartTabController>(
//       init: ChartTabController(),
//       builder: (mycontroller) {
//         return ModalProgressHUD(
//           inAsyncCall: mycontroller.loading,
//           child: Scaffold(
//             appBar: AppBar(
//               title: Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(right: 16.0),
//                     child: CircleAvatar(
//                       backgroundImage: AssetImage('images/fire icon.png'),
//                       radius: 20.0,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(right: 16.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Text(
//                           'John Doe',
//                           style: TextStyle(
//                             fontSize: 16.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           'Online',
//                           style: TextStyle(
//                             fontSize: 12.0,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               actions: [
//                 IconButton(
//                   icon: Icon(Icons.notifications),
//                   onPressed: () {
//                     // Handle notification icon tap
//                   },
//                 ),
//               ],
//             ),
//             body: Column(
//               children: [
//                 Row(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.all(16.0),
//                       child: CustomCard(iconPath: 'images/fire icon.png', title: 'Gas Level', status: '50%',),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(16.0),
//                       child: CustomCard(iconPath: 'images/temparature icon.png', title: 'Temparature', status: '50%',),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(16.0),
//                       child: CustomCard(iconPath: 'images/cylinder icon.png', title: 'Oxygen', status: '50%',),
//                     ),
//                   ],
//                 ),
// SizedBox(height:10),
//                  Row(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.all(16.0),
//                       child: CustomCard(iconPath: 'images/humidity icon.png', title: 'Humidity', status: '50%',),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(16.0),
//                       child: CustomCard(iconPath: 'images/valve switch icon.png', title: 'Shut off Bulb', status: '50%',),
//                     ),
                    
//                   ],
//                 ),
//                 DefaultTabController(
//                   length: 3,
//                   child: Column(
//                     children: [
//                       TabBar(
//                         tabs: [
//                           Tab(text: 'Kitchen'),
//                           Tab(text: 'Bedroom'),
//                           Tab(text: 'Drawing Room'),
//                         ],
//                       ),
//                       Container(
//                         height: MediaQuery.of(context).size.height - 300,
//                         child: TabBarView(
//                           children: [
//                             buildChart('Kitchen'),
//                             buildChart('Bedroom'),
//                             buildChart('Drawing Room'),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Row(
//                   children: [
//  Image.asset(
//                   'images/safe icon.png',
//                   width: 5,               //Getwidth * 0.4,
//                   height: 5                 //cardHeight * 0.4,
//                 ),
//                 Text(
//                       "Safe",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ]
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   // Widget buildCardList() {
//   //   return Column(
//   //     children: [
//   //       buildCardRow(
//   //         'images/fire icon.png',
//   //         'Gas Level ',
//   //         '50%',
//   //         'images/temparature icon.png',
//   //         'Temperature',
//   //         '60%',
//   //         'images/cylinder icon.png',
//   //         'Oxygen Level',
//   //         '70%',
//   //       ),
//   //       SizedBox(height: 16.0),
//   //       buildCardRowTwo(
//   //         'images/fire icon.png',
//   //         'Gas Level ',
//   //         '50%',
//   //         'images/temparature icon.png',
//   //         'Temperature',
//   //         '60%',
//   //       ),
//   //     ],
//   //   );
//   // }

//   Widget buildChart(String roomName) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 16.0),
//       child: SfCartesianChart(
//         primaryXAxis: NumericAxis(),
//         primaryYAxis: NumericAxis(),
//         series: <ChartSeries>[
//           LineSeries<double, double>(
//             dataSource: <double>[1, 2, 3, 4, 5],
//             xValueMapper: (double sales, _) => sales,
//             yValueMapper: (double sales, _) => sales,
//           ),
//         ],
//       ),
//     );
//   }

//   // Widget buildCardRow(
//   //   String iconPath1,
//   //   String title1,
//   //   String percentage1,
//   //   String iconPath2,
//   //   String title2,
//   //   String percentage2,
//   //   String iconPath3,
//   //   String title3,
//   //   String percentage3,
//   // ) {
//   //   return Row(
//   //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //     children: <Widget>[
//   //       buildCard(iconPath1, title1, percentage1),
//   //       buildCard(iconPath2, title2, percentage2),
//   //       buildCard(iconPath3, title3, percentage3),
//   //     ],
//   //   );
//   // }

//   // Widget buildCardRowTwo(
//   //   String iconPath1,
//   //   String title1,
//   //   String percentage1,
//   //   String iconPath2,
//   //   String title2,
//   //   String percentage2,
//   // ) {
//   //   return Row(
//   //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //     children: <Widget>[
//   //       buildCard(iconPath1, title1, percentage1),
//   //       buildCard(iconPath2, title2, percentage2),
//   //     ],
//   //   );
//   // }

//   // Widget buildCard(String iconPath, String title, String percentage) {
//   //   return Container(
//   //     height: 40.0,
//   //     width: 90,
//   //     decoration: BoxDecoration(
//   //       color: Colors.blue,
//   //       borderRadius: BorderRadius.circular(10.0),
//   //     ),
//   //     child: Center(
//   //       child: Column(
//   //         mainAxisAlignment: MainAxisAlignment.center,
//   //         children: [
//   //           Row(
//   //             children: [
//   //               Image.asset(
//   //                 iconPath,
//   //                 width: 20.0,
//   //                 height: 20.0,
//   //               ),
//   //               SizedBox(width: 5),
//   //               Column(
//   //                 children: [
//   //                   Text(
//   //                     title,
//   //                     style: TextStyle(
//   //                       color: Colors.white,
//   //                       fontWeight: FontWeight.bold,
//   //                     ),
//   //                   ),
//   //                   Text(
//   //                     percentage,
//   //                     style: TextStyle(
//   //                       color: Colors.white,
//   //                     ),
//   //                   ),
//   //                 ],
//   //               )
//   //             ],
//   //           ),
//   //           SizedBox(height: 8.0),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }
// }
// /*  ***********3rd attempt end her********** */