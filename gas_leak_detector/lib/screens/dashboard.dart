import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../controllers/charttab_controller.dart';
import '../core/values/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'card_widget.dart';

class DashBoard extends StatefulWidget {
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardPadding = 16.0;
    double cardWidth = (screenWidth - cardPadding * 8) / 3; // Adjust the padding and card count as needed

    return GetBuilder<ChartTabController>(
      init: ChartTabController(),
      builder: (mycontroller) {
        return ModalProgressHUD(
          inAsyncCall: mycontroller.loading,
          child: Scaffold(
            appBar: AppBar(
              title: const Row(
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
                          'John Doe',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Online',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(cardPadding),
                        child: const CustomCard(
                          iconPath: 'images/fire icon.png',
                          title: 'Gas Level',
                          status: '50%',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(cardPadding),
                        child: const CustomCard(
                          iconPath: 'images/temparature icon.png',
                          title: 'Temperature',
                          status: '50%',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(cardPadding),
                        child: const CustomCard(
                          iconPath: 'images/cylinder icon.png',
                          title: 'Oxygen',
                          status: '50%',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(cardPadding),
                        child: const CustomCard(
                          iconPath: 'images/humidity icon.png',
                          title: 'Humidity',
                          status: '50%',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(cardPadding),
                        child: const CustomCard(
                          iconPath: 'images/valve switch icon.png',
                          title: 'Shut off Bulb',
                          status: '50%',
                        ),
                      ),
                    ],
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
                              buildChart('Kitchen'),
                              buildChart('Bedroom'),
                              buildChart('Drawing Room'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Image.asset(
                          'images/safe icon.png',
                          width: 5,
                        ),
                        const Text(
                          "Safe",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 50),
                          Padding(
                        padding: EdgeInsets.all(cardPadding),
                        child: const CustomCard(
                          iconPath: 'images/connected icon.png',
                          title: 'Connected',
                          status: '(200m)',
                        ),
                      ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(cardPadding),
                        child: const CustomCard(
                          iconPath: 'images/battery icon.png',
                          title: 'Battery Status',
                          status: '50%',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(cardPadding),
                        child: const CustomCard(
                          iconPath: 'images/electricity icon.png',
                          title: 'Electricity Status',
                          status: 'On',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(cardPadding),
                        child: const CustomCard(
                          iconPath: 'images/network icon.png',
                          title: 'GSM Status',
                          status: 'Strong',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
