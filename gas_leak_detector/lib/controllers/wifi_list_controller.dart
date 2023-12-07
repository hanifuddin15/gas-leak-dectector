// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:wifi_iot/wifi_iot.dart';

// class WifiController extends GetxController {
//   RxBool isEnabled = false.obs;
//   RxBool isConnected = false.obs;
//   RxBool isWifiAPEnabled = false.obs;
//   RxBool isWifiAPSSIDHidden = false.obs;
//   RxBool isWifiAPSupported = true.obs;
//   RxBool isWifiEnableOpenSettings = false.obs;
//   RxBool isWifiDisableOpenSettings = false.obs;


   


//   RxList<WifiNetwork?> htResultNetwork = <WifiNetwork?>[].obs;
//   RxMap<String, bool> htIsNetworkRegistered = <String, bool>{}.obs;

//   RxString sPreviousAPSSID = "".obs;
//   RxString sPreviousPreSharedKey = "".obs;

//   RxBool isClientListVisible = false.obs;

//   void storeAndConnect(String psSSID, String psKey) async {
//     storeAPInfos();
//     await WiFiForIoTPlugin.setWiFiAPSSID(psSSID);
//     await WiFiForIoTPlugin.setWiFiAPPreSharedKey(psKey);
//   }

//   void storeAPInfos() async {
//     String? sAPSSID;
//     String? sPreSharedKey;

//     try {
//       sAPSSID = await WiFiForIoTPlugin.getWiFiAPSSID();
//     } on PlatformException {
//       sAPSSID = "";
//     }

//     try {
//       sPreSharedKey = await WiFiForIoTPlugin.getWiFiAPPreSharedKey();
//     } on PlatformException {
//       sPreSharedKey = "";
//     }

//     sPreviousAPSSID.value = sAPSSID!;
//     sPreviousPreSharedKey.value = sPreSharedKey!;
//   }

//   void restoreAPInfos() async {
//     await WiFiForIoTPlugin.setWiFiAPSSID(sPreviousAPSSID.value);
//     await WiFiForIoTPlugin.setWiFiAPPreSharedKey(sPreviousPreSharedKey.value);
//   }

//   Future<List<String>> getWiFiAPInfos() async {
//     String? sAPSSID;
//     String? sPreSharedKey;

//     try {
//       sAPSSID = await WiFiForIoTPlugin.getWiFiAPSSID();
//     } on Exception {
//       sAPSSID = "";
//     }

//     try {
//       sPreSharedKey = await WiFiForIoTPlugin.getWiFiAPPreSharedKey();
//     } on Exception {
//       sPreSharedKey = "";
//     }

//     return [sAPSSID!, sPreSharedKey!];
//   }

//   Future<WIFI_AP_STATE?> getWiFiAPState() async {
//     int? iWiFiState;

//     WIFI_AP_STATE? wifiAPState;

//     try {
//       iWiFiState = await WiFiForIoTPlugin.getWiFiAPState();
//     } on Exception {
//       iWiFiState = WIFI_AP_STATE.WIFI_AP_STATE_FAILED.index;
//     }

//     if (iWiFiState == WIFI_AP_STATE.WIFI_AP_STATE_DISABLING.index) {
//       wifiAPState = WIFI_AP_STATE.WIFI_AP_STATE_DISABLING;
//     } else if (iWiFiState == WIFI_AP_STATE.WIFI_AP_STATE_DISABLED.index) {
//       wifiAPState = WIFI_AP_STATE.WIFI_AP_STATE_DISABLED;
//     } else if (iWiFiState == WIFI_AP_STATE.WIFI_AP_STATE_ENABLING.index) {
//       wifiAPState = WIFI_AP_STATE.WIFI_AP_STATE_ENABLING;
//     } else if (iWiFiState == WIFI_AP_STATE.WIFI_AP_STATE_ENABLED.index) {
//       wifiAPState = WIFI_AP_STATE.WIFI_AP_STATE_ENABLED;
//     } else if (iWiFiState == WIFI_AP_STATE.WIFI_AP_STATE_FAILED.index) {
//       wifiAPState = WIFI_AP_STATE.WIFI_AP_STATE_FAILED;
//     }

//     return wifiAPState!;
//   }

//   Future<List<APClient>> getClientList(bool onlyReachables, int reachableTimeout) async {
//     List<APClient> htResultClient;

//     try {
//       htResultClient = await WiFiForIoTPlugin.getClientList(onlyReachables, reachableTimeout);
//     } on PlatformException {
//       htResultClient = <APClient>[];
//     }

//     return htResultClient;
//   }

//   Future<List<WifiNetwork>> loadWifiList() async {
//     List<WifiNetwork> htResultNetwork;
//     try {
//       htResultNetwork = await WiFiForIoTPlugin.loadWifiList();
//     } on PlatformException {
//       htResultNetwork = <WifiNetwork>[];
//     }

//     return htResultNetwork;
//   }

//   Future<void> isRegisteredWifiNetwork(String ssid) async {
//     bool bIsRegistered;

//     try {
//       bIsRegistered = await WiFiForIoTPlugin.isRegisteredWifiNetwork(ssid);
//     } on PlatformException {
//       bIsRegistered = false;
//     }

//     htIsNetworkRegistered[ssid] = bIsRegistered;
//   }

//   void showClientList() async {
//     isClientListVisible.value = true;
//     getClientList(false, 300).then((val) {
//       val.forEach((oClient) {
//         print("************************");
//         print("Client :");
//         print("ipAddr = '${oClient.ipAddr}'");
//         print("hwAddr = '${oClient.hwAddr}'");
//         print("device = '${oClient.device}'");
//         print("isReachable = '${oClient.isReachable}'");
//         print("************************");
//       });
//     });
//   }
//   void checkWiFiStatus() {
//     WiFiForIoTPlugin.isEnabled().then((val) {
//       isEnabled.value = val;
//     });

//     if (isEnabled.value) {
//       WiFiForIoTPlugin.isConnected().then((val) {
//         isConnected.value = val;
//       });
//     }

//     if (isWifiAPSupported.value) {
//       WiFiForIoTPlugin.isWiFiAPEnabled().then((val) {
//         isWifiAPEnabled.value = val;
//       });

//       WiFiForIoTPlugin.isWiFiAPSSIDHidden().then((val) {
//         isWifiAPSSIDHidden.value = val;
//       });
//     }
//   }

//   // Add other methods and variables as needed
//   Widget getWidgets() {
//     WiFiForIoTPlugin.isConnected().then((val) {
//       isConnected.value = val;
//     });

//     // disable scanning for ios as not supported
//     if (isConnected.value || Platform.isIOS) {
//       htResultNetwork.clear(); // Use clear() instead of setting it to null
//     }

//     if (htResultNetwork.isNotEmpty) {
//       final List<ListTile> htNetworks = <ListTile>[];

//       htResultNetwork.forEach((oNetwork) {
//         final PopupCommand oCmdConnect = PopupCommand("Connect", oNetwork!.ssid!);
//         final PopupCommand oCmdRemove = PopupCommand("Remove", oNetwork.ssid!);

//         final List<PopupMenuItem<PopupCommand>> htPopupMenuItems = [];

//         htPopupMenuItems.add(
//           PopupMenuItem<PopupCommand>(
//             value: oCmdConnect,
//             child: const Text('Connect'),
//           ),
//         );

//         isRegisteredWifiNetwork(oNetwork.ssid!);

//         if (htIsNetworkRegistered.containsKey(oNetwork.ssid) &&
//             htIsNetworkRegistered[oNetwork.ssid]!) {
//           htPopupMenuItems.add(
//             PopupMenuItem<PopupCommand>(
//               value: oCmdRemove,
//               child: const Text('Remove'),
//             ),
//           );
//         }

//         htNetworks.add(
//           ListTile(
//             title: Obx(() => Text(
//               "" + oNetwork.ssid! +
//                   ((htIsNetworkRegistered.containsKey(oNetwork.ssid) &&
//                           htIsNetworkRegistered[oNetwork.ssid]!)
//                       ? " *"
//                       : ""),
//             )),
//             trailing: PopupMenuButton<PopupCommand>(
//               padding: EdgeInsets.zero,
//               onSelected: (PopupCommand poCommand) {
//                 switch (poCommand.command) {
//                   case "Connect":
//                     WiFiForIoTPlugin.connect(
//                       STA_DEFAULT_SSID,
//                       password: STA_DEFAULT_PASSWORD,
//                       joinOnce: true,
//                       security: STA_DEFAULT_SECURITY,
//                     );
//                     break;
//                   case "Remove":
//                     WiFiForIoTPlugin.removeWifiNetwork(poCommand.argument);
//                     break;
//                   default:
//                     break;
//                 }
//               },
//               itemBuilder: (BuildContext context) => htPopupMenuItems,
//             ),
//           ),
//         );
//       });

//       return ListView(
//         padding: kMaterialListPadding,
//         children: htNetworks,
//       );
//     } else {
//       return SingleChildScrollView(
//         child: SafeArea(
//           child: Column(
//             children: Platform.isIOS
//                 ? getButtonWidgetsForiOS()
//                 : getButtonWidgetsForAndroid(),
//           ),
//         ),
//       );
//     }
//   }
  
// }
// WiFiListController.dart



// WiFiController.dart
import 'package:get/get.dart';
import 'package:wifi_iot/wifi_iot.dart';
// WiFiController.dart
import 'package:get/get.dart';
import 'package:wifi_iot/wifi_iot.dart';

class WiFiController extends GetxController {
  var scanResults = <WifiNetwork?>[].obs;
  var connectedSSID = "".obs;

  @override
  void onInit() {
    super.onInit();
    _initWiFi();
  }

  Future<void> _initWiFi() async {
    await WiFiForIoTPlugin.setEnabled(true);
    updateWiFiList();
    updateConnectedSSID();
  }

  Future<void> updateWiFiList() async {
    final results = await WiFiForIoTPlugin.loadWifiList();
    scanResults.value = results;
  }

  Future<void> updateConnectedSSID() async {
    final ssid = await WiFiForIoTPlugin.getSSID();
    connectedSSID.value = ssid ?? "";
  }

  Future<void> connectToWiFi(String ssid, String password) async {
   // await WiFiForIoTPlugin.connect(ssid, password, joinOnce: false);
   await WiFiForIoTPlugin.connect(ssid, password: 'your_password');

    await updateConnectedSSID();
  }
}
