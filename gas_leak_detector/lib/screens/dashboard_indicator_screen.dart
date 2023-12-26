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
   // double cardWidth = (screenWidth - cardPadding * 8) / 2; // Adjust the padding and card count as needed
      final ChartTabController mycontroller = Get.put(ChartTabController());
     //late final ChartTabController chartController;
 @override
  void initState() {
    super.initState();
    // Fetch data when the widget is created
    Get.find<ChartTabController>().fetchSensorData();
  }
    return WillPopScope(
       onWillPop: () async {
        // Handle the back button press
        // You can navigate to HomeScreen or perform any custom behavior here
        Get.off(GasLeakDetectorHomeScreen()); // Replace HomeScreen() with your actual home screen widget
        return false; // Return true to allow back navigation, return false to prevent it
      },
      child: GetBuilder<ChartTabController>(
        init: ChartTabController(),
        builder: (chartcontroller) {
      
          return ModalProgressHUD(
            inAsyncCall: chartcontroller.loading,
            child: Scaffold(
              appBar: AppBar(
                title:  Row(
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
                    onPressed: () {
                      // Handle notification icon tap
                    },
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(cardPadding),
                              child:  CustomCard(
                                iconPath: 'images/network icon.png',
                                title: 'Internet Status',
                                status: chartcontroller.deviceSensorData.value.sesnsorDevice?.deviceStatusData?.internetStatus ?? 'N/A',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(cardPadding),
                              child:  CustomCard(
                                iconPath: 'images/electricity icon.png',
                                title: 'Power Status',
                                status: chartcontroller.deviceSensorData.value.sesnsorDevice?.deviceStatusData?.powerStatus ?? 'N/A',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(cardPadding),
                              child:  CustomCard(
                                iconPath: 'images/network icon.png',
                                title: 'GSM Status',
                                status: chartcontroller.deviceSensorData.value.sesnsorDevice?.deviceStatusData?.gsmStatus ?? 'N/A'
                                    //?.sesnsorDevice?.sensorData?.gsmStatus ??
                                    'N/A',
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Row(children: [
                  
                        
                      // ],),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Row(
                          
                          children: [
                         CircularPercentIndicator(
                          radius: 70.0,
                          lineWidth: 10.0,
                          animation: true,
                          percent: double.parse(chartcontroller.deviceSensorData.value
                                  ?.sesnsorDevice?.sensorData?.first.gasConcentrationLevel ?? '0') /
                              100.0,
                          center: new Text(
                            chartcontroller.deviceSensorData.value
                                    ?.sesnsorDevice?.sensorData?.first.gasConcentrationLevel ??
                                'N/A',
                            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          header: new Text(
                            "Gas Level",
                            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: _getProgressColor(chartcontroller.deviceSensorData.value
                              ?.sesnsorDevice?.sensorData?.first.gasConcentrationLevel ?? '0'),
                        ),
                        SizedBox(width:10),
                                                           CircularPercentIndicator(
                          radius: 70.0,
                          lineWidth: 10.0,
                          animation: true,
                          percent: double.parse(chartcontroller.deviceSensorData.value
                                  ?.sesnsorDevice?.sensorData?.first.temperature ?? '0') /
                              100.0,
                          center: new Text(
                            chartcontroller.deviceSensorData.value
                                    ?.sesnsorDevice?.sensorData?.first.humidity ??
                                'N/A',
                            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          header: new Text(
                            "Humidity",
                            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: _getProgressColor(chartcontroller.deviceSensorData.value
                              ?.sesnsorDevice?.sensorData?.first.humidity ?? '0'),
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
                         percent: double.parse(chartcontroller.deviceSensorData.value
                                 ?.sesnsorDevice?.sensorData?.first.temperature ?? '0') /
                             100.0,
                         center: new Text(
                           chartcontroller.deviceSensorData.value
                                   ?.sesnsorDevice?.sensorData?.first.temperature ??
                               'N/A',
                           style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                         ),
                         header: new Text(
                           "Temperature",
                           style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                         ),
                         circularStrokeCap: CircularStrokeCap.round,
                         progressColor: _getProgressColor(chartcontroller.deviceSensorData.value
                             ?.sesnsorDevice?.sensorData?.first.temperature ?? '0'),
                       ),
                         ],
                       ),
                     ),
                           DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        const TabBar(
                          tabs: [
                            Tab(text: 'Kitchen'),
                            Tab(text: 'Bedroom'),
                            Tab(text: 'Drawing Room'),
                          ],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height - 300,
                          child: TabBarView(
                            children: [
                              // buildChart('Kitchen'),
                              // buildChart('Bedroom'),
                              // buildChart('Drawing Room'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                    ],
                  ),
                ),
              ),
            ),
          );
        //}
        },
      ),
    );
  }

  Widget buildChart(String roomName) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: SfCartesianChart(
        primaryXAxis: NumericAxis(),
        primaryYAxis: NumericAxis(),
        series: <ChartSeries>[
          LineSeries<double, double>(
            dataSource: <double>[1, 2, 3, 4, 5],
            xValueMapper: (double sales, _) => sales,
            yValueMapper: (double sales, _) => sales,
          ),
        ],
      ),
    );
  }
}

Color _getProgressColor(String gasConcentrationLevel) {
  double level = double.parse(gasConcentrationLevel);
  if (level <= 30) {
    return Colors.green;
  } else if (level <= 60) {
    return Colors.orange;
  } else {
    return Colors.red;
  }
}
