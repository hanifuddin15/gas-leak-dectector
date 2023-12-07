
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:wifi_iot/wifi_iot.dart';

// import '../controllers/wifi_list_controller.dart';
// //import 'WiFiController.dart';

// class WiFiListPage extends StatelessWidget {
//   final WiFiController wifiController = Get.put(WiFiController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Wi-Fi List'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Obx(() {
//               return Text('Connected Wi-Fi: ${wifiController.connectedSSID}');
//             }),
//             ElevatedButton(
//               onPressed: () {
//                 _showWiFiListDialog(context);
//               },
//               child: const Text('Connect to Another Wi-Fi'),
//             ),
//             Obx(() {
//               return Column(
//                 children: wifiController.scanResults.map((result) {
//                   return ListTile(
//                     title: Text(result!.ssid!),
//                     subtitle: Text('Signal Strength: ${result.level} dBm'),
//                   );
//                 }).toList(),
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _showWiFiListDialog(BuildContext context) async {
//     return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Connect to Wi-Fi'),
//           content: Column(
//             children: wifiController.scanResults.map((result) {
//               return ListTile(
//                 title: Text(result!.ssid!),
//                 subtitle: Text('Signal Strength: ${result.level} dBm'),
//                 onTap: () {
//                   _showPasswordDialog(context, result!.ssid!);
//                 },
//               );
//             }).toList(),
//           ),
//         );
//       },
//     );
//   }

//   Future<void> _showPasswordDialog(BuildContext context, String ssid) async {
//     String password = "";

//     return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Enter Wi-Fi Password'),
//           content: TextField(
//             onChanged: (value) {
//               password = value;
//             },
//             obscureText: true,
//             decoration: const InputDecoration(
//               hintText: 'Wi-Fi Password',
//             ),
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 Get.back();
//               },
//               child: const Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 wifiController.connectToWiFi(ssid, password);
//                 Get.back();
//               },
//               child: const Text('Connect'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wifi_iot/wifi_iot.dart';

import '../controllers/wifi_list_controller.dart';

class WiFiListPage extends StatelessWidget {
  final WiFiController wifiController = Get.put(WiFiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wi-Fi List'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Text('Connected Wi-Fi: ${wifiController.connectedSSID}');
            }),
            // ElevatedButton(
            //   onPressed: () {
            //  //   _showWiFiListDialog(context);
            //   },
            //   child: const Text('Connect to Another Wi-Fi'),
            // ),
            Obx(() {
              return Column(
                children: wifiController.scanResults.map((result) {
                  return ListTile(
                    title: Text(result!.ssid!),
                    subtitle: Text('Signal Strength: ${result.level} dBm'),
                    onTap: () {
                      _showPasswordDialog(context, result!.ssid!);
                    },
                  );
                }).toList(),
              );
            }),
          ],
        ),
      ),
    );
  }

  Future<void> _showWiFiListDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Connect to Wi-Fi'),
          content: Column(
            children: wifiController.scanResults.map((result) {
              return ListTile(
                title: Text(result!.ssid!),
                subtitle: Text('Signal Strength: ${result.level} dBm'),
                onTap: () {
                  _showPasswordDialog(context, result!.ssid!);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

 Future<void> _showPasswordDialog(BuildContext context, String ssid) async {
  String password = "";

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Enter Wi-Fi Password'),
        content: TextField(
          onChanged: (value) {
            password = value;
          },
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'Wi-Fi Password',
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              await wifiController.connectToWiFi(ssid, password);
              Get.back(); // Close the password dialog

              // Show a snackbar with feedback
              final connectedSSID = wifiController.connectedSSID;
              final isConnected = connectedSSID == ssid;

              Get.snackbar(
                isConnected ? 'Connected to Wi-Fi' : 'Connection Failed',
                isConnected ? 'Connected to $ssid' : 'Failed to connect to $ssid',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: isConnected ? Colors.green : Colors.red,
                colorText: Colors.white,
              );
            },
            child: const Text('Connect'),
          ),
        ],
      );
    },
  );
}

}
